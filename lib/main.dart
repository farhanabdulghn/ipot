import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipot/app_routes.dart';
import 'package:ipot/app_theme.dart';
import 'package:ipot/config/env.dart';
import 'package:ipot/l10n/app_localizations.dart';
import 'package:ipot/screens/home_screen.dart';
import 'package:ipot/state/stores/locale/locale_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  String environment = String.fromEnvironment(
    'environment',
    defaultValue: Environment.prod,
  );
  Environment.initConfig(environment);

  runApp(ProviderScope(retry: (retryCount, error) => null, child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: const [Locale('en'), Locale('zh')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.lightTheme(context),
      routes: AppRoutes.routes,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1)),
          child: child!,
        );
      },
      home: HomeScreen(),
    );
  }
}
