class ChangePasswordModel {
  String? content;


  ChangePasswordModel({
    this.content,
  });
  factory ChangePasswordModel.fromJson(Map<String, dynamic> jsonMap) {
    return ChangePasswordModel(
      content: jsonMap['content'] as String? ?? null,
    );
  }
}
