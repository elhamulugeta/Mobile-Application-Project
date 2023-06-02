import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled1/events/ui/events.dart';
import 'package:untitled1/users/models/users_model.dart';
import 'package:untitled1/users/repositories/users_repository.dart';
import 'package:untitled1/users/bloc/users_bloc.dart';
import 'package:untitled1/login_page.dart';

class MockUsersRepository extends Mock implements UsersRepository {}

void main() {
  late UsersRepository usersRepository;

  setUp(() {
    usersRepository = MockUsersRepository();
  });

  testWidgets('Login page integration test', (WidgetTester tester) async {
    final mockUserList = [
      UsersModel(name: 'John', password: 'password', role: 'User'),
      UsersModel(name: 'Jane', password: 'password', role: 'Admin'),
    ];

    when(usersRepository.getUsers()).thenAnswer((_) => Future.value(mockUserList));

    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(),
      ),
    );

    // Wait for the users to load
    await tester.pumpAndSettle();

    // Verify the initial form is shown
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.byType(DropdownButtonFormField), findsNothing);

    // Tap the "Don't have an account? Sign up" text to switch to the sign-up form
    await tester.tap(find.text("Don't have an account? Sign up"));
    await tester.pumpAndSettle();

    // Verify the sign-up form is shown
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(DropdownButtonFormField), findsOneWidget);

    // Enter the name, password, and select the role
    await tester.enterText(find.byType(TextFormField).first, 'John');
    await tester.enterText(find.byType(TextFormField).last, 'password');
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.tap(find.text('User').last);
    await tester.pumpAndSettle();

    // Tap the "Sign Up" button
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Verify that the appropriate screen is navigated to based on the selected role
    expect(find.byType(UserEvents), findsOneWidget);

    // Tap the "Already have an account? Login" text to switch back to the login form
    await tester.tap(find.text('Already have an account? Login'));
    await tester.pumpAndSettle();

    // Verify the login form is shown again
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.byType(DropdownButtonFormField), findsNothing);

    // Enter the login credentials
    await tester.enterText(find.byType(TextFormField).first, 'Jane');
    await tester.enterText(find.byType(TextFormField).last, 'password');
    await tester.pumpAndSettle();

    // Tap the "Login" button
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify that the appropriate screen is navigated to based on the user role
    expect(find.byType(Events), findsOneWidget);
  });
}
