import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_message_to_group_by_groupId.g.dart';

@RestApi(baseUrl: UrlConstatns.apiPostMessageToGroupByGroupId)
abstract class PostMessageToGroupByGroupIdApiService {
  factory PostMessageToGroupByGroupIdApiService(Dio dio, {String baseUrl}) = _PostMessageToGroupByGroupIdApiService;

  @POST('/')
  Future<HttpResponse<ResponseModel>> postMessageToGroupByGroupId({
    @Body() Map<String, dynamic>? body,
    @Header('k') String? k,
    @Header('dm') String? dm,
    @Header('tk') String? tk,
    @Header('ttl') int? ttl,
  });
}
