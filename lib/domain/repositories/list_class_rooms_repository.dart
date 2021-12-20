import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/class_room_model.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';

abstract class ClassRoomsRepository {
  // API methods
  Future<DataState<List<ClassRoomModel>>> getListClassRoom(GetListClassRoomsRequest query);
}