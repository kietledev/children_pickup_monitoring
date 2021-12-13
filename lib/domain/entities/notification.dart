
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final int? unreadCount;
  final List<SystemNotification>? systemNotification;
  final List<SchoolNotification>? schoolNotification;

  const Notification(
      {
        this.unreadCount,
        this.systemNotification,
        this.schoolNotification,
      });

  @override
  List<Object> get props {
    return [
      unreadCount!,
      systemNotification!,
      schoolNotification!,
    ];
  }
  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() => <String, dynamic>{
    "UNREAD_COUNT": unreadCount,
    "SystemNotifications": systemNotification,
    "SchoolNotifications": schoolNotification,
  };
}
