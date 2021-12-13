import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';

part 'get_messages_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.getAllMessageInGroupByGroupId)
abstract class GetMessagesApiService {
  factory GetMessagesApiService(Dio dio, {String baseUrl}) =
      _GetMessagesApiService;
  @POST('/')
  Future<HttpResponse<ResponseModel>> postMessages({
    @Queries() Map<String, dynamic>? query,
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
