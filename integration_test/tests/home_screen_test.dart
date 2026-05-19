import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipot/screens/home_screen.dart';
import 'package:ipot/screens/scanner_screen.dart';

import '../helpers/app_helper.dart';

void main() {
  group('HomeScreen', () {
    testWidgets('should show language options and scan button', (tester) async {
      await pumpApp(tester);

      expect(find.byType(HomeScreen), findsOneWidget);

      expect(find.byKey(const Key('lang_card_en')), findsOneWidget);
      expect(find.byKey(const Key('lang_card_zh')), findsOneWidget);

      expect(find.byKey(const Key('start_scan_button')), findsOneWidget);
    });

    testWidgets('should select English language', (tester) async {
      await pumpApp(tester);

      await tester.tap(find.byKey(const Key('lang_card_en')));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('lang_card_en')), findsOneWidget);
    });

    testWidgets('should select Chinese language', (tester) async {
      await pumpApp(tester);

      await tester.tap(find.byKey(const Key('lang_card_zh')));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('lang_card_zh')), findsOneWidget);
    });

    // ─── Test 3: Navigasi ke Scanner ──────────────────────────────────
    testWidgets('should navigate to ScannerScreen when tap start scan', (
      tester,
    ) async {
      await pumpApp(tester);

      await tester.tap(find.byKey(const Key('start_scan_button')));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(ScannerScreen), findsOneWidget);
    });
  });
}
