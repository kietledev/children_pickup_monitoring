import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/pupil.dart';

class PupilModel extends Pupil {
  const PupilModel({
    String? className,
    int? pupilId,
    String? currentLastNameParent,
    String? currentFirstNameParent,
    String? currentMiddleNameParent,
    String? currentPhoneNumber1Parent,
    String? currentPhoneNumber2Parent,
    PersonModel? personDetail,
  }) : super(
    className: className,
    pupilId: pupilId,
    currentLastNameParent: currentLastNameParent,
    currentFirstNameParent: currentFirstNameParent,
    currentMiddleNameParent: currentMiddleNameParent,
    currentPhoneNumber1Parent: currentPhoneNumber1Parent,
    currentPhoneNumber2Parent: currentPhoneNumber2Parent,
    personDetail: personDetail,
        );

  factory PupilModel.fromJson(Map<String, dynamic> json) {
    var personDetail = json['PERSON_DETAIL'];
    PersonModel person = PersonModel.fromJson(personDetail);
    return PupilModel(
      className: json['CLASS_NAME'] as String? ?? '',
      pupilId: (json['PUPIL_ID'] as double? ?? -1.0).toInt(),
      currentLastNameParent: json['CURRENT_LAST_NAME_PARENT'] as String? ?? '',
      currentFirstNameParent: json['CURRENT_FIRST_NAME_PARENT'] as String? ?? '',
      currentMiddleNameParent: json['CURRENT_MIDDLE_NAME_PARENT'] as String? ?? '',
      currentPhoneNumber1Parent: json['CURRENT_PHONE_NUMBER_1_PARENT'] as String? ?? '',
      currentPhoneNumber2Parent: json['CURRENT_PHONE_NUMBER_2_PARENT'] as String? ?? '',
      personDetail: person
    );
  }
}
