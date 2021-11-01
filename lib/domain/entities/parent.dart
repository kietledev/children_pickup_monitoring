

import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class Parent extends Equatable {
  final int? parentId;
  final String? personToPersonPersonalRelationshipTypeName;
  final String?  personToPersonPersonalRelationshipTypeNameEn;
  final bool? approved;
  final int? approvedByUserId;
  final String? approvedDatetime;
  final Person? personDetail;
  final bool? accountUser;

  const Parent(
      {
        this.parentId,
        this.personToPersonPersonalRelationshipTypeName,
        this.personToPersonPersonalRelationshipTypeNameEn,
        this.approved,
        this.approvedByUserId,
        this.approvedDatetime,
        this.personDetail,
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
      personDetail!,
      accountUser!,

    ];
  }

  @override
  bool get stringify => true;

  String getFullName() {
    if (personDetail!.currentMiddleName!.isEmpty) {
      return '${personDetail!.currentLastName!.trim()} ${personDetail!.currentFirstName!.trim()}';
    } else {
      return personDetail!.currentLastName!.trim() +
          ' ' +
          personDetail!.currentMiddleName!.trim() +
          ' ' +
          personDetail!.currentFirstName!.trim();
    }
  }
}
