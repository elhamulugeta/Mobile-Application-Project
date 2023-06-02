import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled1/users/bloc/users_bloc.dart';
import 'package:untitled1/users/models/users_model.dart';
import 'package:untitled1/users/repositories/users_repository.dart';
import 'package:untitled1/users/ui/login.dart';

class MockUsersRepository extends Mock implements UsersRepository {}

void main() {
  late UsersBloc usersBloc;
  late MockUsersRepository usersRepository;

  setUp(() {
    usersRepository = MockUsersRepository();
    usersBloc = UsersBloc(usersRepository);
  });

  tearDown(() {
    usersBloc.close();
  });

  testWidgets('LoginPage - UsersLoadedState - Login as User', (WidgetTester tester) async {
    // Mock users data
    List<UsersModel> userList = [
      UsersModel(name: 'User1', password: 'password1', role: 'User'),
      UsersModel(name: 'User2', password: 'password2', role: 'Doctor'),
      UsersModel(name: 'User3', password: 'password3', role: 'Admin'),
    ];

    // Stub the repository's response
    when(usersRepository.getUsers()).thenAnswer((_) async => userList);

    // Pump the LoginPage widget with the UsersLoadedState
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<UsersBloc>.value(
          value: usersBloc,
          child: LoginPage(),
        ),
      ),
    );

    // Wait for the users to be loaded
    await tester.pumpAndSettle();

    // Enter login credentials
    await tester.enterText(find.byKey(Key('name_text_field')), 'User1');
    await tester.enterText(find.byKey(Key('password_text_field')), 'password1');

    // Tap the login button
    await tester.tap(find.byKey(Key('login_button')));
    await tester.pumpAndSettle();

    // Verify that UserEvents page is pushed
    expect(find.byType(UserEvents), findsOneWidget);
  });

  // Add more tests for other states and interactions as needed

}
