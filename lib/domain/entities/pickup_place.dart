import 'package:equatable/equatable.dart';

class PickUpPlace extends Equatable{
  final int? pickUpPlaceId;
  final String? pickUpPlaceName;
  final String? pickUpPlaceNameEn;
  final String? description;
  final String? descriptionEn;
  const PickUpPlace({
    this.pickUpPlaceId,
    this.pickUpPlaceName,
    this.pickUpPlaceNameEn,
    this.description,
    this.descriptionEn,
});
  @override
  // TODO: implement props
  List<Object?> get props{
    return[
      pickUpPlaceId!,
      pickUpPlaceName!,
      pickUpPlaceNameEn!,
      description!,
      descriptionEn!,
    ];
  }

}