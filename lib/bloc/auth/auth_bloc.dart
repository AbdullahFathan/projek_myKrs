import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<Login>((event, emit) async {
      emit(AuthLoading());
      try{
        var response = await AuthRepository().loginRepository(event.nim, event.password);
        
        response ? emit(AuthSuccess()): emit(AuthEror("There is eror"));
        print("Login response has send [auth_bloc.dart]");
      } catch(eror){
        emit(AuthEror(eror.toString()));
        print("Login has failed [auth_bloc.dart]");
      }
    });
  }
}
