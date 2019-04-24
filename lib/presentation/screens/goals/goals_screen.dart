
import 'package:flutter/cupertino.dart';
import 'package:my_goals/data/goal.dart';
import 'package:my_goals/domain/goals_manager.dart';
import 'package:my_goals/presentation/screens/goals/goals.dart';
import 'package:my_goals/presentation/screens/routes.dart';
import 'package:built_collection/built_collection.dart';

class GoalsScreen extends StatefulWidget {

  final GoalsManager goalsManager;

  GoalsScreen(this.goalsManager);

  @override
  State<StatefulWidget> createState() => _GoalsScreenState(goalsManager);

}

abstract class GoalsView {
  GoalsViewState viewState;
}

class _GoalsScreenState extends State<GoalsScreen> implements GoalsView {

  @override
  set viewState(GoalsViewState viewState) {
    setState(() {
      _viewState = viewState;
    });
  }
  @override
  get viewState {
    return _viewState;
  }
  GoalsViewState _viewState;

  GoalsPresenter _presenter;

  _GoalsScreenState(GoalsManager goalsManager) {
    _presenter = GoalsPresenter(this, goalsManager);
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
    if(viewState == null) return Container();
    if(viewState.loading) {
      return Center(
        child: Text('Загрузка...'),
      );
    }
    if(viewState.goals.isEmpty) {
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
      itemCount: viewState.goals.length,
      itemBuilder: (context, i) {
        var goal = viewState.goals[i];
        return Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Column(
            children: <Widget>[
              Text(goal.name),
              Text(goal.date.toString()),
            ],
          ),
        );
      },
    );
  }

}