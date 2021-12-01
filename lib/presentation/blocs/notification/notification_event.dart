part of 'notification_bloc.dart';



abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class GetNotificationEvent extends NotificationEvent {
  final int page;
  final int pageSize;
  final int personId;
  const GetNotificationEvent({required this.page, required this.pageSize, required this.personId});
}
class PostNotificationByTeacherEvent extends NotificationEvent {
  final int personId;
  final int teacherId;
  final List<int> listClassId;
  final String titleAnnoucement;
  final String contentAnnoucement;
  PostNotificationByTeacherEvent({required this.personId,required this.teacherId,required this.listClassId, required this.titleAnnoucement, required this.contentAnnoucement});
}