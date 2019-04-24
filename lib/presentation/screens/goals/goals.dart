
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:my_goals/data/goal.dart';
import 'package:my_goals/domain/goals_manager.dart';
import 'package:my_goals/presentation/screens/goals/goals_screen.dart';

part 'goals.g.dart';

abstract class GoalsView {
  GoalsModel model;
}

class GoalsPresenter {

  GoalsView view;
  GoalsManager goalsManager;

  GoalsPresenter(this.view, this.goalsManager);

  void loadGoals() async {
    view.model = GoalsModel((b) => b
      ..loading = true
    );

    var goals = await goalsManager.getGoals();
    view.model = GoalsModel((b) => b
      ..goals = goals.toBuilder()
      ..loading = false
    );
  }

}

abstract class GoalsModel implements Built<GoalsModel, GoalsModelBuilder> {

  bool get loading;
  BuiltList<Goal> get goals;

  GoalsModel._();
  factory GoalsModel([updates(GoalsModelBuilder b)]) = _$GoalsModel;
}