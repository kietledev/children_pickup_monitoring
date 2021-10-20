import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_menus_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiPostMenusByClassTypeId)
abstract class PostMenusApiService {
  factory PostMenusApiService(Dio dio, {String baseUrl}) = _PostMenusApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>> postMenus({
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
