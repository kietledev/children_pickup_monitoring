class PostUpdateProfilePupilRequest {
  final int pupilId;
  final int roleId;
  Map<String, dynamic> body;
  PostUpdateProfilePupilRequest({
    required this.pupilId,
    required this.body,
    required this.roleId,
  });
}
