
import 'dart:io';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/get_users_by_person.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';

class UsersByPersonRepositoryImpl implements UsersByPersonRepository {
  final GetUsersByPersonApiService _getUsersByPersonApiService;

  const UsersByPersonRepositoryImpl(this._getUsersByPersonApiService);
  @override
  Future<DataState<List<UserByPersonModel>>> getUsersByPerson(
      GetUsersByPersonRequest request) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'page': request.page,
        'pageSize': request.pageSize,
      };

      final httpResponse = await _getUsersByPersonApiService.getUsersByPerson(
          query: query, k: key, dm: dm, tk: getTokenApi(id: ""), ttl: ttl);
      print(httpResponse.response.data);
      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        final List<UserByPersonModel> users = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final user = UserByPersonModel.fromJson(item);
          users.add(user);
        }
        return DataSuccess(users);
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
