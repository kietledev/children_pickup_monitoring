import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/entities/pupil.dart';

class SchoolNotificationModel extends SchoolNotification {
  const SchoolNotificationModel({
    int? annoucementId,
    String? title,
    String? content,
    String? dateTimeReceived,
    bool? isRead,
  }) : super(
    annoucementId: annoucementId,
    title: title,
    content: content,
    dateTimeReceived: dateTimeReceived,
    isRead: isRead,
  );

  factory SchoolNotificationModel.fromJson(Map<String, dynamic> json) {
    return SchoolNotificationModel(
      annoucementId: (json['ANNOUCEMENT_ID'] as double? ?? -1.0).toInt(),
      title: json['TITLE'] as String? ?? '',
      content: json['CONTENT'] as String? ?? '',
      dateTimeReceived: json['DATE_TIME_RECEIVED'] as String? ?? '',
      isRead: json['IS_READ'] as bool? ?? false,
    );
  }
  factory SchoolNotificationModel.json(Map<String, dynamic> json) {
    return SchoolNotificationModel(
      annoucementId: json['ANNOUCEMENT_ID'] as int? ?? -1,
      title: json['TITLE'] as String? ?? '',
      content: json['CONTENT'] as String? ?? '',
      dateTimeReceived: json['DATE_TIME_RECEIVED'] as String? ?? '',
      isRead: json['IS_READ'] as bool? ?? false,
    );
  }


}
