
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

}
