part of 'password_bloc.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class PostPasswordEvent extends PasswordEvent {
  final int userId;
  final int roleId;
  Map<String, dynamic> body;
  PostPasswordEvent({required this.userId,required this.roleId,required this.body});
}
