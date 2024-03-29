part of 'auth_bloc.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final String username;

  AuthLoaded(this.username);
}

class AuthError extends AuthState {}
