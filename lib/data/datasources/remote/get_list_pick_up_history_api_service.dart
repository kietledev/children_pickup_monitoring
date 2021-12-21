import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'get_list_pick_up_history_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiGetListPickUpHistory)
abstract class GetListPickUpHistoryApiService {
  factory GetListPickUpHistoryApiService(Dio dio, {String baseUrl}) = _GetListPickUpHistoryApiService;

  @GET('/')
  Future<HttpResponse<ResponseModel>> getListPickUpHistory({
    @Queries() Map<String, dynamic>? query,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
