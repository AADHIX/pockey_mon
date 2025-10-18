import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:pockey_mon/screens/login_screen.dart';
import 'package:pockey_mon/widgets/button.dart';

void main() {
  testWidgets('Login functionality test', (WidgetTester tester) async {
    // Create a mock user
    final user = MockUser(
      isAnonymous: false,
      email: 'test@example.com',
      displayName: 'Test User',
      uid: 'test_uid',
    );

    // Create a mock Firebase auth instance
    final auth = MockFirebaseAuth(mockUser: user);

    // Build the LoginScreen widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );

    // Enter the email and password
    await tester.enterText(find.byKey(const Key('emailField')), 'test@example.com');
    await tester.enterText(find.byKey(const Key('passwordField')), 'password123');

    // Tap the login button
    await tester.tap(find.byType(LoadingAnimatedButton));
    await tester.pumpAndSettle();

    // Verify that the user is logged in
    expect(auth.currentUser, isNotNull);
  });
}
