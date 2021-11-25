

import 'dart:io';
import 'package:children_pickup_monitoring/data/models/change_password_model.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final GetListNotificationApiService _getListNotificationApiService;
  const NotificationRepositoryImpl(this._getListNotificationApiService);

  @override
  Future<DataState<NotificationModel>> getListNotification(GetNotificationRequest params) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'page': params.page,
        'pageSize': params.pageSize,
      };
      final Map<String, dynamic> body = <String, dynamic>{
        'personId': params.personId,
      };

      final httpResponse = await _getListNotificationApiService.getListNotification(
          query: query,body: body, k: key, dm: dm, tk: getTokenApi(id: ""), ttl: ttl);
      print("Nhuan---${httpResponse.response.data}");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final notification = NotificationModel.fromJson(httpResponse.data.data);
        return DataSuccess(notification);
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
