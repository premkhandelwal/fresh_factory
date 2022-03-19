import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fresh/data/dataProviders/auth_provider.dart';
import 'package:fresh/data/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider authProvider;
  AuthBloc({required this.authProvider}) : super(AuthInitial()) {
    on<SignInRequestedEvent>((event, emit) async {
      emit(SignInProgressState());
      String? isSuccess = await authProvider.login(event.user);
      if (isSuccess != null) {
        if (isSuccess == "Success") {
          emit(SignInSuccessState());
        } else if (isSuccess == "UnAuthorized") {
          emit(UserUnauthorizedState());
        } else {
          emit(SignInFailureState());
        }
      } else {
        emit(SignInFailureState());
      }
    });
    on<SignUpRequestedEvent>((event, emit) async {
      emit(SignUpProgressState());
      bool isSuccess = await authProvider.signUp(event.user);
      if (isSuccess) {
        emit(SignUpSuccessState());
      } else {
        emit(SignUpFailureState());
      }
    });
  }
}
