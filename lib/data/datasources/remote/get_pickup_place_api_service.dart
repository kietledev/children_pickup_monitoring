import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'get_pickup_place_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiGetListPickupPlace)
abstract class GetPickupPlacesApiService {
  factory GetPickupPlacesApiService(Dio dio, {String baseUrl}) = _GetPickupPlacesApiService;
  @GET('/')
  Future<HttpResponse<ResponseModel>> getPickupPlaces({
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
