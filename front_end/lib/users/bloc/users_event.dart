part of "users_bloc.dart";

@immutable
abstract class UsersEvent{}



class LoadUsersButtonClickedEvent extends UsersEvent{
}

class LoadingUsersButtonClickedEvent extends UsersEvent{}