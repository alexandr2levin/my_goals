
import 'package:built_value/built_value.dart';

part 'goal.g.dart';

abstract class Goal implements Built<Goal, GoalBuilder> {

  int get id;
  String get name;
  @nullable
  DateTime get date;

  Goal._();
  factory Goal([void Function(GoalBuilder) updates]) = _$Goal;
}
