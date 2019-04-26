
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:my_goals/data/goal.dart';
import 'package:rxdart/rxdart.dart';

class GoalsManager {

  var _goals = BuiltList<Goal>();
  var _goalsSubject = BehaviorSubject<BuiltList<Goal>>();

  var _random = Random();

  GoalsManager() {
    _goalsSubject.add(_goals);
  }

  Future<BuiltList<Goal>> getGoals() async {
    await Future.delayed(Duration(seconds: 1));
    return _goals;
  }

  Stream<BuiltList<Goal>> observeGoals() async* {
    yield* _goalsSubject;
  }

  Future<Goal> getGoal(int id) async {
    await Future.delayed(Duration(seconds: 1));
    var goal = _goals.firstWhere((goal) => goal.id == id, orElse: () => null);
    if(goal == null) throw 'goal with id "$id" not found';
    return goal;
  }

  Future<bool> exists(int id) async {
    return _goals.any((goal) => goal.id == id);
  }

  Future<void> saveGoal(Goal goal) async {
    await Future.delayed(Duration(seconds: 1));

    if(await exists(goal.id)) {
      // replace old one with new one
      _goals = _goals.rebuild((b) => b
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
      _goals = _goals.rebuild((b) => b
          ..add(goal.rebuild((b) => b.id = _random.nextInt(1<<32)))
      );
    }
    _goalsSubject.add(_goals);
  }

}