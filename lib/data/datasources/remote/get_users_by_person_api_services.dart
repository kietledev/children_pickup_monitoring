import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'get_users_by_person_api_services.g.dart';

@RestApi(baseUrl: UrlConstatns.apiGetListUserbyPerson)
abstract class GetUsersByPersonApiService {
  factory GetUsersByPersonApiService(Dio dio, {String baseUrl}) = _GetUsersByPersonApiService;

  @GET('/')
  Future<HttpResponse<ResponseModel>> getUsersByPerson({
    @Queries() Map<String, dynamic>? query,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}