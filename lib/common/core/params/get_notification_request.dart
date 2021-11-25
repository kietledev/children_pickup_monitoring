class GetNotificationRequest {
  final int page;
  final int pageSize;
  final int personId;

  GetNotificationRequest({
    this.page = -1,
    this.pageSize = -1,
    this.personId = -1
  });
}