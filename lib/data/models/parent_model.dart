
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/data/models/person_table_model.dart';
import 'package:children_pickup_monitoring/domain/entities/parent.dart';

class ParentModel extends Parent{
  const ParentModel({
    int? parentId,
    String? personToPersonPersonalRelationshipTypeName,
    String? personToPersonPersonalRelationshipTypeNameEn,
    bool? approved,
    int? approvedByUserId,
    String? approvedDatetime,
    bool? accountUser,
    PersonTableModel? personDetail
  }) : super(
      parentId: parentId,
      personToPersonPersonalRelationshipTypeName: personToPersonPersonalRelationshipTypeName,
      personToPersonPersonalRelationshipTypeNameEn: personToPersonPersonalRelationshipTypeNameEn,
      approved: approved,
      approvedByUserId: approvedByUserId,
      approvedDatetime: approvedDatetime,
      accountUser: accountUser,
      personDetail: personDetail
  );

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    var personDetail = json['PERSON_DETAIL'];
    PersonTableModel person = PersonTableModel.fromJson(personDetail);
    return ParentModel(
        parentId: (json['PARENT_ID'] as double? ?? -1.0).toInt(),
        personToPersonPersonalRelationshipTypeName: json['PERSON_TO_PERSON_PERSONAL_RELATIONSHIP_TYPE_NAME'] as String? ?? '',
        personToPersonPersonalRelationshipTypeNameEn: json['PERSON_TO_PERSON_PERSONAL_RELATIONSHIP_TYPE_NAME_EN'] as String? ?? '',
        approved: json['APPROVED'] as bool? ?? false,
        approvedByUserId: (json['APPROVED_BY_USER_ID'] as double? ?? -1.0).toInt(),
        approvedDatetime: json['APPROVED_DATETIME'] as String? ?? '',
        accountUser: json['ACCOUNT_USER'] as bool? ?? false,
        personDetail: person

    );
  }

}