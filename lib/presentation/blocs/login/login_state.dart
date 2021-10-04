part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final User? user;
  final String? msg;
  const LoginState({this.user, this.msg});

  @override
  List<Object> get props => [msg!];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState({required User user}) : super(user: user);
}

class LoginFailureState extends LoginState {
  const LoginFailureState({required String msg}) : super(msg: msg);
}
