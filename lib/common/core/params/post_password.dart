class PostPasswordRequest {
  final int userId;
  final int roleId;
  Map<String, dynamic> body;
  PostPasswordRequest({
    required this.userId,
    required this.body,
    required this.roleId,
  });
}
