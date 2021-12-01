
import 'dart:io';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/delete_pickup_destroyed_request.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';



class PickUpCardRepositoryImpl implements PickUpRepository {
  final PostPickUpCardApiService _postPickUpCardApiService;
  final DeletePickupDestroyedApiService _deletePickupDestroyedApiService;
  const PickUpCardRepositoryImpl(this._postPickUpCardApiService, this._deletePickupDestroyedApiService);

  @override
  Future<DataState<PickUpRequestModel>> postPickUp(PostPickUpRequest params)  async {
    try {
      print("params.body== >  "+params.body.toString());
      final httpResponse = await _postPickUpCardApiService.PostPickUpCard(
          body: params.body,
          k: key,
          dm: dm,
          tk: getTokenApi(id: ""),
          ttl: ttl);

      print(httpResponse.response);
      if (httpResponse.response.statusCode == HttpStatus.ok &&
    httpResponse.data.data.toString().isNotEmpty) {
        // for (final dynamic item in httpResponse.data.data) {
        PickUpRequestModel pickUpResponse = new  PickUpRequestModel();
        pickUpResponse = PickUpRequestModel.fromJson(httpResponse.data.data[0] );
        return DataSuccess(pickUpResponse);
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
  Future<DataState<PickUpRequestModel>> deletePickupCard(DeletePickupDestroyedRequest params) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'roleId': params.roleId,
        'requestId':params.requestId,
      };
      print('---${query}');
      final httpResponse = await _deletePickupDestroyedApiService.deletePickupCard(
          query: query,body: params.body, k: key, dm: dm, tk: getTokenApi(id: params.requestId.toString()), ttl: ttl);
      print('---${httpResponse}');
      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        PickUpRequestModel pickUpResponse = new  PickUpRequestModel();
        pickUpResponse = PickUpRequestModel.fromJson(httpResponse.data.data );
        return DataSuccess(pickUpResponse);
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
