import 'dart:io';

import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PupilsRepositoryImpl implements PupilsRepository {
  final PostPupilsApiService _postPupilsApiService;

  const PupilsRepositoryImpl(this._postPupilsApiService);

  @override
  Future<DataState<List<Pupil>>> postPupil(PostPupilsRequest params) async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        'classId': params.classId,
      };
      final httpResponse = await _postPupilsApiService.postPupils(
          body: body,
          k: key,
          dm: dm,
          tk: getTokenApi(id: params.classId.toString()),
          ttl: ttl);
      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        final List<Pupil> pupils = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final pupil = PupilModel.fromJson(item);
          pupils.add(pupil);
        }
        return DataSuccess(pupils);
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
