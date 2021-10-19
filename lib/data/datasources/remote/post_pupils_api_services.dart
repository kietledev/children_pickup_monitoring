import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_pupils_api_services.g.dart';

@RestApi(baseUrl: UrlConstatns.apiPostPupilsByClassId)
abstract class PostPupilsApiService {
  factory PostPupilsApiService(Dio dio, {String baseUrl}) =
      _PostPupilsApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>> postPupils({
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
