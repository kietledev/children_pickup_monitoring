import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'get_pupil_by_parent_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiGetPupilByParentId)
abstract class GetPupilByParentApiService {
  factory GetPupilByParentApiService(Dio dio, {String baseUrl}) = _GetPupilByParentApiService;

  @GET('/')
  Future<HttpResponse<ResponseModel>> getPupils({
    @Queries() Map<String, dynamic>? query,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
