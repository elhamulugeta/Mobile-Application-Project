part of "events_bloc.dart";

@immutable
abstract class EventsState{}

abstract class EventsActionState extends EventsState{}

class EventsInitial extends EventsState{
}

class EventsLoadedState extends EventsActionState{
  EventsLoadedState(this.events);
   final List<EventsModel> events;
  
  List<Object> get props => [events]; 
}

class EventsErrorState extends EventsActionState{
  EventsErrorState(this.error);
   final List<EventsModel> error;
  
  List<Object> get props => [error];
}

class EventsLoadingState extends EventsActionState{}

class CreateEventsActionState extends EventsActionState{}