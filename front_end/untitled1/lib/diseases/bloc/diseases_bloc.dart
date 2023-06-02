import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/diseases/diseases_model.dart';
import 'package:untitled1/diseases/diseasesRepository/diseasesRepository.dart';

part 'diseases_event.dart';
part 'diseases_state.dart';

@immutable
class DiseasesBloc extends Bloc<DiseasesEvent, DiseasesState>{
  final DiseasesRepository _diseasesRepository;

  DiseasesBloc(this._diseasesRepository) : super(DiseasesLoadingState()){
    on<LoadDiseasesButtonClickedEvent>(loadDiseasesButtonClickedEvent);
  }

  FutureOr<void> loadDiseasesButtonClickedEvent
  (LoadDiseasesButtonClickedEvent event,
      Emitter<DiseasesState> emit) async {
    emit(DiseasesLoadingState());
    try{
      final diseases = await _diseasesRepository.getDiseases();
      final diseasesList = List<DiseasesModel>.from(diseases);
      emit(DiseasesLoadedState(diseasesList));
      
    }
    catch(e) {
      print(e);
    }

  }
}