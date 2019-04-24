
import 'package:built_value/built_value.dart';

part 'goal.g.dart';

abstract class Goal implements Built<Goal, GoalBuilder> {

  String get name;
  DateTime get date;

  Goal._();
  factory Goal([void Function(GoalBuilder) updates]) = _$Goal;
}
