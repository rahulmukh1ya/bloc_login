import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        if (event.username.isEmpty || event.password.isEmpty) {
          emit(AuthError());
        } else {
          emit(AuthLoading());
          await Future.delayed(const Duration(seconds: 3), () {
            emit(AuthLoaded(event.username));
          });
        }
      }
    });
  }
}
