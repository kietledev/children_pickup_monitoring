
import 'dart:io';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';



class PickUpCardRepositoryImpl implements PickUpRepository {
  final PostPickUpCardApiService _postPickUpCardApiService;

  const PickUpCardRepositoryImpl(this._postPickUpCardApiService);

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
