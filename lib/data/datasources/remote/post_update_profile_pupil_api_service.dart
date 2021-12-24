// post_update_profile_pupil_api_service

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_update_profile_pupil_api_service.g.dart';

@RestApi(baseUrl: UrlConstatns.apiUpdateProfilePupil)
abstract class PostUpdateProfilePupilApiService {
  factory PostUpdateProfilePupilApiService(Dio dio, {String baseUrl}) = _PostUpdateProfilePupilApiService;

  @PUT('/')
  Future<HttpResponse<ResponseModel>> postUpdatePupil({
    @Queries() Map<String, dynamic>? query,
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
