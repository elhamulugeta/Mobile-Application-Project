import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled1/diseases/bloc/diseases_bloc.dart';
import 'package:untitled1/diseases/diseasesRepository/diseasesRepository.dart';
import 'package:untitled1/diseases/diseases_model.dart';
import 'package:untitled1/diseases/ui/diseases.dart';


class MockDiseasesRepository extends Mock implements DiseasesRepository {}

void main() {
  late DiseasesBloc diseasesBloc;
  late MockDiseasesRepository mockDiseasesRepository;

  setUp(() {
    mockDiseasesRepository = MockDiseasesRepository();
    diseasesBloc = DiseasesBloc(mockDiseasesRepository);
  });

  tearDown(() {
    diseasesBloc.close();
  });

  testWidgets('emits [DiseasesLoadedState] when diseases are successfully loaded', (WidgetTester tester) async {
    // Define the list of diseases to be returned by the mock repository
    List<DiseasesModel> diseasesList = [
      DiseasesModel(symptom: 'Symptom 1', title: 'Disease 1'),
      DiseasesModel(symptom: 'Symptom 2', title: 'Disease 2'),
      DiseasesModel(symptom: 'Symptom 3', title: 'Disease 3'),
    ];

    // Stub the mock repository's behavior
    when(mockDiseasesRepository.getDiseases()).thenAnswer((_) async => diseasesList);

    // Pump the DiseasesPage widget
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<DiseasesBloc>(
          create: (context) => diseasesBloc,
          child: DiseasesPage(),
        ),
      ),
    );

    // Verify that the loading state is emitted first
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the diseases to be loaded
    await tester.pumpAndSettle();

    // Verify that the loaded state is emitted
    expect(find.byType(ListView), findsOneWidget);

    // Verify the presence of disease items in the list
    expect(find.text('Symptom 1'), findsOneWidget);
    expect(find.text('Symptom 2'), findsOneWidget);
    expect(find.text('Symptom 3'), findsOneWidget);
  });
}
