

import 'package:my_goals/domain/goals_manager.dart';
import 'package:my_goals/presentation/screens/goals/goals_screen.dart';

class GoalsPresenter {

  GoalsView view;

  GoalsManager goalsManager;

  GoalsPresenter(this.view);

  void loadGoals() async {
    var goals = await goalsManager.getGoals();
    view.goals = goals;
  }

}