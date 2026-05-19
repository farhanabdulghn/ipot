import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipot/screens/home_screen.dart';
import 'package:ipot/screens/main_frame_screen.dart';
import 'package:ipot/screens/scanner_screen.dart';

import '../helpers/app_helper.dart';
import '../mocks/mock_providers.dart';

void main() {
  group('ScannerScreen', () {
    Future<void> goToScanner(WidgetTester tester) async {
      await tester.tap(find.byKey(const Key('start_scan_button')));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(ScannerScreen), findsOneWidget);
    }

    Future<void> simulateScan(WidgetTester tester, String qrValue) async {
      final scannerState = tester.state<ScannerScreenState>(
        find.byType(ScannerScreen),
      );

      scannerState.handleBarcodeForTest(qrValue);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
    }

    testWidgets('should show scanner UI elements', (tester) async {
      await pumpApp(tester);
      await goToScanner(tester);

      expect(find.byKey(const Key('back_button')), findsOneWidget);
      expect(find.byKey(const Key('torch_button')), findsOneWidget);
    });

    testWidgets('should go back to HomeScreen when back button tapped', (
      tester,
    ) async {
      await pumpApp(tester);
      await goToScanner(tester);

      await tester.tap(find.byKey(const Key('back_button')));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(ScannerScreen), findsNothing);
    });

    testWidgets('should navigate to MainFrame when scan valid QR T001', (
      tester,
    ) async {
      await pumpApp(tester, overrides: scanSuccessOverrides());
      await goToScanner(tester);

      await simulateScan(tester, 'T001');

      expect(find.byType(MainFrameScreen), findsOneWidget);
      expect(find.byType(ScannerScreen), findsNothing);
    });

    testWidgets(
      'should show error snackbar and stay on scanner when QR invalid',
      (tester) async {
        await pumpApp(tester, overrides: scanFailOverrides());
        await goToScanner(tester);

        await simulateScan(tester, 'INVALID');

        expect(find.byType(ScannerScreen), findsOneWidget);
        expect(find.byType(MainFrameScreen), findsNothing);
        expect(find.byType(SnackBar), findsOneWidget);
      },
    );

    testWidgets('should ignore second scan while processing', (tester) async {
      await pumpApp(tester, overrides: scanSuccessOverrides());
      await goToScanner(tester);

      final scannerState = tester.state<ScannerScreenState>(
        find.byType(ScannerScreen),
      );

      scannerState.handleBarcodeForTest('T001');
      scannerState.handleBarcodeForTest('T001');
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(MainFrameScreen), findsOneWidget);
    });

    testWidgets('should toggle torch button appearance when tapped', (
      tester,
    ) async {
      await pumpApp(tester);
      await goToScanner(tester);

      await tester.tap(find.byKey(const Key('torch_button')));
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byKey(const Key('torch_button')), findsOneWidget);

      await tester.tap(find.byKey(const Key('torch_button')));
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byKey(const Key('torch_button')), findsOneWidget);
    });
  });
}
