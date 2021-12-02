import 'package:children_pickup_monitoring/common/constants/db_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
@Entity(tableName: DBConstants.kQRGeneratedTableName)
class TablePickUpGenerated extends Equatable {
  @PrimaryKey(autoGenerate: true)
  int? requestId;
  String? timePickUp;
  int? pupilId1;
  int? pupilId2;
  int? pupilId3;
  String? cardId;
  String? datePickUp;
  String? placePickUp;
  int? parentId;
  String? addressSchool;
  String? stringQrcode;
  int? status;

  TablePickUpGenerated({
    this.requestId,
    this.timePickUp,
    this.pupilId1,
    this.pupilId2,
    this.pupilId3,
    this.cardId,
    this.datePickUp,
    this.placePickUp,
    this.parentId,
    this.addressSchool,
    this.stringQrcode,
    this.status,
}

      );

  @override
  List<Object> get props {
    return [
      requestId!,
      timePickUp!,
      pupilId1!,
      pupilId2!,
      pupilId3!,
      parentId!,
      cardId!,
      datePickUp!,
      placePickUp!,
      parentId!,
      addressSchool!,
      stringQrcode!,
      status!
    ];
  }

  @override
  bool get stringify => true;

  // Map<String, Object?> toMap() {
  //   var map = new Map<String, dynamic>();
  //   map["requestId"] = requestId;
  //   map["cardId"] = cardId;
  //   map["timePickUp"] = timePickUp;
  //   map["pupilId1"] =pupilId1;
  //   map["pupilId2"] = pupilId2;
  //   map["pupilId3"] = pupilId3;
  //   map["datePickUp"] = datePickUp;
  //   map["placePickUp"] = placePickUp;
  //   map["parentId"] = parentId;
  //   map["addressSchool"] = addressSchool;
  //   map["stringQrcode"] = stringQrcode;
  //   map["status"] = status;
  //   return map;
  // }
}