import 'dart:io';

import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/Message_model.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class MessagesRepositoryImpl implements GetAllMessagesRepository {
  final GetMessagesApiService _apiService;

  const MessagesRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<Message>>> getAllMessages(
      GetAllMessagesRequest params) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'page': params.page,
        'pageSize': params.pageSize,
      };
      final Map<String, dynamic> body = <String, dynamic>{
        'personId': params.personId,
        "groupId": params.groupId,
      };
      final httpResponse = await _apiService.postMessages(
          query: query,
          body: body,
          k: key,
          dm: dm,
          tk: getTokenApi(),
          ttl: ttl);
      if (httpResponse.response.data['errorCode'] == 0 &&
          httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        print(httpResponse.data.data);
        final List<Message> messages = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final message = MessageModel.fromJson(item);
          messages.add(message);
        }
        return DataSuccess(messages);
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
