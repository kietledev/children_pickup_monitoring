
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/entities/parent.dart';

class NotificationModel extends Notification {
  const NotificationModel({
    int? unreadCount,
    List<SystemNotificationModel>? systemNotificationModel,
    List<SchoolNotificationModel>? schoolNotificationModel,
  }) : super(
      unreadCount: unreadCount,
      systemNotification: systemNotificationModel,
      schoolNotification: schoolNotificationModel
  );

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    var listSystemNotification = json['SystemNotifications'] as List;
    List<SystemNotificationModel> systemNotifications = listSystemNotification
        .map((i) => SystemNotificationModel.fromJson(i)).toList();
    var listSchoolNotification = json['SchoolNotifications'] as List;
    List<SchoolNotificationModel> schoolNotifications = listSchoolNotification
        .map((i) => SchoolNotificationModel.fromJson(i)).toList();
    return NotificationModel(
        unreadCount: (json['UNREAD_COUNT'] as double? ?? -1.0).toInt(),
        systemNotificationModel: systemNotifications,
        schoolNotificationModel: schoolNotifications
    );
  }
  factory NotificationModel.json(Map<String, dynamic> json) {
    var listSystemNotification = json['SystemNotifications'] as List;
    List<SystemNotificationModel> systemNotifications = listSystemNotification
        .map((i) => SystemNotificationModel.json(i)).toList();
    var listSchoolNotification = json['SchoolNotifications'] as List;
    List<SchoolNotificationModel> schoolNotifications = listSchoolNotification
        .map((i) => SchoolNotificationModel.json(i)).toList();
    return NotificationModel(
        unreadCount: json['UNREAD_COUNT'] as int? ?? 0,
        systemNotificationModel: systemNotifications,
        schoolNotificationModel: schoolNotifications
    );
  }
}
