
import 'package:flutter/cupertino.dart';

class EditGoalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditGoalsScreenState();

}

class _EditGoalsScreenState extends State<EditGoalScreen> {

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

}