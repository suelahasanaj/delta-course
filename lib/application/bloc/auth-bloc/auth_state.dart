part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  Authenticated({required this.user});
}

class Unauthenticated extends AuthState {}

class AuthLoadingState extends AuthState {}
