import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fefu_schedule/router.dart';

class AppNavigator {
  static void goToSchedule() {
    // rootNavigatorKey.currentContext!.go("/dashboard");
    Router.neglect(rootNavigatorKey.currentContext!, () => rootNavigatorKey.currentContext!.go("/schedule"));
  }

  static void goToSearch() {
    // rootNavigatorKey.currentContext!.go("/dashboard");
    Router.neglect(rootNavigatorKey.currentContext!, () => rootNavigatorKey.currentContext!.go("/search"));
  }

  static void goToProfile() {
    // rootNavigatorKey.currentContext!.go("/dashboard");
    Router.neglect(rootNavigatorKey.currentContext!, () => rootNavigatorKey.currentContext!.go("/profile"));
  }
}
