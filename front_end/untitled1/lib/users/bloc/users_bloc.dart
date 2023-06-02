 import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/users/models/users_model.dart';
import 'package:untitled1/users/repositories/users_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

@immutable
class UsersBloc extends Bloc<UsersEvent, UsersState>{
  final UsersRepository _usersRepository;

  UsersBloc(this._usersRepository) : super(UsersLoadingState()){
    on<LoadUsersButtonClickedEvent>(loadUsersButtonClickedEvent);
  }

  FutureOr<void> loadUsersButtonClickedEvent
  (LoadUsersButtonClickedEvent event,
      Emitter<UsersState> emit) async {
    emit(UsersLoadingState());
    try{
      final users = await _usersRepository.getUser();
      final usersList = List<UsersModel>.from(users);
      emit(UsersLoadedState(usersList));
      
    }
    catch(e) {
      print(e);
    }

  }
}