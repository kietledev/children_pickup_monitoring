import 'package:children_pickup_monitoring/domain/entities/entities.dart';

class PickUpRequestModel extends PickUpRequest{
  const PickUpRequestModel({
    int? requestId,
    int? requestByParentId,
    String? requestDatetime,
    int? pickUpPlaceId,
    int? pickUpPupilId1,
    int? pickUpPupilId2,
    int? pickUpPupilId3,
    int? approvedByStaffId,
    String? approvedByStaffScript,
    String? approvedByStaffDatetime,
    String? pickUpToken,
    String? pickUpTokenScript,
    String? pickUpTokenFromDatetime,
    String? pickUpTokenThruDatetime,
    String? pickUpTokenDestroyed,
    String? pickUpTokenDestroyedBy,
    String? pickUpTokenDestroyedScript,
    String? pickUpTokenDestroyedDatetime,
    String? confirmPickedUp,
    String? confirmPickedUpBy,
    String? confirmPickedUpScript,
    String? confirmPickedUpDatetime,
    int? requestByUserId,
    String? qrCode,
    String? idCard,
    int? status,
    String? parent,
    String? pickUpPlace,
  }):super(
    requestId: requestId,
    requestByParentId: requestByParentId,
    requestDatetime: requestDatetime,
    pickUpPlaceId: pickUpPlaceId,
    pickUpPupilId1: pickUpPupilId1,
    pickUpPupilId2: pickUpPupilId2,
    pickUpPupilId3: pickUpPupilId3,
    approvedByStaffId: approvedByStaffId,
    approvedByStaffScript: approvedByStaffScript,
    approvedByStaffDatetime: approvedByStaffDatetime,
    pickUpToken: pickUpToken,
    pickUpTokenScript: pickUpTokenScript,
    pickUpTokenFromDatetime: pickUpTokenFromDatetime,
    pickUpTokenThruDatetime: pickUpTokenThruDatetime,
    pickUpTokenDestroyed: pickUpTokenDestroyed,
    pickUpTokenDestroyedBy: pickUpTokenDestroyedBy,
    pickUpTokenDestroyedScript: pickUpTokenDestroyedScript,
    pickUpTokenDestroyedDatetime: pickUpTokenDestroyedDatetime,
    confirmPickedUp: confirmPickedUp,
    confirmPickedUpBy: confirmPickedUpBy,
    confirmPickedUpScript: confirmPickedUpScript,
    confirmPickedUpDatetime: confirmPickedUpDatetime,
    requestByUserId: requestByUserId,
    qrCode: qrCode,
    idCard: idCard,
    status: status,
    parent: parent,
    pickUpPlace: pickUpPlace,
  );
  factory PickUpRequestModel.fromJson(Map<String, dynamic>json){
    return PickUpRequestModel(
      requestId: (json['REQUEST_ID'] as double? ?? -1.0).toInt(),
      requestByParentId: (json['REQUEST_BY_PARENT_ID'] as double? ?? -1.0).toInt(),
      requestDatetime: json['REQUEST_DATETIME'] as String? ?? '',
      pickUpPlaceId: json['PICK_UP_PLACE_ID'] as int? ?? -1,
      pickUpPupilId1: (json['PICK_UP_PUPIL_ID_1'] as double? ?? -1.0).toInt(),
      pickUpPupilId2: (json['PICK_UP_PUPIL_ID_2'] as double? ?? -1.0).toInt(),
      pickUpPupilId3: (json['PICK_UP_PUPIL_ID_3'] as double? ?? -1.0).toInt(),
      approvedByStaffId: (json['APPROVED_BY_STAFF_ID'] as double? ?? -1.0).toInt(),
      approvedByStaffScript: json['APPROVED_BY_STAFF_SCRIPT'] as String? ?? '',
      approvedByStaffDatetime: json['APPROVED_BY_STAFF_DATETIME'] as String? ?? '',
      pickUpToken: json['PICK_UP_TOKEN'] as String? ?? '',
      pickUpTokenScript: json['PICK_UP_TOKEN_SCRIPT'] as String? ?? '',
      pickUpTokenFromDatetime: json['PICK_UP_TOKEN_FROM_DATETIME'] as String? ?? '',
      pickUpTokenThruDatetime: json['PICK_UP_TOKEN_THRU_DATETIME'] as String? ?? '',
      pickUpTokenDestroyed: json['PICK_UP_TOKEN_DESTROYED'] as String? ?? '',
      pickUpTokenDestroyedBy: json['PICK_UP_TOKEN_DESTROYED_BY'] as String? ?? '',
      pickUpTokenDestroyedScript: json['PICK_UP_TOKEN_DESTROYED_SCRIPT'] as String? ?? '',
      pickUpTokenDestroyedDatetime: json['PICK_UP_TOKEN_DESTROYED_DATETIME'] as String? ?? '',
      confirmPickedUp: json['CONFIRM_PICKED_UP'] as String? ?? '',
      confirmPickedUpBy: json['CONFIRM_PICKED_UP_BY'] as String? ?? '',
      confirmPickedUpScript: json['CONFIRM_PICKED_UP_SCRIPT'] as String? ?? '',
      confirmPickedUpDatetime: json['CONFIRM_PICKED_UP_DATETIME'] as String? ?? '',
      requestByUserId: (json['REQUEST_BY_USER_ID'] as double? ?? -1.0).toInt(),
      qrCode: json['QR_CODE'] as String? ?? '',
      idCard: json['ID_CARD'] as String? ?? '',
      status: json['STATUS'] as int? ?? -1,
      parent: json['PARENT'] as String? ?? '',
      pickUpPlace: json['PICK_UP_PLACE'] as String? ?? '',
    );
  }

}