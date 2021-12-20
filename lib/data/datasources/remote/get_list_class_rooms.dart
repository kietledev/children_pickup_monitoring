import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'get_list_class_rooms.g.dart';

@RestApi(baseUrl: UrlConstatns.apiGetListClassRooms)
abstract class GetListClassRoomsApiService {
  factory GetListClassRoomsApiService(Dio dio, {String baseUrl}) = _GetListClassRoomsApiService;

  @GET('/')
  Future<HttpResponse<ResponseModel>> getListClassRooms({
    @Queries() Map<String, dynamic>? query,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
