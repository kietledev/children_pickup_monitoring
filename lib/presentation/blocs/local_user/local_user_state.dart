part of 'local_user_bloc.dart';

// abstract class LocalUserState extends Equatable {
//   final User? user;

//   const LocalUserState({this.user});

//   @override
//   List<Object> get props => [user!];
// }

// class LocalUserLoading extends LocalUserState {
//   const LocalUserLoading();
// }

// class LocalUserDone extends LocalUserState {
//   const LocalUserDone({required User user}) : super(user: user);
// }

abstract class LocalUserState extends Equatable {
  final User? user;
  final String? msg;
  const LocalUserState({this.user, this.msg});

  @override
  List<Object> get props => [msg!];
}

class LocalUserInitial extends LocalUserState {
  const LocalUserInitial();
}

class LocalUserLoading extends LocalUserState {
  const LocalUserLoading();
}

class LocalUserDone extends LocalUserState {
  const LocalUserDone({required User user}) : super(user: user);
}

class LocalUserFailure extends LocalUserState {
  const LocalUserFailure({required String msg}) : super(msg: msg);
}
