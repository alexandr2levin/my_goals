
import 'package:flutter/cupertino.dart';
import 'package:my_goals/data/goal.dart';
import 'package:my_goals/presentation/screens/goals/goals_presentation.dart';
import 'package:my_goals/presentation/screens/routes.dart';
import 'package:built_collection/built_collection.dart';

class GoalsScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _GoalsScreenState();

}

abstract class GoalsView {
  BuiltList<Goal> goals;
}

class _GoalsScreenState extends State<GoalsScreen> implements GoalsView {

  @override
  set goals(BuiltList<Goal> goals) {
    setState(() {
      print('goals count is ${goals.length}');
      _goals = goals;
    });
  }
  get goals {
    return _goals;
  }

  var _goals = BuiltList<Goal>();

  GoalsPresenter _presenter;

  _GoalsScreenState() {
    _presenter = GoalsPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.loadGoals();
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
            Navigator.of(context).pushNamed(Routes.editGoal);
          },
        ),
      ),
      child: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Text(
        'Тут пусто :с',
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }

}