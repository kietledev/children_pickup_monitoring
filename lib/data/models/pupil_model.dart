import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/pupil.dart';

class PupilModel extends Pupil {
  const PupilModel({
    String? className,
    int? classId,
    int? pupilId,
    String? personToPersonPersonalRelationshipTypeName,
    String? personToPersonPersonalRelationshipTypeNameEn,
    String? currentLastNameParent,
    String? currentFirstNameParent,
    String? currentMiddleNameParent,
    String? currentPhoneNumber1Parent,
    String? currentPhoneNumber2Parent,
    int? pupilWeight,
    int? pupilHeight,
    int? pupilToPupilStatusRelationshipTypeId,
    String? pupilToPupilStatusRelationshipTypeName,
    String? pupilToPupilStatusRelationshipTypeNameEn,
    String? datetime,
    String? reason,
    PersonModel? personDetail,
  }) : super(
    className: className,
    pupilId: pupilId,
    classId: classId,
    personToPersonPersonalRelationshipTypeName: personToPersonPersonalRelationshipTypeName,
    personToPersonPersonalRelationshipTypeNameEn: personToPersonPersonalRelationshipTypeNameEn,
    currentLastNameParent: currentLastNameParent,
    currentFirstNameParent: currentFirstNameParent,
    currentMiddleNameParent: currentMiddleNameParent,
    currentPhoneNumber1Parent: currentPhoneNumber1Parent,
    currentPhoneNumber2Parent: currentPhoneNumber2Parent,
    pupilWeight: pupilWeight,
    pupilHeight: pupilHeight,
    pupilToPupilStatusRelationshipTypeId: pupilToPupilStatusRelationshipTypeId,
    pupilToPupilStatusRelationshipTypeName: pupilToPupilStatusRelationshipTypeName,
    pupilToPupilStatusRelationshipTypeNameEn: pupilToPupilStatusRelationshipTypeNameEn,
    datetime: datetime,
    reason: reason,
    personDetail: personDetail,
        );

  factory PupilModel.fromJson(Map<String, dynamic> json) {
    var personDetail = json['PERSON_DETAIL'];
    PersonModel person = PersonModel.fromJson(personDetail);
    return PupilModel(
      className: json['CLASS_NAME'] as String? ?? '',
      pupilId: (json['PUPIL_ID'] as double? ?? -1.0).toInt(),
      classId: (json['CLASS_ID'] as double? ?? -1.0).toInt(),
        personToPersonPersonalRelationshipTypeName: json['PERSON_TO_PERSON_PERSONAL_RELATIONSHIP_TYPE_NAME'] as String? ?? '',
        personToPersonPersonalRelationshipTypeNameEn: json['PERSON_TO_PERSON_PERSONAL_RELATIONSHIP_TYPE_NAME_EN'] as String? ?? '',
        currentLastNameParent: json['CURRENT_LAST_NAME_PARENT'] as String? ?? '',
        currentFirstNameParent: json['CURRENT_FIRST_NAME_PARENT'] as String? ?? '',
        currentMiddleNameParent: json['CURRENT_MIDDLE_NAME_PARENT'] as String? ?? '',
        currentPhoneNumber1Parent: json['CURRENT_PHONE_NUMBER_1_PARENT'] as String? ?? '',
        currentPhoneNumber2Parent: json['CURRENT_PHONE_NUMBER_2_PARENT'] as String? ?? '',
        pupilWeight: json['PUPIL_WEIGHT'] as int ? ?? -1,
        pupilHeight: json['PUPIL_HEIGHT'] as int ? ?? -1,
        pupilToPupilStatusRelationshipTypeId: (json['PUPIL_TO_PUPIL_STATUS_RELATIONSHIP_TYPE_ID'] as double? ?? -1.0).toInt(),
        pupilToPupilStatusRelationshipTypeName: json['PUPIL_TO_PUPIL_STATUS_RELATIONSHIP_TYPE_NAME'] as String? ?? '',
        pupilToPupilStatusRelationshipTypeNameEn: json['PUPIL_TO_PUPIL_STATUS_RELATIONSHIP_TYPE_NAME_EN'] as String? ?? '',
        datetime: json['DATETIME'] as String? ?? '',
        reason: json['REASON'] as String? ?? '',
        personDetail: person
    );
  }
}
