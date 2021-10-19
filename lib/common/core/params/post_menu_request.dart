class PostMenusRequest {
  final int classTypeId;
  final String fromDate;
  final String thruDate;

  PostMenusRequest({
    required this.fromDate,
    required this.thruDate,
    required this.classTypeId,
  });
}
