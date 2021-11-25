
import 'dart:io';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/repositories/list_class_by_teacher_repository.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class ClassByTeacherRepositoryImpl implements ClassByTeacherRepository {
  final PostListClassByTeacherApiService _postListClassByTeacherApiService;
  const ClassByTeacherRepositoryImpl(this._postListClassByTeacherApiService);

  @override
  Future<DataState<List<ClassByTeacherModel>>> postListClassByTeacher(PostClassByTeacherRequest params) async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        'personId': params.personId,
      };

      final httpResponse = await _postListClassByTeacherApiService.postListClassByTeacher(
      body: body, k: key, dm: dm, tk: getTokenApi(id: ""), ttl: ttl);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<ClassByTeacherModel> listClassByTeacher = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final classRoom = ClassByTeacherModel.fromJson(item);
          listClassByTeacher.add(classRoom);
        }
        return DataSuccess(listClassByTeacher);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

}
