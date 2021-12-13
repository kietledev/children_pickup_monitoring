import 'package:children_pickup_monitoring/data/models/message_model.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';

class ConversationModel extends Conversation {
  const ConversationModel({
    int? messageGroupId,
    String? groupTitle,
    String? groupTitleEn,
    String? userFullName,
    String? userFullNameEn,
    bool? isCoupleGroup,
    String? isClassGroup,
    Message? lastMessage,
  }) : super(
          messageGroupId: messageGroupId,
          groupTitle: groupTitle,
          groupTitleEn: groupTitleEn,
          userFullName: userFullName,
          userFullNameEn: userFullNameEn,
          isCoupleGroup: isCoupleGroup,
          isClassGroup: isClassGroup,
          lastMessage: lastMessage,
        );

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      messageGroupId: (json['MESSAGE_GROUP_ID'] as double? ?? -1.0).toInt(),
      groupTitle: json['GROUP_TITLE'] as String? ?? '',
      groupTitleEn: json['GROUP_TITLE_EN'] as String? ?? '',
      userFullName: json['USER_FULL_NAME'] as String? ?? '',
      userFullNameEn: json['USER_FULL_NAME_EN'] as String? ?? '',
      isCoupleGroup: json['IS_COUPLE_GROUP'] as bool? ?? false,
      isClassGroup: json['IS_CLASS_GROUP'] as String? ?? '',
      lastMessage: MessageModel.fromJson(json['LAST_MESSAGE']),
    );
  }
}
