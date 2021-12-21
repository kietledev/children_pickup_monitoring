
import 'dart:io';
import 'package:children_pickup_monitoring/data/datasources/remote/get_list_class_rooms.dart';
import 'package:children_pickup_monitoring/data/models/class_room_model.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/repositories/list_class_by_teacher_repository.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class ClassRoomsRepositoryImpl implements ClassRoomsRepository {
  final GetListClassRoomsApiService _getListClassRoomsApiService;
  const ClassRoomsRepositoryImpl(this._getListClassRoomsApiService);

  @override
  Future<DataState<List<ClassRoomModel>>> getListClassRoom(GetListClassRoomsRequest params) async {
    try {
      final Map<String, dynamic> query = <String, dynamic>{
        'page': params.page,
        'pageSize': params.pageSize,
      };

      final httpResponse = await _getListClassRoomsApiService.getListClassRooms(
          query: query, k: key, dm: dm, tk: getTokenApi(id: ""), ttl: ttl);
      print(httpResponse.response.data);
      print(httpResponse.response.statusCode);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<ClassRoomModel> listClassRoom = [];
        for (final dynamic item in httpResponse.data.data) {
          if (item is! Map<String, dynamic>) continue;
          final classRoom = ClassRoomModel.fromJson(item);
          listClassRoom.add(classRoom);
        }
        return DataSuccess(listClassRoom);
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
