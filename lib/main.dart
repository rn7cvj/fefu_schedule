import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:fefu_schedule/controllers/schedule/controller.dart';
import 'package:fefu_schedule/controllers/schedule/converter.dart';
import 'package:fefu_schedule/controllers/schedule/service.dart';
import 'package:fefu_schedule/controllers/settings/settings_controller.dart';
import 'package:fefu_schedule/controllers/theme/theme_controller.dart';
import 'package:fefu_schedule/controllers/theme/theme_storage.dart';
import 'package:fefu_schedule/i18n/strings.g.dart';
import 'package:fefu_schedule/logger.dart';
import 'package:fefu_schedule/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

FutureOr<Request> loggerRequestInterceptor(Request request) {
  logger.i("Request\n${request.uri}\n${request.headers}\n${request.parameters}");

  return request;
}

Future<void> main() async {
  setUpSystemUIOverlay();

  final chopper = ChopperClient(
    baseUrl: Uri.parse("https://fefuschedule.rn7cvj-dev.ru/api"),
    interceptors: [
      loggerRequestInterceptor,
    ],
    services: [
      ScheduleService.create(),
    ],
  );

  ThemeStorage themeStorage = ThemeStorage();
  ThemeContoller themeContoller = ThemeContoller(themeStorage: themeStorage);

  SettingsController settingsController = SettingsController(themeContoller: themeContoller);

  await themeContoller.init();
  await settingsController.init();

  GetIt.I.registerSingleton<ThemeContoller>(themeContoller);
  GetIt.I.registerSingleton<SettingsController>(settingsController);

  ScheduleConverter scheduleConverter = ScheduleConverter(scheduleService: chopper.getService<ScheduleService>());
  ScheduleController scheduleController = ScheduleController(scheduleConverter: scheduleConverter);

  scheduleController.getGroupSchedule();

  LocaleSettings.useDeviceLocale();

  runApp(TranslationProvider(child: const App()));
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
  const App({super.key});

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) {
          ThemeContoller themeContoller = GetIt.I<ThemeContoller>();
          return MaterialApp.router(
            title: "Fefu Schedule",
            themeMode: themeContoller.theme,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.light,
                seedColor: themeContoller.themeColor,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.dark,
                seedColor: themeContoller.themeColor,
              ),
              useMaterial3: true,
            ),
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            routerConfig: router,
            debugShowCheckedModeBanner: false,
          );
        },
      );
}
