
import 'package:equatable/equatable.dart';

class ClassRoom extends Equatable {
  final int? classId;
  final String? className;
  final String? facilityName;
  final int? timespanId;
  final String? effectiveDate;
  final int? classTypeId;
  final int? staffId1;
  final String? currentLastName1;
  final String? currentFirstName1;
  final String? currentMiddleName1;
  final bool? mainResponsibilityTeacher1;
  final int? staffId2;
  final String? currentLastName2;
  final String? currentFirstName2;
  final String? currentMiddleName2;
  final bool? mainResponsibilityTeacher2;
  final int? staffId3;
  final String? currentLastName3;
  final String? currentFirstName3;
  final String? currentMiddleName3;
  final bool? mainResponsibilityTeacher3;
  final int? staffId4;
  final String? currentLastName4;
  final String? currentFirstName4;
  final String? currentMiddleName4;
  final bool? mainResponsibilityTeacher4;
  final int? staffId5;
  final String? currentLastName5;
  final String? currentFirstName5;
  final String? currentMiddleName5;
  final bool? mainResponsibilityTeacher5;

  const ClassRoom(
      {
        this.classId,
        this.className,
        this.facilityName,
        this.timespanId,
        this.effectiveDate,
        this.classTypeId,
        this.staffId1,
        this.currentLastName1,
        this.currentFirstName1,
        this.currentMiddleName1,
        this.mainResponsibilityTeacher1,
        this.staffId2,
        this.currentLastName2,
        this.currentFirstName2,
        this.currentMiddleName2,
        this.mainResponsibilityTeacher2,
        this.staffId3,
        this.currentLastName3,
        this.currentFirstName3,
        this.currentMiddleName3,
        this.mainResponsibilityTeacher3,
        this.staffId4,
        this.currentLastName4,
        this.currentFirstName4,
        this.currentMiddleName4,
        this.mainResponsibilityTeacher4,
        this.staffId5,
        this.currentLastName5,
        this.currentFirstName5,
        this.currentMiddleName5,
        this.mainResponsibilityTeacher5,
      });

  @override
  List<Object> get props {
    return [
      classId!,
      className!,
      facilityName!,
      timespanId!,
      effectiveDate!,
      classTypeId!,
      staffId1!,
      currentLastName1!,
      currentFirstName1!,
      currentMiddleName1!,
      mainResponsibilityTeacher1!,
      staffId2!,
      currentLastName2!,
      currentFirstName2!,
      currentMiddleName2!,
      mainResponsibilityTeacher2!,
      staffId3!,
      currentLastName3!,
      currentFirstName3!,
      currentMiddleName3!,
      mainResponsibilityTeacher3!,
      staffId4!,
      currentLastName4!,
      currentFirstName4!,
      currentMiddleName4!,
      mainResponsibilityTeacher4!,
      staffId5!,
      currentLastName5!,
      currentFirstName5!,
      currentMiddleName5!,
      mainResponsibilityTeacher5!,
    ];
  }

  @override
  bool get stringify => true;

}
