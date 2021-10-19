import 'package:children_pickup_monitoring/domain/entities/entities.dart';

class FoodModel extends Food {
  const FoodModel({
    int? timespanId,
    int? menuTypeId,
    String? menuTypeName,
    String? menuTypeNameEn,
    String? description,
    String? descriptionEn,
    String? fromDate,
    String? thruDate,
    String? briefDescription,
    String? briefDescriptionEn,
    String? menuThumbnail,
    String? menuTypeThumbnail,
    String? picture1,
    String? picture2,
    String? picture3,
    String? picture4,
    String? picture5,
  }) : super(
          timespanId: timespanId,
          menuTypeId: menuTypeId,
          menuTypeName: menuTypeName,
          menuTypeNameEn: menuTypeNameEn,
          description: description,
          descriptionEn: descriptionEn,
          fromDate: fromDate,
          thruDate: thruDate,
          briefDescription: briefDescription,
          briefDescriptionEn: briefDescriptionEn,
          menuThumbnail: menuThumbnail,
          menuTypeThumbnail: menuTypeThumbnail,
          picture1: picture1,
          picture2: picture2,
          picture3: picture3,
          picture4: picture4,
          picture5: picture5,
        );

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      timespanId: (json['TIMESPAN_ID'] as double? ?? -1.0).toInt(),
      menuTypeId: (json['MENU_TYPE_ID'] as double? ?? -1.0).toInt(),
      menuTypeName: json['MENU_TYPE_NAME'] as String? ?? '',
      menuTypeNameEn: json['MENU_TYPE_NAME_EN'] as String? ?? '',
      description: json['DESCRIPTION'] as String? ?? '',
      descriptionEn: json['DESCRIPTION_EN'] as String? ?? '',
      fromDate: json['FROM_DATE'] as String? ?? '',
      thruDate: json['THRU_DATE'] as String? ?? '',
      briefDescription: json['BRIEF_DESCRIPTION'] as String? ?? '',
      briefDescriptionEn: json['BRIEF_DESCRIPTION_EN'] as String? ?? '',
      menuThumbnail: json['MENU_THUMBNAIL'] as String? ?? '',
      menuTypeThumbnail: json['MENU_TYPE_THUMBNAIL'] as String? ?? '',
      picture1: json['PICTURE_1'] as String? ?? '',
      picture2: json['PICTURE_2'] as String? ?? '',
      picture3: json['PICTURE_3'] as String? ?? '',
      picture4: json['PICTURE_4'] as String? ?? '',
      picture5: json['PICTURE_5'] as String? ?? '',
    );
  }
}

class FoodTypeModel extends FoodType {
  const FoodTypeModel({
    required int foodTypeId,
    required String foodTypeName,
    required List<Food> foods,
  }) : super(foodTypeId: foodTypeId, foodTypeName: foodTypeName, foods: foods);
}

// class FoodMenuModel extends FoodMenu {

// }