class SendMessageToGroupByGroupId {
  final int personId;
  final int groupId;
  final int messageType;
  final int messageMediaType;
  final String textContent;
  final String textContentEn;
  final int galleryId;
  final String link;
  final String createdDate;
  SendMessageToGroupByGroupId({
    required this.personId,
    required this.groupId,
    required this.messageType,
    required this.messageMediaType,
    required this.textContent,
    required this.textContentEn,
    required this.galleryId,
    required this.link,
    required this.createdDate,
  });
}
