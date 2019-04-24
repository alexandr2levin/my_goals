
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:my_goals/data/goal.dart';
import 'package:my_goals/domain/goals_manager.dart';
import 'package:my_goals/presentation/screens/goals/goals_screen.dart';

part 'goals.g.dart';

class GoalsPresenter {

  GoalsView view;
  GoalsManager goalsManager;

  GoalsPresenter(this.view, this.goalsManager);

  void loadGoals() async {
    view.viewState = GoalsViewState((b) => b
      ..loading = true
    );

    var goals = await goalsManager.getGoals();
    view.viewState = GoalsViewState((b) => b
      ..goals = goals.toBuilder()
      ..loading = false
    );
  }

}

abstract class GoalsViewState implements Built<GoalsViewState, GoalsViewStateBuilder> {

  bool get loading;
  BuiltList<Goal> get goals;

  GoalsViewState._();
  factory GoalsViewState([updates(GoalsViewStateBuilder b)]) = _$GoalsViewState;
}