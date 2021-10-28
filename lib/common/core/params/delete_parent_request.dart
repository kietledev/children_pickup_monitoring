class DeleteParentRequest {
  final int roleId;
  final int parentID;
  Map<String, dynamic> body;
  DeleteParentRequest({
    required this.body,
    required this.roleId,
    required this.parentID,
  });
}
