import 'dart:io';

import 'package:children_pickup_monitoring/data/datasources/remote/get_all_conversations_api_service.dart';
import 'package:children_pickup_monitoring/data/models/conversation_model.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class ConversationsRepositoryImpl implements GetAllConversationsRepository {
  final GetAllConversationsApiService _apiService;

  const ConversationsRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<Conversation>>> getAllConversations(
      GetAllConversationsRequest params) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'page': params.page,
        'pageSize': params.pageSize,
      };
      final Map<String, dynamic> body = <String, dynamic>{
        'personId': params.personId,
      };
      final httpResponse = await _apiService.postConversations(
          query: query,
          body: body,
          k: key,
          dm: dm,
          tk: getTokenApi(),
          ttl: ttl);
      if (httpResponse.response.data['errorCode'] == 0 &&
          httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        final List<Conversation> conversations = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final conversation = ConversationModel.fromJson(item);
          conversations.add(conversation);
        }
        return DataSuccess(conversations);
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
