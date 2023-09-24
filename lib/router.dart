import 'package:fefu_schedule/i18n/strings.g.dart';
import 'package:fefu_schedule/navigation/scaffold.dart';
import 'package:fefu_schedule/pages/profile/profile.dart';
import 'package:fefu_schedule/pages/schedule/schedule.dart';
import 'package:fefu_schedule/pages/search/search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

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
          pageBuilder: (context, state) => const MaterialPage(child: Schedule()),
        ),
        GoRoute(
          path: "/search",
          name: t.search.label,
          // builder: (context, state) => const Search(),
          pageBuilder: (context, state) => const MaterialPage(child: Search()),
        ),
        GoRoute(
          path: "/profile",
          name: t.profile.label,
          // builder: (context, state) => const Profile(),
          pageBuilder: (context, state) => const MaterialPage(child: Profile()),
        ),
      ],
    ),
  ],
);
