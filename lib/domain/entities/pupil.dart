import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class Pupil extends Equatable {
  final String? className;
  final int? pupilId;
  final int? classId;
  final String? personToPersonPersonalRelationshipTypeName;
  final String? personToPersonPersonalRelationshipTypeNameEn;
  final String? currentLastNameParent;
  final String? currentFirstNameParent;
  final String? currentMiddleNameParent;
  final String? currentPhoneNumber1Parent;
  final String? currentPhoneNumber2Parent;
  final Person? personDetail;

  const Pupil({
    this.className,
    this.pupilId,
    this.classId,
    this.personToPersonPersonalRelationshipTypeName,
    this.personToPersonPersonalRelationshipTypeNameEn,
    this.currentLastNameParent,
    this.currentFirstNameParent,
    this.currentMiddleNameParent,
    this.currentPhoneNumber1Parent,
    this.currentPhoneNumber2Parent,
    this.personDetail,

  });

  @override
  List<Object> get props {
    return [
      className!,
      pupilId!,
      classId!,
      personToPersonPersonalRelationshipTypeName!,
      personToPersonPersonalRelationshipTypeNameEn!,
      currentLastNameParent!,
      currentFirstNameParent!,
      currentMiddleNameParent!,
      currentPhoneNumber1Parent!,
      currentPhoneNumber2Parent!,
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
  String getFullNameParent() {
    if (currentMiddleNameParent!.isEmpty) {
      return '${currentLastNameParent!.trim()} ${currentFirstNameParent!.trim()}';
    } else {
      return currentLastNameParent!.trim() +
          ' ' +
         currentMiddleNameParent!.trim() +
          ' ' +
          currentFirstNameParent!.trim();
    }
  }
  Map<String, Object?> toMap() {
    var map = new Map<String, dynamic>();
    map["pupilId"] = pupilId;
    map["personToPersonPersonalRelationshipTypeName "] = personToPersonPersonalRelationshipTypeName ;
    map["personToPersonPersonalRelationshipTypeNameEn"] = personToPersonPersonalRelationshipTypeNameEn;
    map["personId"] = personDetail!.personId;
    map["currentLastName"] = personDetail!.currentLastName;
    map["currentMiddleName"] = personDetail!.currentMiddleName;
    map["currentFirstName"] = personDetail!.currentFirstName;
    map["className"] = className;
    map["classId"] = classId;
    return map;
  }
}
class PupilCheck extends Equatable {
  bool? isCheck;
  Pupil? pupil;
  PupilCheck({ this.isCheck,  this.pupil});
  @override
  List<Object?> get props => [isCheck, pupil];

  String getFullName() {
    if (pupil!.currentMiddleNameParent!.isEmpty) {
      return '${pupil!.currentLastNameParent!.trim()} ${pupil!.currentFirstNameParent!.trim()}';
    } else {
      return pupil!.currentLastNameParent!.trim() +
          ' ' +
          pupil!.currentMiddleNameParent!.trim() +
          ' ' +
          pupil!.currentFirstNameParent!.trim();
    }
  }

}
