import 'dart:io';

import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class AchievementsRepositoryImpl implements AchievementsRepository {
  final PostAchievementsApiService _achievementsApiService;

  const AchievementsRepositoryImpl(this._achievementsApiService);

  @override
  Future<DataState<List<Achievement>>> postAchievements(PostAchievementsRequest params)async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        'pupilId': params.pupilId,
      };
      final httpResponse = await _achievementsApiService.postAchievements(
          body: body,
          k: key,
          dm: dm,
          tk: getTokenApi(id: params.pupilId.toString()),
          ttl: ttl);
      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        final List<Achievement> pupils = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final pupil = AchievementModel.fromJson(item);
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
