import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;
  final bool isGuest;
  AuthSuccess(this.user, {this.isGuest = false});
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

class GuestState extends AuthState {}
