import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_teacher_send_notification.g.dart';

@RestApi(baseUrl: UrlConstatns.apiPostTeacherSendNotification)
abstract class PostTeacherSendNotificationApiService {
  factory PostTeacherSendNotificationApiService(Dio dio, {String baseUrl}) =
  _PostTeacherSendNotificationApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>> postTeacherSendNotification({
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
