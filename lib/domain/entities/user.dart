import 'package:children_pickup_monitoring/common/constants/db_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: DBConstants.kUserTableName)
class User extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int userId;
  final int personId;
  final String currentFirstName;
  final String currentLastName;
  final String? currentMiddleName;
  final String loginTime;
  final int roleId;
  final String roleName;
  final bool roleAllowAdd;
  final bool roleAllowUpdate;
  final bool roleAllowDelete;
  final int fromParentId;
  final int toPupilId;
  final String staffIdNumber;
  final int classId;
  final String className;

  const User({
    required this.userId,
    required this.personId,
    required this.currentFirstName,
    required this.currentLastName,
    this.currentMiddleName,
    required this.loginTime,
    required this.roleId,
    required this.roleName,
    required this.roleAllowAdd,
    required this.roleAllowUpdate,
    required this.roleAllowDelete,
    required this.fromParentId,
    required this.toPupilId,
    required this.staffIdNumber,
    required this.classId,
    required this.className
  });

  @override
  List<Object> get props {
    return [
      userId,
      personId,
      currentFirstName,
      currentLastName,
      currentMiddleName!,
      loginTime,
      roleId,
      roleName,
      roleAllowAdd,
      roleAllowUpdate,
      roleAllowDelete,
      fromParentId,
      toPupilId,
      staffIdNumber,
      className,
      classId
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() => <String, dynamic>{
        "USER_ID": userId,
        "PERSON_ID": personId,
        "CURRENT_FIRST_NAME": currentFirstName,
        "CURRENT_LAST_NAME": currentLastName,
        "CURRENT_MIDDLE_NAME": currentMiddleName,
        "LOGIN_TIME": loginTime,
        "ROLE_ID": roleId,
        "ROLE_NAME": roleName,
        "ROLE_ALLOW_ADD": roleAllowAdd,
        "ROLE_ALLOW_UPDATE": roleAllowUpdate,
        "ROLE_ALLOW_DELETE": roleAllowDelete,
        "FROM_PARENT_ID": fromParentId,
        "TO_PUPIL_ID": toPupilId,
        "STAFF_ID_NUMBER": staffIdNumber,
        "CLASS_ID": classId,
        "CLASS_NAME": className,
      };
}
