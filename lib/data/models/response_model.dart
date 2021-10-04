class ResponseModel {
  int errorCode;
  String? message;
  String? messageEn;
  dynamic data;

  ResponseModel({
    required this.errorCode,
    this.message,
    this.messageEn,
    this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> jsonMap) {
    return ResponseModel(
        errorCode: jsonMap['errorCode'] as int? ?? -1,
        message: jsonMap['message'] as String? ?? '',
        messageEn: jsonMap['messageEn'] as String? ?? '',
        data: jsonMap["data"]);
  }
}
