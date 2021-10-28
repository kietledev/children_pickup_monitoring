
import 'dart:io';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/post_profile_api_service.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/profile_api_service.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';

import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApiService _profileApiService;
   final PostProfileApiService _postProfileApiService;

  const ProfileRepositoryImpl(this._profileApiService,this._postProfileApiService);

  @override
  Future<DataState<PersonModel>> getprofileUser(ProfileRequest query) async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        'personId': query.personId,
      };
      final httpResponse = await _profileApiService.getProfile(
          query: body, k: key, dm: dm, tk: getTokenApi(id: "2"), ttl: ttl);
     //  print(httpResponse.response.data);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<PersonModel> listProfile = <PersonModel>[];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final person = PersonModel.fromJson(item);
          listProfile.add(person);
        }

        return DataSuccess(listProfile[0]);
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
  Future<DataState<PersonModel>> postProfileUser(PostProfileRequest params) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'personId': params.personId,
        'roleId': params.roleId,
      };
      final httpResponse = await _postProfileApiService.postProfile(
          query: query,body: params.body, k: key, dm: dm, tk: getTokenApi(id: "2"), ttl: ttl);
        print(httpResponse.response.data);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<PersonModel> listProfile = <PersonModel>[];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final person = PersonModel.fromJson(item);
          listProfile.add(person);
        }

        return DataSuccess(listProfile[0]);
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
