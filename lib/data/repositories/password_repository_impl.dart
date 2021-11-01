

import 'dart:io';
import 'package:children_pickup_monitoring/data/models/change_password_model.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  final PostPasswordApiService _postPasswordApiService;
  const PasswordRepositoryImpl(this._postPasswordApiService);

  @override
  Future<DataState<String>> postPassword(PostPasswordRequest params) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'userId': params.userId,
        'roleId': params.roleId,
      };
      final httpResponse = await _postPasswordApiService.postPassword(
          query: query,body: params.body, k: key, dm: dm, tk: getTokenApi(id:params.userId.toString()), ttl: ttl);
      print(httpResponse.response.data);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<ChangePasswordModel> data = <ChangePasswordModel>[];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final msg = ChangePasswordModel.fromJson(item);
          data.add(msg);
        }
        return DataSuccess(data[0].content!);
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
