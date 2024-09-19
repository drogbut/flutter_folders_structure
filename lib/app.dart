import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'bindings/general_bindings.dart';
import 'l10n/l10n.dart';
import 'utilities/theme/theme.dart';
import 'widgets/loaders/loading_indicator.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'eCommerce App',
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      themeMode: ThemeMode.system,
      theme: DTheme.lightTheme,
      darkTheme: DTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(body: LoadingIndicator()),
    );
  }
}
