import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_notification_read_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiPostNotificationRead)
abstract class PostNotificationReadApiService {
  factory PostNotificationReadApiService(Dio dio, {String baseUrl}) = _PostNotificationReadApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>> postNotificationRead({
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
