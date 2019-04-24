
import 'package:flutter/cupertino.dart';
import 'package:my_goals/presentation/screens/edit_goal/edit_goal.dart';

class EditGoalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditGoalsScreenState();

}

class _EditGoalsScreenState extends State<EditGoalScreen> implements EditGoalView {

  @override
  set viewState(EditGoalViewState viewState) {
    setState(() {
      _viewState = viewState;
    });
  }
  @override
  get viewState {
    return _viewState;
  }
  EditGoalViewState _viewState;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Создать цель'),
      ),
      child: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Text(
        'А тут создание',
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }

  @override
  void routeBack() {
    Navigator.of(context).pop();
  }

}