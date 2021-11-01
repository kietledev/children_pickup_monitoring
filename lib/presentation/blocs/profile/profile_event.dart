part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetprofileEvent extends ProfileEvent {
  final int personId;
  const GetprofileEvent({required this.personId});
}
class PostProfileEvent extends ProfileEvent {
  final int personId;
  final int roleId;
  Map<String, dynamic> body;
  PostProfileEvent({required this.personId,required this.roleId,required this.body});
}
class ReloadProfileEvent extends ProfileEvent{
 final PersonModel user;
 ReloadProfileEvent({required this.user});
}
