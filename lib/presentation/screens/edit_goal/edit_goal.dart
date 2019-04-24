

import 'package:built_value/built_value.dart';
import 'package:my_goals/data/goal.dart';
import 'package:my_goals/domain/goals_manager.dart';
import 'package:my_goals/presentation/screens/edit_goal/edit_goal_screen.dart';

part 'edit_goal.g.dart';

abstract class EditGoalView {
  EditGoalModel model;
  void routeBack();
}

class EditGoalPresenter {

  EditGoalView view;
  GoalsManager goalsManager;

  int goalId;

  get editMode => goalId == null;

  EditGoalPresenter(this.view, this.goalsManager, this.goalId);

  void loadGoal() async {
    view.model = EditGoalModel((b) => b
        ..loading = true
        ..saving = false
    );

    if(editMode) {
      var goal = await goalsManager.getGoal(goalId);
      view.model = view.model.rebuild((b) => b
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
      view.model = view.model.rebuild((b) => b
        ..mode = EditGoalMode.create
        ..loading = false
        ..goal = newGoal.toBuilder()
      );
    }
  }

  void save() async {
    view.model = view.model.rebuild((b) => b
      ..saving = true
    );

    await goalsManager.saveGoal(view.model.goal);

    view.routeBack();
  }
}

abstract class EditGoalModel implements Built<EditGoalModel, EditGoalModelBuilder> {

  @nullable
  EditGoalMode get mode;
  bool get loading;
  bool get saving;
  @nullable
  Goal get goal;

  EditGoalModel._();
  factory EditGoalModel([updates(EditGoalModelBuilder b)]) = _$EditGoalModel;
}

enum EditGoalMode {
  create,
  edit
}