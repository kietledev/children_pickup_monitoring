
import 'dart:io';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/get_parents_request.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/post_profile_api_service.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/profile_api_service.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/data/models/parent_model.dart';

import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/entities/parent.dart';
import 'package:children_pickup_monitoring/domain/repositories/parents_repository.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';

class ParentRepositoryImpl implements ParentsRepository {
  final GetParentsApiService _getParentsApiService;
  final PostParentApiService _postParentApiService;
  const ParentRepositoryImpl(this._getParentsApiService,this._postParentApiService);
  @override
  Future<DataState<List<ParentModel>>> getParents(
      ParentsRequest parentsRequest) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'pupilId': parentsRequest.pupilId,
        'relationshipTypeId': parentsRequest.relationshipTypeId,
      };

      final httpResponse = await _getParentsApiService.getParents(
          query: query, k: key, dm: dm, tk: getTokenApi(id: parentsRequest.pupilId.toString()), ttl: ttl);
      print(httpResponse.response.data);
      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        final List<ParentModel> parents = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final parent = ParentModel.fromJson(item);
          parents.add(parent);
        }
        return DataSuccess(parents);
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
  Future<DataState<String>> postParent(PostParentRequest params) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'roleId': params.roleId,
      };

      final httpResponse = await _postParentApiService.postParent(
          query: query,body: params.body, k: key, dm: dm, tk: getTokenApi(id: ""), ttl: ttl);
      print('Nhuan---${httpResponse.response.data}');
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


}
