import 'package:children_pickup_monitoring/common/constants/db_constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
@Entity(tableName: DBConstants.kPupilTableName)
class TablePupil extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? pupilId;
  final String? className;
  final int? classId;
  final String? personToPersonPersonalRelationshipTypeName;
  final String? personToPersonPersonalRelationshipTypeNameEn;
  final String? currentLastNameParent;
  final String? currentFirstNameParent;
  final String? currentMiddleNameParent;
  final String? currentPhoneNumber1Parent;
  final String? currentPhoneNumber2Parent;
  final int? personId;

  const TablePupil({
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
    this.personId,

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
      personId!,

    ];
  }

  @override
  bool get stringify => true;





}

