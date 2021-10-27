import 'dart:io';

import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class MenusRepositoryImpl implements MenusRepository {
  final PostMenusApiService _postMenusApiService;

  const MenusRepositoryImpl(this._postMenusApiService);

  @override
  Future<DataState<List<FoodMenu>>> postMenus(PostMenusRequest params) async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        "FROM_DATE": params.fromDate,
        "THRU_DATE": params.thruDate,
        'classTypeId': params.classTypeId,
      };
      final httpResponse = await _postMenusApiService.postMenus(
          body: body,
          k: key,
          dm: dm,
          tk: getTokenApi(id: params.classTypeId.toString()),
          ttl: ttl);
      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.data.toString().isNotEmpty) {
        final List<FoodMenuModel> listFoodMenu = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final foodMenu = FoodMenuModel.fromJson(item);
          listFoodMenu.add(foodMenu);
        }
        return DataSuccess(listFoodMenu);
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
