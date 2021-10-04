
import 'package:children_pickup_monitoring/domain/entities/entities.dart';

class UserModel extends User {
  const UserModel(
      {required double userId,
      required double personId,
      required String currentFirstName,
      required String currentLastName,
      String? currentMiddleName,
      required String loginTime,
      required double fromParentId,
      required double toPupilId})
      : super(
            userId: userId,
            personId: personId,
            currentFirstName: currentFirstName,
            currentMiddleName: currentMiddleName,
            currentLastName: currentLastName,
            loginTime: loginTime,
            fromParentId: fromParentId,
            toPupilId: toPupilId);

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        userId: map['USER_ID'] as double? ?? 0.0,
        personId: map['PERSON_ID'] as double? ?? 0.0,
        currentFirstName: map['CURRENT_FIRST_NAME'] as String? ?? "",
        currentLastName: map["CURRENT_LAST_NAME"] as String? ?? "",
        currentMiddleName: map["CURRENT_MIDDLE_NAME"] as String? ?? "",
        loginTime: map["LOGIN_TIME"] as String? ?? "",
        fromParentId: map["FROM_PARENT_ID"] as double? ?? 0.0,
        toPupilId: map["TO_PUPIL_ID"] as double? ?? 0.0);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        "USER_ID": userId,
        "PERSON_ID": personId,
        "CURRENT_FIRST_NAME": currentFirstName,
        "CURRENT_LAST_NAME": currentLastName,
        "CURRENT_MIDDLE_NAME": currentMiddleName,
        "LOGIN_TIME": loginTime,
        "FROM_PARENT_ID": fromParentId,
        "TO_PUPIL_ID": toPupilId,
      };
}
