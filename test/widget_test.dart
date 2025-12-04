// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:banking_ui/main.dart';

void main() {
  testWidgets('Splash screen navigates to dashboard', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the splash screen shows the app name.
    expect(find.text('BANKING'), findsOneWidget);

    // Pump the widget for 4 seconds to allow the timer to complete.
    await tester.pump(const Duration(seconds: 4));
    // Pump again to handle the navigation frame.
    await tester.pump();

    // Verify that the splash screen is gone.
    expect(find.text('BANKING'), findsNothing);

    // Verify that the dashboard screen is shown.
    expect(find.text('Hi ABHIJITH \nLets Explore!'), findsOneWidget);
  });
}
