import 'dart:io';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final LoginApiService _loginApiService;
  // final AppDatabase _appDatabase;

  const UserRepositoryImpl(this._loginApiService);

  @override
  Future<DataState<User>> postLogin(LoginRequest params) async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        'username': params.username,
        'password': getBytes(params.password),
      };
      final httpResponse = await _loginApiService.postLogin(
          params: body, k: key, dm: dm, tk: getTokenApi(), ttl: ttl);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final person = UserModel.fromJson(httpResponse.data.data);
        return DataSuccess(person);
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
  Future<User> getSaveUser() {
    // TODO: implement getSaveUser
    throw UnimplementedError();
  }

  @override
  Future<void> removeArticle(User user) {
    // TODO: implement removeArticle
    throw UnimplementedError();
  }

  @override
  Future<void> saveArticle(User user) {
    // TODO: implement saveArticle
    throw UnimplementedError();
  }
}
