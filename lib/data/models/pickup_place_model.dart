
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
class PickUpPlaceModel extends PickUpPlace{
  const PickUpPlaceModel({
    int? pickUpPlaceId,
    String? pickUpPlaceName,
    String? pickUpPlaceNameEn,
    String? description,
    String? descriptionEn,
}):super(
    pickUpPlaceId: pickUpPlaceId,
    pickUpPlaceName: pickUpPlaceName,
    pickUpPlaceNameEn: pickUpPlaceNameEn,
    description: description,
    descriptionEn: descriptionEn,
  );
  factory PickUpPlaceModel.fromJson(Map<String, dynamic>json){
    return PickUpPlaceModel(
      pickUpPlaceId: (json['PICK_UP_PLACE_ID'] as double? ?? -1.0).toInt(),
      pickUpPlaceName: json['PICK_UP_PLACE_NAME'] as String? ?? '',
      pickUpPlaceNameEn: json['PICK_UP_PLACE_NAME_EN'] as String? ?? '',
      description: json['DESCRIPTION'] as String? ?? '',
      descriptionEn: json['DESCRIPTION_EN'] as String? ?? '',
    );
  }
}