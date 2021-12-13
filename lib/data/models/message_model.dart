import 'package:children_pickup_monitoring/domain/entities/entities.dart';

class MessageModel extends Message {
  const MessageModel({
    required int messageId,
    required int messageGroupId,
    required int messageTypeId,
    required int messageStateId,
    required String messageContent,
    required String messageContentEn,
    required String userFullName,
    required String userFullNameEn,
    required bool visibled,
    required bool isRemoved,
    required String createdDatetime,
    required int createdByPersonId,
    required String updateDatetime,
    required int updatedByPersonId,
    required String messageGalleryName,
    required String messageGalleryMediaLink,
    required String messageGalleryMediaType,
  }) : super(
          messageId: messageId,
          messageGroupId: messageGroupId,
          messageTypeId: messageTypeId,
          messageStateId: messageStateId,
          messageContent: messageContent,
          messageContentEn: messageContentEn,
          userFullName: userFullName,
          userFullNameEn: userFullNameEn,
          visibled: visibled,
          isRemoved: isRemoved,
          createdDatetime: createdDatetime,
          createdByPersonId: createdByPersonId,
          updateDatetime: updateDatetime,
          updatedByPersonId: updatedByPersonId,
          messageGalleryName: messageGalleryName,
          messageGalleryMediaLink: messageGalleryMediaLink,
          messageGalleryMediaType: messageGalleryMediaType,
        );

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: (json['MESSAGE_ID'] as double? ?? -1.0).toInt(),
      messageGroupId: (json['MESSAGE_GROUP_ID'] as double? ?? -1.0).toInt(),
      messageTypeId: (json['MESSAGE_TYPE_ID'] as double? ?? -1.0).toInt(),
      messageStateId: (json['MESSAGE_STATE_ID'] as double? ?? -1.0).toInt(),
      messageContent: json['MESSAGE_CONTENT'] as String? ?? '',
      messageContentEn: json['MESSAGE_CONTENT_EN'] as String? ?? '',
      userFullName: json['USER_FULL_NAME'] as String? ?? '',
      userFullNameEn: json['USER_FULL_NAME_EN'] as String? ?? '',
      visibled: json['VISIBLED'] as bool? ?? false,
      isRemoved: json['IS_REMOVED']  as bool? ?? false,
      createdDatetime: json['CREATED_DATETIME'] as String? ?? '',
      createdByPersonId:
          (json['CREATED_BY_PERSON_ID'] as double? ?? -1.0).toInt(),
      updateDatetime: json['UPDATE_DATETIME'] as String? ?? '',
      updatedByPersonId:
          (json['UPDATED_BY_PERSON_ID'] as double? ?? -1.0).toInt(),
      messageGalleryName: json['MESSAGE_GALLERY_NAME'] as String? ?? '',
      messageGalleryMediaLink:
          json['MESSAGE_GALLERY_MEDIA_LINK'] as String? ?? '',
      messageGalleryMediaType:
          json['MESSAGE_GALLERY_MEDIA_TYPE'] as String? ?? '',
    );
  }
}
