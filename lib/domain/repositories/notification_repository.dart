import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/params/post_notification_by_teacher_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';


abstract class NotificationRepository {
  // API methods
  Future<DataState<NotificationModel>> getListNotification(GetNotificationRequest query);
  Future<DataState<String>> postNotificationByTeacher(PostNotificationByTeacherRequest query);
}