import 'package:children_pickup_monitoring/common/constants/db_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: DBConstants.kSchoolNotificationTableName)
class SchoolNotification extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? annoucementId;
  final String? title;
  final String? content;
  final String? dateTimeReceived;
  final bool? isRead;

  const SchoolNotification({
    this.annoucementId,
    this.title,
    this.content,
    this.dateTimeReceived,
    this.isRead,
  });

  @override
  List<Object> get props {
    return [
      annoucementId!,
      title!,
      content!,
      dateTimeReceived!,
      isRead!,
    ];
  }
  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() => <String, dynamic>{
    "ANNOUCEMENT_ID": annoucementId,
    "TITLE": title,
    "CONTENT": content,
    "DATE_TIME_RECEIVED": dateTimeReceived,
    "IS_READ": isRead,

  };

}
