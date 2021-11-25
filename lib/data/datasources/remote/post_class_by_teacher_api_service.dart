import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_class_by_teacher_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiPostListClassByTeacherId)
abstract class PostListClassByTeacherApiService {
  factory PostListClassByTeacherApiService(Dio dio, {String baseUrl}) =_PostListClassByTeacherApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>> postListClassByTeacher({
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
