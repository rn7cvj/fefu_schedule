import 'package:fefu_schedule/i18n/strings.g.dart';
import 'package:fefu_schedule/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setUpSystemUIOverlay();
  LocaleSettings.useDeviceLocale();

  runApp(TranslationProvider(child: App()));
}

void setUpSystemUIOverlay() {
  WidgetsFlutterBinding.ensureInitialized();

  // Setting SysemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent));
  // Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class App extends StatelessWidget {
  App({super.key});

  final _lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color.fromRGBO(9, 103, 176, 1),
    ),
    useMaterial3: true,
  );

  final _darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromRGBO(9, 103, 176, 1),
    ),
    useMaterial3: true,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Fefu Schedule",
      themeMode: ThemeMode.system,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
