import 'package:integration_test/integration_test.dart';

import 'tests/home_screen_test.dart' as home;
import 'tests/scanner_screen_test.dart' as scanner;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  home.main();
  scanner.main();
}
