import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:todo_app_getx/data/localization/app_localization.dart';
import 'package:todo_app_getx/screens/auth/sign_up/sign_up_binding.dart';
import 'package:todo_app_getx/utils/app_routing/app_route_names.dart';
import 'package:todo_app_getx/utils/app_routing/constants.dart';
import 'package:todo_app_getx/utils/theme/themes.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AppTheme.currentSavedTheme ?? AdaptiveThemeMode.dark,
      light: AppTheme.whiteTheme,
      dark: AppTheme.darkTheme,
      builder: (light, dark) => GetMaterialApp(
        title: 'Flutter Demo',
        darkTheme: dark,
        builder: DevicePreview.appBuilder,
        getPages: AppRouting.appPages,
        useInheritedMediaQuery: false,
        theme: light,
        defaultTransition: Transition.native,
        initialBinding: SignUpBinding(),
        initialRoute: AppRouteNames.signUp.routeName,
        locale: Get.deviceLocale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        translations: AppLocalizations(),
        supportedLocales: const [Locale('uz', 'UZ'), Locale('en', 'GB')],
        fallbackLocale: const Locale('en', 'GB'),
      ),
    );
  }
}
