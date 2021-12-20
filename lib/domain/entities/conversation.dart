import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class Conversation extends Equatable {
  final int? messageGroupId;
  final String? groupTitle;
  final String? groupTitleEn;
  final String? userFullName;
  final String? userFullNameEn;
  final bool? isCoupleGroup;
  final String? isClassGroup;
  final Message? lastMessage;

  const Conversation({
    this.messageGroupId,
    this.groupTitle,
    this.groupTitleEn,
    this.userFullName,
    this.userFullNameEn,
    this.isCoupleGroup,
    this.isClassGroup,
    this.lastMessage,
  });

  @override
  List<Object?> get props {
    return [
      messageGroupId!,
      groupTitle!,
      groupTitleEn!,
      userFullName!,
      userFullNameEn!,
      isCoupleGroup!,
      isClassGroup!,
      lastMessage!,
    ];
  }
}
