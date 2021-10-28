part of 'users_bloc.dart';





abstract class UsersState extends Equatable {
  const UsersState({this.users, this.msg});
  final List<UserByPersonModel>? users;
  final String? msg;

  @override
  List<Object> get props => [users!, msg!];
}

class FetchUsersLoadingState extends UsersState {}

class FetchUsersSuccessState extends UsersState {
  const FetchUsersSuccessState({required List<UserByPersonModel> users})
      : super(users: users);
}

class FetchUsersFailureState extends UsersState {
  const FetchUsersFailureState({required String msg}) : super(msg: msg);
}
