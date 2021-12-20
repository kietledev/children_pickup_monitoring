import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/data/models/class_room_model.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';

import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class GetListClassRoomUseCase implements UseCase<DataState<List<ClassRoomModel>>, GetListClassRoomsRequest> {
  final ClassRoomsRepository _classRoomsRepository;

  GetListClassRoomUseCase(this._classRoomsRepository);

  @override
  Future<DataState<List<ClassRoomModel>>> call({GetListClassRoomsRequest? params}) {
    return _classRoomsRepository.getListClassRoom(params!);
  }
}
