import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled1/diseases/bloc/diseases_bloc.dart';
import 'package:untitled1/diseases/diseases_model.dart';
import 'package:untitled1/diseases/diseasesRepository/diseasesRepository.dart';

class MockDiseasesRepository extends Mock implements DiseasesRepository {}

void main() {
  group('DiseasesBloc', () {
    late MockDiseasesRepository mockDiseasesRepository;
    late DiseasesBloc bloc;

    setUp(() {
      mockDiseasesRepository = MockDiseasesRepository();
      bloc = DiseasesBloc(mockDiseasesRepository);
    });

    test('emits [DiseasesLoadingState, DiseasesLoadedState] when diseases are successfully loaded', () async {
      final diseases = [
        DiseasesModel(symptom: 'Symptom 1', title: 'Disease 1'),
        DiseasesModel(symptom: 'Symptom 2', title: 'Disease 2')
      ];

      when(mockDiseasesRepository.getDiseases()).thenAnswer((_) async => diseases);

      bloc.add(LoadDiseasesButtonClickedEvent());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          DiseasesLoadingState(),
          DiseasesLoadedState(diseases),
        ]),
      );

      verify(mockDiseasesRepository.getDiseases()).called(1);
    });

    test('emits [DiseasesLoadingState] when an error occurs', () async {
      final errorMessage = 'Error message';

      when(mockDiseasesRepository.getDiseases()).thenThrow(Exception(errorMessage));

      bloc.add(LoadDiseasesButtonClickedEvent());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          DiseasesLoadingState(),
        ]),
      );

      verify(mockDiseasesRepository.getDiseases()).called(1);
    });
  });
}
