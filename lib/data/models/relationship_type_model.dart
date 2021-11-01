import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/entities/relationship_type.dart';


class RelationshipTypeModel extends RelationshipType{
  const RelationshipTypeModel({
    int? personToPersonPersonalRelationshipTypeId,
    String? personToPersonPersonalRelationshipTypeName,
    String? personToPersonPersonalRelationshipTypeNameEn,
    String? description,
    String? descriptionEn,
  }) : super(
    personToPersonPersonalRelationshipTypeId: personToPersonPersonalRelationshipTypeId,
    personToPersonPersonalRelationshipTypeName: personToPersonPersonalRelationshipTypeName,
    personToPersonPersonalRelationshipTypeNameEn: personToPersonPersonalRelationshipTypeNameEn,
    description: description,
    descriptionEn: descriptionEn,
  );

  factory RelationshipTypeModel.fromJson(Map<String, dynamic> json) {
    return RelationshipTypeModel(
      personToPersonPersonalRelationshipTypeId: (json['PERSON_TO_PERSON_PERSONAL_RELATIONSHIP_TYPE_ID'] as double? ?? -1.0).toInt(),
      personToPersonPersonalRelationshipTypeName: json['PERSON_TO_PERSON_PERSONAL_RELATIONSHIP_TYPE_NAME'] as String? ?? '',
      personToPersonPersonalRelationshipTypeNameEn: json['PERSON_TO_PERSON_PERSONAL_RELATIONSHIP_TYPE_NAME_EN'] as String? ?? '',
      description: json['DESCRIPTION'] as String? ?? '',
      descriptionEn: json['DESCRIPTION_EN'] as String? ?? '',
    );
  }
}
