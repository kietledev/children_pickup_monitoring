import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'get_parents_api_services.g.dart';

@RestApi(baseUrl: UrlConstatns.apiGetListParentRelationshipByPupilId)
abstract class GetParentsApiService {
  factory GetParentsApiService(Dio dio, {String baseUrl}) = _GetParentsApiService;

  @GET('/')
  Future<HttpResponse<ResponseModel>> getParents({
    @Queries() Map<String, dynamic>? query,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
