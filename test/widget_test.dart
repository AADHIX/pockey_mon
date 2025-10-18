
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pockey_mon/screens/login_screen.dart';
import 'package:pockey_mon/screens/registration_screen.dart';

void main() {
  testWidgets('Registration screen UI test', (WidgetTester tester) async {
    // Build the RegistrationScreen widget
    await tester.pumpWidget(const MaterialApp(
      home: RegistrationScreen(),
    ));

    // Verify that the 'Create Account' text is present
    expect(find.text('Create Account'), findsOneWidget);

    // Verify that the text fields are present
    expect(find.byType(TextFormField), findsNWidgets(3));

    // Verify that the 'Sign Up' button is present
    expect(find.text('Sign Up'), findsOneWidget);
  });

  testWidgets('Login screen UI test', (WidgetTester tester) async {
    // Build the LoginScreen widget
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // Verify that the 'Sign In' text is present
    expect(find.text('Sign In'), findsWidgets);

    // Verify that the text fields are present
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify that the 'Login' button is present
    expect(find.text('Login'), findsOneWidget);
  });
}
