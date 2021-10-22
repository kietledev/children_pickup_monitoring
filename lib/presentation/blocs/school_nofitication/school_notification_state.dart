part of 'school_notification_bloc.dart';

abstract class SchoolNotificationState extends Equatable {
  const SchoolNotificationState();
  
  @override
  List<Object> get props => [];
}

class SchoolNotificationInitial extends SchoolNotificationState {}
