
import 'package:flutter/cupertino.dart';
import 'package:my_goals/domain/goals_manager.dart';
import 'package:my_goals/presentation/screens/edit_goal/edit_goal.dart';

class EditGoalScreen extends StatefulWidget {

  final GoalsManager goalsManager;
  final int goalId;

  EditGoalScreen({
    @required this.goalsManager,
    this.goalId,
  });

  factory EditGoalScreen.editMode(GoalsManager goalsManager, int goalId) {
    return EditGoalScreen(
      goalsManager: goalsManager,
      goalId: goalId,
    );
  }
  factory EditGoalScreen.createMode(GoalsManager goalsManager) {
    return EditGoalScreen(
      goalsManager: goalsManager,
      goalId: null,
    );
  }

  @override
  State<StatefulWidget> createState() => _EditGoalsScreenState();

}

class _EditGoalsScreenState extends State<EditGoalScreen> implements EditGoalView {

  @override
  set model(EditGoalModel model) {
    setState(() {
      _model = model;

      if(model.goal != null) {
        if(_nameTextController.text != model.goal.name) {
          _nameTextController.text = model.goal.name;
        }

        var date = model.goal.date;
        var formattedDateTime = date != null ? '${date.day}.${date.month}.${date.year}' : '';
        _dateTextController.text = formattedDateTime;
      }
    });
  }
  @override
  get model {
    return _model;
  }
  EditGoalModel _model;

  EditGoalPresenter _presenter;

  var _nameTextController = TextEditingController();
  var _dateTextController = TextEditingController();

  var _nameInvalid = false;
  var _dateInvalid = false;

  @override
  void initState() {
    super.initState();
    _presenter = EditGoalPresenter(this, widget.goalsManager, widget.goalId);
    _presenter.loadGoal();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _dateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          model.mode == EditGoalMode.edit
              ? 'Править цель'
              : model.mode == EditGoalMode.create
              ? 'Создать цель'
              : 'Загрузка...',
        ),
      ),
      child: SafeArea(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    if(_model == null) return Container();
    if(_model.saving || _model.loading) {
      return Center(
        child: Text('Подожди секунду...'),
      );
    }
    return _editForm();
  }

  Widget _editForm() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CupertinoTextField(
            controller: _nameTextController,
            placeholder: 'Название твоей цели',
            onChanged: (text) {
              model = model.rebuild((b) => b
                  ..goal.name = text
              );
              setState(() {
                _nameInvalid = false;
              });
            },
          ),
          _error(_nameInvalid, 'Укажи название'),
          SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
              print('pick date');
              _pickDate();
              setState(() {
                _dateInvalid = false;
              });
            },
            child: Container(
              color: CupertinoColors.white.withOpacity(0.0),
              child: IgnorePointer(
                ignoring: true,
                child: CupertinoTextField(
                  controller: _dateTextController,
                  placeholder: 'Дата',
                ),
              ),
            ),
          ),
          _error(_dateInvalid, 'Укажи дату'),
          SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            child: CupertinoButton.filled(
              child: Text(model.mode == EditGoalMode.edit ? 'Сохранить' : 'Создать'),
              onPressed: () {
                _save();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _error(bool show, String text) {
    if(show) {
      return Padding(
        padding: EdgeInsets.only(left: 6.0, top: 4.0),
        child: Text(
          text,
          style: TextStyle(
              color: Color.fromARGB(255, 255, 0, 0),
              fontSize: 14.0
          ),
          textAlign: TextAlign.start,
        ),
      );
    } else {
      return Container();
    }
  }

  void _pickDate() {
    var now = DateTime.now();

    var initialDate = model.goal.date;
    if(initialDate == null) {
      initialDate = now;
    }
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 180.0,
          child: DefaultTextStyle(
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 20.0,
            ),
            child: GestureDetector(
              // Blocks taps from propagating to the modal sheet and popping.
              onTap: () { },
              child: SafeArea(
                top: false,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: initialDate,
                  minimumYear: now.year,
                  onDateTimeChanged: (dateTime) {
                    model = model.rebuild((b) => b
                      ..goal.date = dateTime
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _save() {
    model = model.rebuild((b) => b
        ..goal.name = _nameTextController.text
    );

    if(model.goal.name.isEmpty) {
      _nameInvalid = true;
    }
    if(model.goal.date == null) {
      _dateInvalid = true;
    }

    if(_nameInvalid || _dateInvalid) {
      setState(() {}); // to build errors
      return;
    }

    _presenter.save();
  }

  @override
  void routeBack() {
    Navigator.of(context).pop();
  }

}