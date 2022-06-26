part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginComplete extends LoginState {
  final User model;
  LoginComplete(this.model);
}

class LoginFailedState extends LoginState {
  String error;
  LoginFailedState(this.error);
  @override
  String toString() {
    return error;
  }
}

class LoginLoadingState extends LoginState {
  LoginLoadingState();
}

class NavigateToRegisterState extends LoginState {}
