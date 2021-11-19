
import 'package:children_pickup_monitoring/domain/entities/entities.dart';

class PickUpGenerated {
  List<Pupil>? pupils;
  String? timePickUp;
  int? requestId;
  int? pupilId1;
  int? pupilId2;
  int? pupilId3;
  String? cardId;
  String? datePickUp;
  String? placePickUp;
  Parent? parentPickUp;
  int? parentId;
  String? addressSchool;
  String? stringQrcode;
  int? status;

  PickUpGenerated(
      this.pupils,
      this.timePickUp,
      this.requestId,
      this.pupilId1,
      this.pupilId2,
      this.pupilId3,
      this.cardId,
      this.datePickUp,
      this.placePickUp,
      this.parentPickUp,
      this.parentId,
      this.addressSchool,
      this.stringQrcode,
      this.status,
      );
  Map<String, Object?> toMap() {
    var map = new Map<String, dynamic>();
    map["requestId"] = requestId;
    map["cardId"] = cardId;
    map["timePickUp"] = timePickUp;
    map["pupilId1"] =pupilId1;
    map["pupilId2"] = pupilId2;
    map["pupilId3"] = pupilId3;
    map["datePickUp"] = datePickUp;
    map["placePickUp"] = placePickUp;
    map["parentId"] = parentId;
    map["addressSchool"] = addressSchool;
    map["stringQrcode"] = stringQrcode;
    map["status"] = status;
    return map;
  }
}