import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'get_relationship_type_api_services.g.dart';

@RestApi(baseUrl: UrlConstatns.apiGetListRelationshipType)
abstract class GetRelationshipTypeApiService {
  factory GetRelationshipTypeApiService(Dio dio, {String baseUrl}) = _GetRelationshipTypeApiService;

  @GET('/')
  Future<HttpResponse<ResponseModel>> getRelationshipType({
    @Queries() Map<String, dynamic>? query,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}