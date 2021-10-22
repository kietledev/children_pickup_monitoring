import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_profile_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiUpdateProfile)
abstract class PostProfileApiService {
  factory PostProfileApiService(Dio dio, {String baseUrl}) = _PostProfileApiService;

  @PUT('/')
  Future<HttpResponse<ResponseModel>> postProfile({
    @Queries() Map<String, dynamic>? query,
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
