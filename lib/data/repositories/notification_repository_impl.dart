

import 'dart:io';
import 'package:children_pickup_monitoring/common/core/params/post_notification_read_request.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/post_notification_read_api_service.dart';
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
  final PostTeacherSendNotificationApiService _postTeacherSendNotificationApiService;
  final PostNotificationReadApiService _postNotificationReadApiService;
  const NotificationRepositoryImpl(this._getListNotificationApiService,this._postTeacherSendNotificationApiService,this._postNotificationReadApiService);

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

  @override
  Future<DataState<String>> postNotificationByTeacher(PostNotificationByTeacherRequest params) async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        "personId": params.personId,
        "teacherId": params.teacherId,
        "listClassId": params.listClassId,
        "titleAnnoucement": params.titleAnnoucement,
        "contentAnnoucement": params.contentAnnoucement
      };
    print(body);
      final httpResponse = await _postTeacherSendNotificationApiService.postTeacherSendNotification(
          body: body, k: key, dm: dm, tk: getTokenApi(id: ""), ttl: ttl);
      print(httpResponse.response.statusCode);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess("Success");
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

  @override
  Future<DataState<NotificationModel>> postNotificationRead(PostNotificationReadRequest params) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'page': params.page,
        'pageSize': params.pageSize,
      };
      final Map<String, dynamic> body = <String, dynamic>{
        "personId": params.personId,
        "annoucementId": params.annoucementId,
      };
      print(body);
      final httpResponse = await _postNotificationReadApiService.postNotificationRead(
          query: query,body: body, k: key, dm: dm, tk: getTokenApi(id: ""), ttl: ttl);
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
