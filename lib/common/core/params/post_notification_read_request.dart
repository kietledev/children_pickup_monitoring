class PostNotificationReadRequest {
  final int page;
  final int pageSize;
  final int personId;
  final int annoucementId;

  PostNotificationReadRequest({
    this.personId = -1,
    this.annoucementId = -1,
    this.page = -1,
    this.pageSize = -1,
  });
}
