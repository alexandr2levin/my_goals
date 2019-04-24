
import 'package:built_collection/built_collection.dart';
import 'package:my_goals/data/goal.dart';

class GoalsManager {

  BuiltList<Goal> goals = BuiltList<Goal>();

  Future<BuiltList<Goal>> getGoals() async {
    await Future.delayed(Duration(seconds: 1));
    return goals;
  }

  Future<Goal> getGoal(int id) async {
    await Future.delayed(Duration(seconds: 1));
    var goal = goals.firstWhere((goal) => goal.id == id, orElse: null);
    if(goal == null) throw 'goal with id "$id" not found';
    return goal;
  }

  Future<bool> exists(int id) async {
    return goals.any((goal) => goal.id == id);
  }

  Future<void> saveGoal(Goal goal) async {
    await Future.delayed(Duration(seconds: 1));

    if(await exists(goal.id)) {
      // replace old one with new one
      goals = goals.rebuild((b) => b
          ..map((savedGoal) {
            if(savedGoal.id == goal.id) {
              // replace if id matches
              return goal;
            } else {
              return savedGoal;
            }
          })
      );
    } else {
      // append new one
      goals = goals.rebuild((b) => b
          ..add(goal)
      );
    }
  }

}