part of "diseases_bloc.dart";

@immutable
abstract class DiseasesState{}

abstract class DiseasesActionState extends  DiseasesState{}

class DiseasesInitial extends  DiseasesState{
}

class DiseasesLoadedState extends DiseasesActionState{
  DiseasesLoadedState(this.diseases);
   final List<DiseasesModel> diseases;
  
  List<Object> get props => [diseases]; 
}

class DiseasesErrorState extends DiseasesActionState{
  DiseasesErrorState(this.error);
   final List<DiseasesModel> error;
  
  List<Object> get props => [error];
}

class DiseasesLoadingState extends DiseasesActionState{}

class CreateEventsActionState extends DiseasesActionState{}