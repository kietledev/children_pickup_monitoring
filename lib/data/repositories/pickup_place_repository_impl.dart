import 'dart:io';

import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PickUpPlacesRepositoryImpl implements PickUpPlacesRepository {
  final GetPickupPlacesApiService _pickupPlacesApiService;

  const PickUpPlacesRepositoryImpl(this._pickupPlacesApiService);

  @override
  Future<DataState<List<PickUpPlaceModel>>> getPickUpPlaces(GetPickUpPlasesRequest request)async {
    try{
      final httpResponse = await _pickupPlacesApiService.getPickupPlaces(
          k: key,
          dm: dm,
          tk: getTokenApi(id:''),
          ttl: ttl);
      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        final List<PickUpPlaceModel> pickUpPlaces = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final pickUpPlace = PickUpPlaceModel.fromJson(item);
          pickUpPlaces.add(pickUpPlace);
        }
        print("hue=="+ pickUpPlaces.length.toString());
        return DataSuccess(pickUpPlaces);
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
