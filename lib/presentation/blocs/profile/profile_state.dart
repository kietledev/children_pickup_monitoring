part of 'profile_bloc.dart';



abstract class ProfileState extends Equatable {
  final PersonModel? person;
  final String? msg;
  const ProfileState({this.person, this.msg});

  @override
  List<Object> get props => [msg!];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState();
}

class ProfileSuccessState extends ProfileState {
  const ProfileSuccessState({required PersonModel person}) : super(person: person);
}

class ProfileFailureState extends ProfileState {
  const ProfileFailureState({required String msg}) : super(msg: msg);
}
