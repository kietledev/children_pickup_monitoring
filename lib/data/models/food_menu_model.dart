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
  factory FoodTypeModel.fromJson(Map<String, dynamic> json) {
    var list = json['DETAIL'] as List;
    List<FoodModel> foods = list.map((i) => FoodModel.fromJson(i)).toList();
    return FoodTypeModel(
        foodTypeId: (json['MENU_TYPE_ID'] as double? ?? -1.0).toInt(),
        foodTypeName: json['MENU_TYPE_NAME'] as String? ?? '',
        foods: foods

    );
  }
}

class FoodMenuModel extends FoodMenu {
  const FoodMenuModel({
    required String date,
    required List<FoodTypeModel> foodTypes,
  }) : super(date: date, foodTypes: foodTypes);
  factory FoodMenuModel.fromJson(Map<String, dynamic> json) {
    var list = json['MENU_TYPE'] as List;
    List<FoodTypeModel> foodTypes = list.map((i) => FoodTypeModel.fromJson(i)).toList();
    return FoodMenuModel(
        date: json["DATE_MENU"]as String? ?? '',
        foodTypes: foodTypes,
    );
  }
}