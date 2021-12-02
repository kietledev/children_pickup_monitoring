import 'package:children_pickup_monitoring/common/constants/db_constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
@Entity(tableName: DBConstants.kParentTableName)
class TableParent extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? parentId;
  final String? personToPersonPersonalRelationshipTypeName;
  final String?  personToPersonPersonalRelationshipTypeNameEn;
  final bool? approved;
  final int? approvedByUserId;
  final String? approvedDatetime;
  final int? personId;
  final bool? accountUser;

  const TableParent(
      {
        this.parentId,
        this.personToPersonPersonalRelationshipTypeName,
        this.personToPersonPersonalRelationshipTypeNameEn,
        this.approved,
        this.approvedByUserId,
        this.approvedDatetime,
        this.personId,
        this.accountUser
      });

  @override
  List<Object> get props {
    return [
      parentId!,
      personToPersonPersonalRelationshipTypeName!,
      personToPersonPersonalRelationshipTypeNameEn!,
      approved!,
      approvedByUserId!,
      approvedDatetime!,
      personId!,
      accountUser!,

    ];
  }

}
