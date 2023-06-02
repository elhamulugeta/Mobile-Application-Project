part of "users_bloc.dart";

@immutable
abstract class UsersState{}

abstract class UsersActionState extends UsersState{}

class UsersInitial extends UsersState{
}

class UsersLoadedState extends UsersActionState{
  UsersLoadedState(this.users);
   final List<UsersModel> users;
  List<Object> get props => [users]; 
}

class UsersErrorState extends UsersActionState{
  UsersErrorState(this.error);
   final List<UsersModel> error;
  
  List<Object> get props => [error];
}

class UsersLoadingState extends UsersActionState{}