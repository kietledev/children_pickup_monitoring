class GetAllMessagesRequest {
  final int personId;
  final int groupId;
  final int page;
  final int pageSize;

  GetAllMessagesRequest({
    this.personId = 0,
    this.groupId = 0,
    this.page = 1,
    this.pageSize = 20,
  });
}
