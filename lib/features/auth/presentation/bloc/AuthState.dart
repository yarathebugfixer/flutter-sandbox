import 'package:tut_app/features/auth/data/models/User.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {} 

class AuthLoading extends AuthState {} 

class Authenticated extends AuthState {
  final User user; 
  Authenticated(this.user);
}

class Unauthenticated extends AuthState {} 

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
