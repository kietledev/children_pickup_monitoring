class GetAllConversationsRequest {
  final int personId;
  final int page;
  final int pageSize;

  GetAllConversationsRequest({
    this.personId = 0,
    this.page = 1,
    this.pageSize = 20,
  });
}
