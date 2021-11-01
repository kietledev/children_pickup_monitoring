
import 'dart:io';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/get_relationship_type_request.dart';
import 'package:children_pickup_monitoring/common/core/params/get_users_by_person.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';

import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';

class RelationshipTypeRepositoryImpl implements RelationshipTypeRepository {
  final GetRelationshipTypeApiService _getRelationshipTypeApiService;

  const RelationshipTypeRepositoryImpl(this._getRelationshipTypeApiService);
  @override
  Future<DataState<List<RelationshipTypeModel>>> getRelationshipType(GetRelationshipTypeRequest request) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{};

      final httpResponse = await _getRelationshipTypeApiService.getRelationshipType(
          query: query, k: key, dm: dm, tk: getTokenApi(id: ""), ttl: ttl);
      print(httpResponse.response.data);
      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        final List<RelationshipTypeModel> relationships = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final relationship = RelationshipTypeModel.fromJson(item);
          relationships.add(relationship);
        }
        return DataSuccess(relationships);
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
