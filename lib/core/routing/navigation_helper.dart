import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';

/// Centralized navigation helpers for cleaner call-sites.
void goToHome(BuildContext context) {
  context.go(RouteNames.home);
}

void goToAddHabit(BuildContext context) {
  context.go(RouteNames.addHabit);
}

void goToSettings(BuildContext context) {
  context.go(RouteNames.settings);
}

/// Example for pushing a details page with path parameter
void pushHabitDetail(BuildContext context, String habitId) {
  context.push('${RouteNames.habitDetail}/$habitId');
}


