import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app/main.dart'; // Replace with the correct import path
import 'package:your_app/profile_page.dart'; // Replace with the correct import path

void main() {
  testWidgets('ProfilePage - Widget Test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp()); // Replace with your app's root widget

    // Navigate to the ProfilePage
    await tester.tap(find.byType(ProfilePage));
    await tester.pumpAndSettle();

    // Verify that the ProfilePage is displayed
    expect(find.byType(ProfilePage), findsOneWidget);

    // Verify that the Edit Account dialog opens when tapped
    await tester.tap(find.text('Edit Your Account'));
    await tester.pumpAndSettle();
    expect(find.text('Change Username'), findsOneWidget);
    expect(find.text('Change Password'), findsOneWidget);

    // Verify that the Delete Account dialog opens when tapped
    await tester.tap(find.text('Delete Your Account'));
    await tester.pumpAndSettle();
    expect(find.text('Confirm Logout'), findsOneWidget);
    expect(find.text('Are you sure you want to delete your account?'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Delete'), findsOneWidget);

    // Verify that the Logout dialog opens when tapped
    await tester.tap(find.text('Log Out'));
    await tester.pumpAndSettle();
    expect(find.text('Confirm Logout'), findsOneWidget);
    expect(find.text('Are you sure you want to logout?'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);

    // Add additional test cases as needed

    // Example test: Verify that the new username is saved when the Save button is tapped
    await tester.enterText(find.byType(TextField).first, 'New Username');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    // Add assertions to verify the expected behavior after saving the new username

  });
}
