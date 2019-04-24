
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
  State<StatefulWidget> createState() => _EditGoalsScreenState(goalsManager);

}

class _EditGoalsScreenState extends State<EditGoalScreen> implements EditGoalView {

  @override
  set model(EditGoalModel viewState) {
    setState(() {
      _model = viewState;

      _nameTextController.text = viewState.goal.name;

      var date = viewState.goal.date;
      var formattedDateTime = '${date.day}.${date.month}.${date.year}';
      _dateTextController.text = formattedDateTime;
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

  _EditGoalsScreenState(GoalsManager goalsManager) {
    _presenter = EditGoalPresenter(this, goalsManager, widget.goalId);
  }

  @override
  void initState() {
    super.initState();
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
        middle: Text(model.mode == EditGoalMode.edit ? 'Править цель' : 'Создать цель'),
      ),
      child: _body(),
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
    return Column(
      children: <Widget>[
        CupertinoTextField(
          controller: _nameTextController,
          placeholder: 'Название твоей цели',
          onChanged: (text) {
            setState(() {
              _nameInvalid = false;
            });
          },
        ),
        GestureDetector(
          onTap: () {
            _pickDate();
            setState(() {
              _dateInvalid = false;
            });
          },
          child: IgnorePointer(
            ignoring: true,
            child: CupertinoTextField(
              controller: _dateTextController,
              placeholder: 'Дата',
            ),
          ),
        ),
        CupertinoButton.filled(
          child: Text(model.mode == EditGoalMode.edit ? 'Сохранить' : 'Создать'),
          onPressed: () {
            _save();
          },
        )
      ],
    );
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
                  maximumYear: initialDate.year,
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