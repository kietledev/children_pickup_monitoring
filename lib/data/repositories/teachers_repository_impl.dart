import 'dart:io';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/resources/data_state.dart';
import 'package:children_pickup_monitoring/common/core/params/post_teachers_request.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/teacher.dart';
import 'package:children_pickup_monitoring/domain/repositories/teachers_repository.dart';

class TeachersRepositoryImpl implements TeachersRepository {
  final PostTeachersApiService _postTeachersApiService;

  const TeachersRepositoryImpl(this._postTeachersApiService);

  @override
  Future<DataState<List<Teacher>>> postTeacher(
      PostTeachersRequest params) async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        'classId': params.classId,
      };
      final httpResponse = await _postTeachersApiService.postTeachers(
          body: body,
          k: key,
          dm: dm,
          tk: getTokenApi(id: params.classId.toString()),
          ttl: ttl);
      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        final List<Teacher> teachers = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final teacher = TeacherModel.fromJson(item);
          teachers.add(teacher);
        }
        return DataSuccess(teachers);
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
