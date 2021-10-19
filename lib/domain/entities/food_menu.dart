import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final int? timespanId;
  final int? menuTypeId;
  final String? menuTypeName;
  final String? menuTypeNameEn;
  final String? description;
  final String? descriptionEn;
  final String? fromDate;
  final String? thruDate;
  final String? briefDescription;
  final String? briefDescriptionEn;
  final String? menuThumbnail;
  final String? menuTypeThumbnail;
  final String? picture1;
  final String? picture2;
  final String? picture3;
  final String? picture4;
  final String? picture5;

  const Food({
    this.timespanId,
    this.menuTypeId,
    this.menuTypeName,
    this.menuTypeNameEn,
    this.description,
    this.descriptionEn,
    this.fromDate,
    this.thruDate,
    this.briefDescription,
    this.briefDescriptionEn,
    this.menuThumbnail,
    this.menuTypeThumbnail,
    this.picture1,
    this.picture2,
    this.picture3,
    this.picture4,
    this.picture5,
  });

  @override
  List<Object?> get props {
    return [
      timespanId!,
      menuTypeId!,
      menuTypeName!,
      menuTypeNameEn!,
      description!,
      descriptionEn!,
      fromDate!,
      thruDate!,
      briefDescription!,
      briefDescriptionEn!,
      menuThumbnail!,
      menuTypeThumbnail!,
      picture1!,
      picture2!,
      picture3!,
      picture4!,
      picture5!,
    ];
  }
}

class FoodType extends Equatable {
  final int foodTypeId;
  final String foodTypeName;
  final List<Food> foods;

  const FoodType(
      {required this.foodTypeId,
      required this.foodTypeName,
      required this.foods});

  @override
  List<Object?> get props => [foodTypeId, foodTypeName, foods];
}

class FoodMenu extends Equatable {
  final String date;
  final List<FoodType> foodTypes;

  const FoodMenu({required this.date, required this.foodTypes});

  @override
  List<Object?> get props => [date, foodTypes];
}
