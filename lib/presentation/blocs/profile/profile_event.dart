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
