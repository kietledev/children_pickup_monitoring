import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_teachers_api_services.g.dart';

@RestApi(baseUrl: UrlConstatns.apiPostTeachersByClassId)
abstract class PostTeachersApiService {
  factory PostTeachersApiService(Dio dio, {String baseUrl}) =
      _PostTeachersApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>> postTeachers({
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
