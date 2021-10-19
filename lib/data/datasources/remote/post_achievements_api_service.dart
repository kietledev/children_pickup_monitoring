import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_achievements_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiPostAchievements)
abstract class PostAchievementsApiService {
  factory PostAchievementsApiService(Dio dio, {String baseUrl}) =
      _PostAchievementsApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>> postAchievements({
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
