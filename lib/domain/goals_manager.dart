
import 'package:built_collection/built_collection.dart';
import 'package:my_goals/data/goal.dart';

class GoalsManager {

  Future<BuiltList<Goal>> getGoals() async {
    return BuiltList<Goal>([
      Goal(),
    ]);
  }

}