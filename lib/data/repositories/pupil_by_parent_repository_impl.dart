
import 'dart:io';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';

class PupilByParentRepositoryImpl implements PupilByParentRepository {
  final GetPupilByParentApiService _getPupilByParentApiService;
  const PupilByParentRepositoryImpl(this._getPupilByParentApiService);

  @override
  Future<DataState<List<PupilModel>>> getPupils(PupilByParentRequest pupilByParentRequest) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'parentId': pupilByParentRequest.parentId,
      };
      final httpResponse = await _getPupilByParentApiService.getPupils(
          query: query, k: key, dm: dm, tk: getTokenApi(id: pupilByParentRequest.parentId.toString()), ttl: ttl);
      print(httpResponse.response.data);
      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        final List<PupilModel> pupils = [];
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
