import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'delete_pickup_destroyed_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiPutPickUpCards)
abstract class DeletePickupDestroyedApiService {
  factory DeletePickupDestroyedApiService(Dio dio, {String baseUrl}) = _DeletePickupDestroyedApiService;

  @PUT('/')
  Future<HttpResponse<ResponseModel>> deletePickupCard({
    @Queries() Map<String, dynamic>? query,
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}