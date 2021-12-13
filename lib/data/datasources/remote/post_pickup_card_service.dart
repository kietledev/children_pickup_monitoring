import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_pickup_card_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiPostPickUpCard)
abstract class PostPickUpCardApiService {
  factory PostPickUpCardApiService(Dio dio, {String baseUrl}) = _PostPickUpCardApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>>PostPickUpCard({
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
