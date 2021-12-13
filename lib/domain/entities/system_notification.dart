import 'package:children_pickup_monitoring/common/constants/db_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: DBConstants.kSystemNotificationTableName)
class SystemNotification extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? personId;
  final int? annoucementId;
  final int? annoucementTypeId;
  final String? title;
  final String? content;
  final int? requestId;
  final int? pupilId1;
  final String? pupilLastName1;
  final String? pupilMiddleName1;
  final String? pupilFirstName1;
  final int? pupilId2;
  final String? pupilLastName2;
  final String? pupilMiddleName2;
  final String? pupilFirstName2;
  final int? pupilId3;
  final String? pupilLastName3;
  final String? pupilMiddleName3;
  final String? pupilFirstName3;
  final String? dateTimeReceived;
  final bool? isRead;

  const SystemNotification({
    this.personId,
    this.annoucementId,
    this.annoucementTypeId,
    this.title,
    this.content,
    this.requestId,
    this.pupilId1,
    this.pupilLastName1,
    this.pupilMiddleName1,
    this.pupilFirstName1,
    this.pupilId2,
    this.pupilLastName2,
    this.pupilMiddleName2,
    this.pupilFirstName2,
    this.pupilId3,
    this.pupilLastName3,
    this.pupilMiddleName3,
    this.pupilFirstName3,
    this.dateTimeReceived,
    this.isRead,
  });
  String getFullNamePupil1() {
    if (pupilMiddleName1!.isEmpty) {
      return '${pupilLastName1!.trim()} ${pupilFirstName1!.trim()}';
    } else {
      return '${pupilLastName1!.trim()} ${pupilMiddleName1!.trim()} ${pupilFirstName1!.trim()}';
    }
  }
  String getFullNamePupil2() {
    if (pupilMiddleName2!.isEmpty) {
      return '${pupilLastName2!.trim()} ${pupilFirstName2!.trim()}';
    } else {
      return '${pupilLastName2!.trim()} ${pupilMiddleName2!.trim()} ${pupilFirstName2!.trim()}';
    }
  }
  String getFullNamePupil3() {
    if (pupilMiddleName3!.isEmpty) {
      return '${pupilLastName3!.trim()} ${pupilFirstName3!.trim()}';
    } else {
      return '${pupilLastName3!.trim()} ${pupilMiddleName3!.trim()} ${pupilFirstName3!.trim()}';
    }
  }
  @override
  List<Object> get props {
    return [
      personId!,
      annoucementId!,
      annoucementTypeId!,
      title!,
      content!,
      requestId!,
      pupilId1!,
      pupilLastName1!,
      pupilMiddleName1!,
      pupilFirstName1!,
      pupilId2!,
      pupilLastName2!,
      pupilMiddleName2!,
      pupilFirstName2!,
      pupilId3!,
      pupilLastName3!,
      pupilMiddleName3!,
      pupilFirstName3!,
      dateTimeReceived!,
      isRead!,
    ];
  }
  @override
  bool get stringify => true;
}
