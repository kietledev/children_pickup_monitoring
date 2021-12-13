import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final int? messageId;
  final int? messageGroupId;
  final int? messageTypeId;
  final int? messageStateId;

  final String? messageContent;
  final String? messageContentEn;
  final String? userFullName;
  final String? userFullNameEn;
  final bool? visibled;
  final bool? isRemoved;
  final String? createdDatetime;
  final int? createdByPersonId;
  final String? updateDatetime;
  final int? updatedByPersonId;
  final String? messageGalleryName;
  final String? messageGalleryMediaLink;
  final String? messageGalleryMediaType;

  const Message({
     this.messageId,
     this.messageGroupId,
     this.messageTypeId,
     this.messageStateId,
     this.messageContent,
     this.messageContentEn,
     this.userFullName,
     this.userFullNameEn,
     this.visibled,
     this.isRemoved,
     this.createdDatetime,
     this.createdByPersonId,
     this.updateDatetime,
     this.updatedByPersonId,
     this.messageGalleryName,
     this.messageGalleryMediaLink,
     this.messageGalleryMediaType,
  });

  @override
  List<Object> get props {
    return [
      messageId!,
      messageGroupId!,
      messageTypeId!,
      messageStateId!,
      messageContent!,
      messageContentEn!,
      userFullName!,
      userFullNameEn!,
      visibled!,
      isRemoved!,
      createdDatetime!,
      createdByPersonId!,
      updateDatetime!,
      updatedByPersonId!,
      messageGalleryName!,
      messageGalleryMediaLink!,
      messageGalleryMediaType!,
    ];
  }

  @override
  bool get stringify => true;
}
