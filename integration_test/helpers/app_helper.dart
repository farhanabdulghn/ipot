import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ipot/app_routes.dart';
import 'package:ipot/app_theme.dart';
import 'package:ipot/l10n/app_localizations.dart';
import 'package:ipot/screens/home_screen.dart';
import 'package:ipot/state/stores/locale/locale_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

Future<void> waitForWidget(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 10),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 300));
    if (finder.evaluate().isNotEmpty) return;
  }
  throw Exception('Widget not found after ${timeout.inSeconds}s: $finder');
}

Future<void> pumpApp(
  WidgetTester tester, {
  List<Override> overrides = const [],
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: overrides,
      child: Consumer(
        builder: (context, ref, _) {
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
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.linear(1)),
              child: child!,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    ),
  );

  await tester.pump(const Duration(seconds: 1));
  await tester.pump(const Duration(seconds: 1));
}
