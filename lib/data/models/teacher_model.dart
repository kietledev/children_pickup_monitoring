import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/teacher.dart';

class TeacherModel extends Teacher {
  const TeacherModel({
    String? className,
    String? facilityName,
    bool? mainResponsibilityTeacher,
    int? staffId,
    PersonModel? personDetail
  }) : super(
    className: className,
    facilityName: facilityName,
    mainResponsibilityTeacher: mainResponsibilityTeacher,
    staffId: staffId,
    personDetail: personDetail
  );

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    var personDetail = json['PERSON_DETAIL'];
    PersonModel person = PersonModel.fromJson(personDetail);
    return TeacherModel(
      className: json['CLASS_NAME'] as String? ?? '',
      facilityName: json['FACILITY_NAME'] as String? ?? '',
      mainResponsibilityTeacher:
          json['MAIN_RESPONSIBILITY_TEACHER'] as bool? ?? false,
      staffId: (json['STAFF_ID'] as double? ?? -1.0).toInt(),
        personDetail: person

    );
  }
}
