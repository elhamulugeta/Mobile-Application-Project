import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/events/models/events_model.dart';
import 'package:untitled1/events/repositories/eventGetRepository.dart';

part 'events_event.dart';
part 'events_state.dart';

@immutable
class EventsBloc extends Bloc<EventsEvent, EventsState>{
  final EventsRepository _eventsRepository;

  EventsBloc(this._eventsRepository) : super(EventsLoadingState()){
    on<LoadEventsButtonClickedEvent>(loadEventsButtonClickedEvent);
  }

  FutureOr<void> loadEventsButtonClickedEvent
  (LoadEventsButtonClickedEvent event,
      Emitter<EventsState> emit) async {
    emit(EventsLoadingState());
    try{
      final events = await _eventsRepository.getUser();
      final eventsList = List<EventsModel>.from(events);
      emit(EventsLoadedState(eventsList));
      
    }
    catch(e) {
      print(e);
    }

  }
}