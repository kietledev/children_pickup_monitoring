import 'package:children_pickup_monitoring/domain/entities/entities.dart';

class UserModel extends User {
  const UserModel(
      {required int userId,
      required int personId,
      required String currentFirstName,
      required String currentLastName,
      String? currentMiddleName,
      required String loginTime,
      required int roleId,
      required String roleName,
      required bool roleAllowAdd,
      required bool roleAllowUpdate,
      required bool roleAllowDelete,
      required int fromParentId,
      required int toPupilId})
      : super(
            userId: userId,
            personId: personId,
            currentFirstName: currentFirstName,
            currentMiddleName: currentMiddleName,
            currentLastName: currentLastName,
            loginTime: loginTime,
            roleId: roleId,
            roleName: roleName,
            roleAllowAdd: roleAllowAdd,
            roleAllowUpdate: roleAllowUpdate,
            roleAllowDelete: roleAllowDelete,
            fromParentId: fromParentId,
            toPupilId: toPupilId);

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        userId: (map['USER_ID'] as double? ?? 0.0).toInt(),
        personId: (map['PERSON_ID'] as double? ?? 0.0).toInt(),
        currentFirstName: map['CURRENT_FIRST_NAME'] as String? ?? "",
        currentLastName: map["CURRENT_LAST_NAME"] as String? ?? "",
        currentMiddleName: map["CURRENT_MIDDLE_NAME"] as String? ?? "",
        loginTime: map["LOGIN_TIME"] as String? ?? "",
        roleId: (map['ROLE_ID'] as double? ?? 0.0).toInt(),
        roleName: map["ROLE_NAME"] as String? ?? "",
        roleAllowAdd: map["ROLE_ALLOW_ADD"] as bool? ?? false,
        roleAllowUpdate: map["ROLE_ALLOW_UPDATE"] as bool? ?? false,
        roleAllowDelete: map["ROLE_ALLOW_DELETE"] as bool? ?? false,
        fromParentId: (map["FROM_PARENT_ID"] as double? ?? 0.0).toInt(),
        toPupilId: (map["TO_PUPIL_ID"] as double? ?? 0.0).toInt());
  }

  factory UserModel.json(Map<String, dynamic> map) {
    return UserModel(
        userId: map['USER_ID'] as int? ?? 0,
        personId: map['PERSON_ID'] as int? ?? 0,
        currentFirstName: map['CURRENT_FIRST_NAME'] as String? ?? "",
        currentLastName: map["CURRENT_LAST_NAME"] as String? ?? "",
        currentMiddleName: map["CURRENT_MIDDLE_NAME"] as String? ?? "",
        loginTime: map["LOGIN_TIME"] as String? ?? "",
        roleId: map['ROLE_ID'] as int? ?? 0,
        roleName: map["ROLE_NAME"] as String? ?? "",
        roleAllowAdd: map["ROLE_ALLOW_ADD"] as bool? ?? false,
        roleAllowUpdate: map["ROLE_ALLOW_UPDATE"] as bool? ?? false,
        roleAllowDelete: map["ROLE_ALLOW_DELETE"] as bool? ?? false,
        fromParentId: map["FROM_PARENT_ID"] as int? ?? 0,
        toPupilId: map["TO_PUPIL_ID"] as int? ?? 0);
  }
}
