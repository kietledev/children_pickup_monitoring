part of 'local_user_bloc.dart';

abstract class LocalUserEvent extends Equatable {
  final User? user;

  const LocalUserEvent({this.user});

  @override
  List<Object> get props => [user!];
}

class GetAllSavedUser extends LocalUserEvent {
  const GetAllSavedUser();
}

class RemoveUser extends LocalUserEvent {
  const RemoveUser(User article) : super(user: article);
}

class SaveUser extends LocalUserEvent {
  const SaveUser(User user) : super(user: user);
}
