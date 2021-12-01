class PostNotificationByTeacherRequest {
  final int personId;
  final int teacherId;
  final List<int> listClassId;
  final String titleAnnoucement;
  final String contentAnnoucement;

  PostNotificationByTeacherRequest({
    this.personId = -1,
    this.teacherId =-1,
    required this.listClassId,
    this.titleAnnoucement = "",
    this.contentAnnoucement = ""
  });
}
