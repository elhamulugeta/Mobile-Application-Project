part of "diseases_bloc.dart";

@immutable
abstract class DiseasesEvent{}

class CreateNewDiseaseButtonClickedEvent extends DiseasesEvent{

}

class LoadDiseasesButtonClickedEvent extends DiseasesEvent{}

class EditDiseaseButtonClickedEvent extends DiseasesEvent{

}

class DeleteDiseaseButtonClickedEvent extends DiseasesEvent{

}
