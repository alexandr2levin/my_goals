import 'package:flutter/cupertino.dart';
import 'package:my_goals/domain/goals_manager.dart';
import 'package:my_goals/presentation/screens/edit_goal/edit_goal_screen.dart';
import 'package:my_goals/presentation/screens/goals/goals.dart';
import 'package:my_goals/presentation/screens/goals/goals_screen.dart';
import 'package:my_goals/presentation/screens/routes.dart';

void main() {
  var goalsManager = GoalsManager();

  runApp(MyApp(goalsManager));
}

class MyApp extends StatelessWidget {

  final GoalsManager goalsManager;

  MyApp(this.goalsManager);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Мои цели',
      theme: CupertinoThemeData(),
      initialRoute: Routes.goals,
      onGenerateRoute: (routeSettings) {
        switch(routeSettings.name) {
          case Routes.goals:
            return CupertinoPageRoute(
              builder: (context) => GoalsScreen(goalsManager),
            );
          case Routes.createGoal:
            return CupertinoPageRoute(
              builder: (context) => EditGoalScreen.createMode(goalsManager),
            );
          case Routes.editGoal:
            var goalId = routeSettings.arguments as int;
            return CupertinoPageRoute(
              builder: (context) => EditGoalScreen.editMode(goalsManager, goalId),
            );
          default:
            throw 'no case for route name ${routeSettings.name}';
        }
      },
    );
  }

}