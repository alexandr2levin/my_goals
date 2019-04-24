

import 'package:built_value/built_value.dart';
import 'package:my_goals/data/goal.dart';
import 'package:my_goals/domain/goals_manager.dart';
import 'package:my_goals/presentation/screens/edit_goal/edit_goal_screen.dart';

part 'edit_goal.g.dart';

abstract class EditGoalView {
  EditGoalViewState viewState;
  void routeBack();
}

class EditGoalPresenter {

  EditGoalView view;
  GoalsManager goalsManager;

  int goalId;

  get editMode => goalId == null;

  EditGoalPresenter(this.view, this.goalsManager, this.goalId);

  void loadGoal() async {
    view.viewState = EditGoalViewState((b) => b
        ..loading = true
        ..saving = false
    );

    if(editMode) {
      var goal = await goalsManager.getGoal(goalId);
      view.viewState = view.viewState.rebuild((b) => b
        ..mode = EditGoalMode.edit
        ..loading = false
        ..goal = goal.toBuilder()
      );
    } else {
      var newGoal = Goal((b) => b
        ..id = -1
        ..name = ''
        ..date = null
      );
      view.viewState = view.viewState.rebuild((b) => b
        ..mode = EditGoalMode.create
        ..loading = false
        ..goal = newGoal.toBuilder()
      );
    }
  }

  void save() async {
    view.viewState = view.viewState.rebuild((b) => b
      ..saving = true
    );

    await goalsManager.saveGoal(view.viewState.goal);

    view.routeBack();
  }
}

abstract class EditGoalViewState implements Built<EditGoalViewState, EditGoalViewStateBuilder> {

  @nullable
  EditGoalMode get mode;
  bool get loading;
  bool get saving;
  @nullable
  Goal get goal;

  EditGoalViewState._();
  factory EditGoalViewState([updates(EditGoalViewStateBuilder b)]) = _$EditGoalViewState;
}

enum EditGoalMode {
  create,
  edit
}