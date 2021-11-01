part of 'password_bloc.dart';

abstract class PasswordState extends Equatable {
  final String? msg;
  const PasswordState({this.msg});

  @override
  List<Object> get props => [msg!];
}
class PasswordInitialState extends PasswordState {}
class PasswordLoadingState extends PasswordState {
  const PasswordLoadingState();
}
class PasswordSuccessState extends PasswordState {
  const PasswordSuccessState({required String msg}) : super(msg: msg);
}

class PasswordFailureState extends PasswordState {
  const PasswordFailureState({required String msg}) : super(msg: msg);
}
