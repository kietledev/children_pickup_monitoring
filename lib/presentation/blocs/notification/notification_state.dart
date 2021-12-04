part of 'notification_bloc.dart';



abstract class NotificationState extends Equatable {
  final NotificationModel? notificationModel;
  final String? msg;
  const NotificationState({this.notificationModel, this.msg});

  @override
  List<Object> get props => [msg!];
}

class NotificationInitialState extends NotificationState {}

class NotificationLoadingState extends NotificationState {
  const NotificationLoadingState();
}

class NotificationSuccessState extends NotificationState {
  const NotificationSuccessState({required NotificationModel notificationModel}) : super(notificationModel: notificationModel);
}
class PostNotificationSuccessState extends NotificationState {
  const PostNotificationSuccessState({required String msg}) : super(msg: msg);
}
class PostNotificationReadSuccessState extends NotificationState {
  const PostNotificationReadSuccessState({required NotificationModel notificationModel}) : super(notificationModel: notificationModel);
}
class NotificationFailureState extends NotificationState {
  const NotificationFailureState({required String msg}) : super(msg: msg);
}
