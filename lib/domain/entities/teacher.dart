import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class Teacher extends Equatable {
  final String? className;
  final String? facilityName;
  final bool? mainResponsibilityTeacher;
  final int? staffId;
  final Person? personDetail;

  const Teacher(
      {
        this.className,
        this.facilityName,
        this.mainResponsibilityTeacher,
        this.staffId,
        this.personDetail
      });

  @override
  List<Object> get props {
    return [
      className!,
      facilityName!,
      mainResponsibilityTeacher!,
      staffId!,
      personDetail!,
    ];
  }

  @override
  bool get stringify => true;

  String getFullName() {
    if (personDetail!.currentMiddleName!.isEmpty) {
      return '${personDetail!.currentLastName!.trim()} ${personDetail!.currentFirstName!.trim()}';
    } else {
      return personDetail!.currentLastName!.trim() +
          ' ' +
          personDetail!.currentMiddleName!.trim() +
          ' ' +
          personDetail!.currentFirstName!.trim();
    }
  }
}
