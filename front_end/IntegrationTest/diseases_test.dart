import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled1/diseases/diseases_model.dart';
import 'package:untitled1/diseases/diseasesRepository/diseases_repository.dart';
import 'package:untitled1/diseases/bloc/diseases_bloc.dart';
import 'package:untitled1/signUp.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/diseases/diseases.dart';

class MockDiseasesRepository extends Mock implements DiseasesRepository {}

void main() {
  late DiseasesRepository diseasesRepository;

  setUp(() {
    diseasesRepository = MockDiseasesRepository();
  });

  testWidgets('Diseases page integration test', (WidgetTester tester) async {
    final mockDiseasesList = [
      DiseasesModel(symptom: 'Headache'),
      DiseasesModel(symptom: 'Fever'),
    ];

    when(diseasesRepository.getDiseases()).thenAnswer((_) => Future.value(mockDiseasesList));

    await tester.pumpWidget(
      MaterialApp(
        home: RepositoryProvider(
          create: (context) => diseasesRepository,
          child: Diseases(),
        ),
      ),
    );

    // Wait for the diseases to load
    await tester.pumpAndSettle();

    // Verify the initial screen is shown
    expect(find.text('Information on Diseases'), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(mockDiseasesList.length));
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Tap on the first disease
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();

    // Verify that the appropriate action is triggered (e.g., navigate to edit screen)
    expect(find.text('EditEvents'), findsOneWidget);

    // Tap on the delete button of the second disease
    await tester.tap(find.byIcon(Icons.delete).at(1));
    await tester.pumpAndSettle();

    // Verify that the confirmation dialog is shown
    expect(find.text('Confirmation'), findsOneWidget);

    // Tap on the "Delete" button in the confirmation dialog
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    // Verify that the delete operation is handled (e.g., delete the disease)
    verify(diseasesRepository.deleteDisease(mockDiseasesList[1])).called(1);

    // Tap on the "Events" tab in the bottom navigation bar
    await tester.tap(find.byIcon(Icons.calendar_today));
    await tester.pumpAndSettle();

    // Verify that the appropriate action is triggered (e.g., navigate to events screen)
    expect(find.text('Events'), findsOneWidget);
  });
}
