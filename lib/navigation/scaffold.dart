import 'package:fefu_schedule/i18n/strings.g.dart';
import 'package:fefu_schedule/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

final _navigatonFunction = [
  AppNavigator.goToSchedule,
  AppNavigator.goToSearch,
  AppNavigator.goToProfile,
];

class ScaffoldWithGNavbar extends StatelessWidget {
  const ScaffoldWithGNavbar({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: GNav(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.6),
        tabBackgroundColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
        tabMargin: const EdgeInsets.only(bottom: 24.0, top: 8.0, left: 8.0, right: 8.0),
        padding: const EdgeInsets.all(16),
        haptic: true,
        onTabChange: (tabIndex) => _navigatonFunction[tabIndex](),
        tabs: [
          GButton(
            icon: Icons.calendar_month_outlined,
            text: t.schedule.label,
          ),
          GButton(
            icon: Icons.search,
            text: t.search.label,
          ),
          GButton(
            icon: Icons.person,
            text: t.profile.label,
          ),
        ],
      ),
    );
  }
}
