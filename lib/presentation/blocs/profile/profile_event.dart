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
  Map<String, dynamic> body;
  PostProfileEvent({required this.personId,required this.body});
}
class ReloadProfileEvent extends ProfileEvent{
 final PersonModel user;
 ReloadProfileEvent({required this.user});
}
