import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_parent_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiPostParent)
abstract class PostParentApiService {
  factory PostParentApiService(Dio dio, {String baseUrl}) = _PostParentApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>> postParent({
    @Queries() Map<String, dynamic>? query,
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}