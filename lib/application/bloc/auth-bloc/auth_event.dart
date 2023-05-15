part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignUp extends AuthEvent {
  final String email;
  final String password;
  final String organization;

  SignUp({
    required this.email,
    required this.password,
    required this.organization,
  });
}

class LoginWithCredentials extends AuthEvent {
  final String email;
  final String password;

  LoginWithCredentials({
    required this.email,
    required this.password,
  });
}

class SignedIn extends AuthEvent {
  final User user;

  SignedIn({
    required this.user,
  });
}

class AuthenticatedEvent extends AuthEvent {
  final User user;

  AuthenticatedEvent({required this.user});
}

class SignOut extends AuthEvent {}
