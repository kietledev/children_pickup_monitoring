import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'get_all_conversations_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiGetAllConversations)
abstract class GetAllConversationsApiService {
  factory GetAllConversationsApiService(Dio dio, {String baseUrl}) =
      _GetAllConversationsApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>> postConversations({
    @Queries() Map<String, dynamic>? query,
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
