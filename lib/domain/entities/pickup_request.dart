import 'package:equatable/equatable.dart';

class PickUpRequest extends Equatable{
  final int? requestId;
  final int? requestByParentId;
  final String? requestDatetime;
  final int? pickUpPlaceId;
  final int? pickUpPupilId1;
  final int? pickUpPupilId2;
  final int? pickUpPupilId3;
  final int? approvedByStaffId;
  final String? approvedByStaffScript;
  final String? approvedByStaffDatetime;
  final String? pickUpToken;
  final String? pickUpTokenScript;
  final String? pickUpTokenFromDatetime;
  final String? pickUpTokenThruDatetime;
  final String? pickUpTokenDestroyed;
  final String? pickUpTokenDestroyedBy;
  final String? pickUpTokenDestroyedScript;
  final String? pickUpTokenDestroyedDatetime;
  final String? confirmPickedUp;
  final String? confirmPickedUpBy;
  final String? confirmPickedUpScript;
  final String? confirmPickedUpDatetime;
  final int? requestByUserId;
  final String? qrCode;
  final String? idCard;
  final int? status;
  final String? parent;
  final String? pickUpPlace;
  const PickUpRequest({
    this.requestId,
    this.requestByParentId,
    this.requestDatetime,
    this.pickUpPlaceId,
    this.pickUpPupilId1,
    this.pickUpPupilId2,
    this.pickUpPupilId3,
    this.approvedByStaffId,
    this.approvedByStaffScript,
    this.approvedByStaffDatetime,
    this.pickUpToken,
    this.pickUpTokenScript,
    this.pickUpTokenFromDatetime,
    this.pickUpTokenThruDatetime,
    this.pickUpTokenDestroyed,
    this.pickUpTokenDestroyedBy,
    this.pickUpTokenDestroyedScript,
    this.pickUpTokenDestroyedDatetime,
    this.confirmPickedUp,
    this.confirmPickedUpBy,
    this.confirmPickedUpScript,
    this.confirmPickedUpDatetime,
    this.requestByUserId,
    this.qrCode,
    this.idCard,
    this.status,
    this.parent,
    this.pickUpPlace,
  });
  @override
  // TODO: implement props
  List<Object?> get props{
    return[
      requestId!,
      requestByParentId!,
      requestDatetime!,
      pickUpPlaceId!,
      pickUpPupilId1!,
      pickUpPupilId2!,
      pickUpPupilId3!,
      approvedByStaffId!,
      approvedByStaffScript!,
      approvedByStaffDatetime!,
      pickUpToken!,
      pickUpTokenScript!,
      pickUpTokenFromDatetime!,
      pickUpTokenThruDatetime!,
      pickUpTokenDestroyed!,
      pickUpTokenDestroyedBy!,
      pickUpTokenDestroyedScript!,
      pickUpTokenDestroyedDatetime!,
      confirmPickedUp!,
      confirmPickedUpBy!,
      confirmPickedUpScript!,
      confirmPickedUpDatetime!,
      requestByUserId!,
      qrCode!,
      idCard!,
      status!,
      parent!,
      pickUpPlace!,
    ];
  }

}