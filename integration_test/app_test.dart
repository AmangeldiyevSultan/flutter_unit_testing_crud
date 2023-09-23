import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_unit_testing_crud/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end   test', () { 
    testWidgets('verify login screen correct username ' 
    'and password', (widgetTester) async {
      app.main();

      final delay = await Future.delayed(const Duration(seconds: 1));

      await widgetTester.pumpAndSettle();
      delay;
      await widgetTester.enterText(find.byType(TextFormField).at(0), 'username');
      delay;
      await widgetTester.enterText(find.byType(TextFormField).at(1), 'password');
      delay;
      await widgetTester.tap(find.byType(ElevatedButton));
      delay;
      await widgetTester.pumpAndSettle();

      expect(find.byType(app.HomeScreen), findsOneWidget);

    });
  });
}