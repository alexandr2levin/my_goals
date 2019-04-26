
import 'package:flutter/cupertino.dart';
import 'package:my_goals/data/goal.dart';
import 'package:my_goals/domain/goals_manager.dart';
import 'package:my_goals/presentation/screens/edit_goal/date_countdown_text.dart';
import 'package:my_goals/presentation/screens/goals/goals.dart';
import 'package:my_goals/presentation/screens/routes.dart';
import 'package:built_collection/built_collection.dart';

class GoalsScreen extends StatefulWidget {

  final GoalsManager goalsManager;

  GoalsScreen(this.goalsManager);

  @override
  State<StatefulWidget> createState() => _GoalsScreenState();

}

class _GoalsScreenState extends State<GoalsScreen> implements GoalsView {

  @override
  set model(GoalsModel model) {
    setState(() {
      _model = model;
    });
  }
  @override
  get model {
    return _model;
  }
  GoalsModel _model;

  GoalsPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = GoalsPresenter(this, widget.goalsManager);
    _presenter.observeGoals();
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Мои цели'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text('Добавить'),
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.createGoal);
          },
        ),
      ),
      child: _body(),
    );
  }

  Widget _body() {
    if(model == null) return Container();
    if(model.loading) {
      return Center(
        child: Text('Загрузка...'),
      );
    }
    if(model.goals.isEmpty) {
      return Center(
        child: Text(
          'Тут пусто :с',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      );
    } else {
      return _goals();
    }
  }

  Widget _goals() {
    return ListView.builder(
      itemCount: model.goals.length,
      itemBuilder: (context, i) {
        var goal = model.goals[i];

        var date = goal.date;
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.editGoal, arguments: goal.id);
          },
          child: Container(
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: CupertinoColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  goal.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DateCountdownText(to: date),
              ],
            ),
          ),
        );
      },
    );
  }

}