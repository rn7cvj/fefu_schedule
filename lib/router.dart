import 'package:fefu_schedule/i18n/strings.g.dart';
import 'package:fefu_schedule/logger.dart';
import 'package:fefu_schedule/navigation/scaffold.dart';
import 'package:fefu_schedule/pages/profile/profile.dart';
import 'package:fefu_schedule/pages/schedule/schedule.dart';
import 'package:fefu_schedule/pages/search/search.dart';
import 'package:fefu_schedule/pages/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigationKey = GlobalKey<NavigatorState>();

final Map<String, int> routeIndex = {
  "/schedule": 0,
  "/search": 1,
  "/profile": 2,
};

final GoRouter router = GoRouter(
  routerNeglect: true,
  navigatorKey: rootNavigatorKey,
  initialLocation: "/schedule",
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigationKey,
      builder: (context, state, child) {
        return ScaffoldWithGNavbar(
          state: state,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: "/schedule",
          name: t.schedule.label,
          // builder: (context, state) => const Schedule(),
          // pageBuilder: (context, state) => const MaterialPage(child: Schedule()),
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: const Schedule(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              Offset begin = const Offset(-1.0, 0.0);
              Offset end = Offset.zero;
              Tween<Offset> tween = Tween(begin: begin, end: end);
              Animation<Offset> offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
        ),
        GoRoute(
          path: "/search",
          name: t.search.label,
          // builder: (context, state) => const Search(),
          // pageBuilder: (context, state) => const MaterialPage(child: Search()),
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: const Search(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              Offset begin = calculateBeginOffset((state.extra as Map<String, dynamic>)['previousRoute'], "/search");
              Offset end = Offset.zero;
              Tween<Offset> tween = Tween(begin: begin, end: end);
              Animation<Offset> offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
        ),
        GoRoute(
          path: "/profile",
          name: t.profile.label,
          // builder: (context, state) => const Profile(),
          // pageBuilder: (context, state) => const MaterialPage(child: Profile()),
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: const Profile(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              Offset begin = const Offset(1.0, 0.0);
              Offset end = Offset.zero;
              Tween<Offset> tween = Tween(begin: begin, end: end);
              Animation<Offset> offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
          routes: [
            GoRoute(
              path: "settings",
              name: t.settings.label,
              builder: (context, state) => Settings(),
            )
          ],
        ),
      ],
    ),
  ],
);

Offset calculateBeginOffset(String previousRoute, String currentRoute) {
  if (routeIndex[previousRoute]! < routeIndex[currentRoute]!) return const Offset(1.0, 0.0);
  if (routeIndex[previousRoute]! == routeIndex[currentRoute]!) return const Offset(0.0, 0.0);
  if (routeIndex[previousRoute]! > routeIndex[currentRoute]!) return const Offset(-1.0, 0.0);

  return const Offset(0.0, 0.0);
}
