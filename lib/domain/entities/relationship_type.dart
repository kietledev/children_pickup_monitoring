import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class RelationshipType extends Equatable {
    final int? personToPersonPersonalRelationshipTypeId;
    final String? personToPersonPersonalRelationshipTypeName;
    final String? personToPersonPersonalRelationshipTypeNameEn;
    final String? description;
    final String? descriptionEn;

  const RelationshipType(
      {
        this.personToPersonPersonalRelationshipTypeId,
        this.personToPersonPersonalRelationshipTypeName,
        this.personToPersonPersonalRelationshipTypeNameEn,
        this.description,
        this.descriptionEn
      });

  @override
  List<Object> get props {
    return [
      personToPersonPersonalRelationshipTypeId!,
      personToPersonPersonalRelationshipTypeName!,
      personToPersonPersonalRelationshipTypeNameEn!,
      description!,
      descriptionEn!,
    ];
  }

  @override
  bool get stringify => true;

}
