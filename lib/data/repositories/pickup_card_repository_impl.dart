
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
      final Map<String, dynamic> body = <String, dynamic>{

      };
      final httpResponse = await _postPickUpCardApiService.PostPickUpCard(
          body: body,
          k: key,
          dm: dm,
          tk: getTokenApi(id: ""),
          ttl: ttl);

      print(httpResponse.response.data);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<PickUpRequestModel> pickUpResponses = <PickUpRequestModel>[];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final pickUpResponse = PickUpRequestModel.fromJson(item);
          pickUpResponses.add(pickUpResponse);
        }

        return DataSuccess(pickUpResponses[0]);
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
