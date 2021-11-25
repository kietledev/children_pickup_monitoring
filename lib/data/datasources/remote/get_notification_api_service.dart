import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'get_notification_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiGetListNotification)
abstract class GetListNotificationApiService {
  factory GetListNotificationApiService(Dio dio, {String baseUrl}) = _GetListNotificationApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>> getListNotification({
    @Queries() Map<String, dynamic>? query,
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}