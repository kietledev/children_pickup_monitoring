import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/entities/pupil.dart';

class SystemNotificationModel extends SystemNotification {
  const SystemNotificationModel({
    int? personId,
    int? annoucementId,
    int? annoucementTypeId,
    String? title,
    String? content,
    int? requestId,
    int? pupilId1,
    String? pupilLastName1,
    String? pupilMiddleName1,
    String? pupilFirstName1,
    int? pupilId2,
    String? pupilLastName2,
    String? pupilMiddleName2,
    String? pupilFirstName2,
    int? pupilId3,
    String? pupilLastName3,
    String? pupilMiddleName3,
    String? pupilFirstName3,
    String? dateTimeReceived,
    bool? isRead,
  }) : super(
    personId: personId,
    annoucementId: annoucementId,
    annoucementTypeId: annoucementTypeId,
    title: title,
    content: content,
    requestId: requestId,
    pupilId1: pupilId1,
    pupilLastName1: pupilLastName1,
    pupilMiddleName1: pupilMiddleName1,
    pupilFirstName1: pupilFirstName1,
    pupilId2: pupilId2,
    pupilLastName2: pupilLastName2,
    pupilMiddleName2: pupilMiddleName2,
    pupilFirstName2: pupilFirstName2,
    pupilId3: pupilId3,
    pupilLastName3: pupilLastName3,
    pupilMiddleName3: pupilMiddleName3,
    pupilFirstName3: pupilFirstName3,
    dateTimeReceived: dateTimeReceived,
    isRead: isRead,
  );

  factory SystemNotificationModel.fromJson(Map<String, dynamic> json) {
    return SystemNotificationModel(
      personId: (json['PERSON_ID'] as double? ?? -1.0).toInt(),
      annoucementId: (json['ANNOUCEMENT_ID'] as double? ?? -1.0).toInt(),
      annoucementTypeId: (json['ANNOUCEMENT_TYPE_ID'] as double? ?? -1.0).toInt(),
      title: json['TITLE'] as String? ?? '',
      content: json['CONTENT'] as String? ?? '',
      requestId: (json['REQUEST_ID'] as double? ?? -1.0).toInt(),
      pupilId1: (json['PUPIL_ID_1'] as double? ?? -1.0).toInt(),
      pupilLastName1: json['PUPIL_LAST_NAME_1'] as String? ?? '',
      pupilMiddleName1: json['PUPIL_MIDDLE_NAME_1'] as String? ?? '',
      pupilFirstName1: json['PUPIL_FIRST_NAME_1'] as String? ?? '',
      pupilId2: (json['PUPIL_ID_2'] as double? ?? -1.0).toInt(),
      pupilLastName2: json['PUPIL_LAST_NAME_2'] as String? ?? '',
      pupilMiddleName2: json['PUPIL_MIDDLE_NAME_2'] as String? ?? '',
      pupilFirstName2: json['PUPIL_FIRST_NAME_2'] as String? ?? '',
      pupilId3: (json['PUPIL_ID_3'] as double? ?? -1.0).toInt(),
      pupilLastName3: json['PUPIL_LAST_NAME_3'] as String? ?? '',
      pupilMiddleName3: json['PUPIL_MIDDLE_NAME_3'] as String? ?? '',
      pupilFirstName3: json['PUPIL_FIRST_NAME_3'] as String? ?? '',
      dateTimeReceived: json['DATE_TIME_RECEIVED'] as String? ?? '',
      isRead: json['IS_READ'] as bool? ?? false,
    );
  }
  factory SystemNotificationModel.json(Map<String, dynamic> json) {
    return SystemNotificationModel(
      personId: json['PERSON_ID'] as int? ??-1,
      annoucementId: json['ANNOUCEMENT_ID'] ,
      annoucementTypeId: json['ANNOUCEMENT_TYPE_ID'] as int? ??-1,
      title: json['TITLE'] as String? ?? '',
      content: json['CONTENT'] as String? ?? '',
      requestId: json['REQUEST_ID'] as int? ??-1,
      pupilId1: json['PUPIL_ID_1'] as int? ??-1,
      pupilLastName1: json['PUPIL_LAST_NAME_1'] as String? ?? '',
      pupilMiddleName1: json['PUPIL_MIDDLE_NAME_1'] as String? ?? '',
      pupilFirstName1: json['PUPIL_FIRST_NAME_1'] as String? ?? '',
      pupilId2: json['PUPIL_ID_2'] as int? ??-1,
      pupilLastName2: json['PUPIL_LAST_NAME_2'] as String? ?? '',
      pupilMiddleName2: json['PUPIL_MIDDLE_NAME_2'] as String? ?? '',
      pupilFirstName2: json['PUPIL_FIRST_NAME_2'] as String? ?? '',
      pupilId3: json['PUPIL_ID_3'] as int? ??-1,
      pupilLastName3: json['PUPIL_LAST_NAME_3'] as String? ?? '',
      pupilMiddleName3: json['PUPIL_MIDDLE_NAME_3'] as String? ?? '',
      pupilFirstName3: json['PUPIL_FIRST_NAME_3'] as String? ?? '',
      dateTimeReceived: json['DATE_TIME_RECEIVED'] as String? ?? '',
      isRead: json['IS_READ'] as bool? ?? false,
    );
  }
}
