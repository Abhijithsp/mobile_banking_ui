import 'package:flutter_test/flutter_test.dart';

import 'package:banking_ui/main.dart';

void main() {
  testWidgets('Splash screen navigates to dashboard', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the splash screen shows the app branding.
    expect(find.text('APEX BANK'), findsOneWidget);

    // Pump the widget for 3 seconds to allow the timer to complete.
    await tester.pump(const Duration(seconds: 3));
    // Wait for the navigation transition to complete.
    await tester.pumpAndSettle();

    // Verify that the splash screen is gone.
    expect(find.text('APEX BANK'), findsNothing);

    // Verify that the dashboard screen is shown by checking the user's name.
    expect(find.text('Abhijith S P'), findsOneWidget);
  });
}
