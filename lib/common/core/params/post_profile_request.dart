class PostProfileRequest {
  final int personId;
  final int roleId;
  Map<String, dynamic> body;
  PostProfileRequest({
    required this.personId,
    required this.body,
    required this.roleId,
  });
}
