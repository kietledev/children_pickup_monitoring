import 'dart:io';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/datasources/local/app_database.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class UserRepositoryImpl implements UserRepository {
  final LoginApiService _loginApiService;
  final AppDatabase _appDatabase;

  const UserRepositoryImpl(this._loginApiService, this._appDatabase);

  @override
  Future<DataState<User>> postLogin(LoginRequest params) async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        'username': params.username,
        'password': getBytes(params.password),
      };
      print(getBytes(params.password));

      final httpResponse = await _loginApiService.postLogin(
          body: body, k: key, dm: dm, tk: getTokenApi(), ttl: ttl);

      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
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
  Future<List<User>> getSavedUser() {
    return _appDatabase.appUserDao.getAllUsers();
  }

  @override
  Future<void> saveUser(User user) {
    return _appDatabase.appUserDao.insertUser(user);
  }

  @override
  Future<void> removeUser(User user) {
    return _appDatabase.appUserDao.deleteUser(user);
  }
}
