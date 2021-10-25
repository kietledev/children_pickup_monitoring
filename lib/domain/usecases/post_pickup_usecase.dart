import 'package:children_pickup_monitoring/common/core/params/post_pickup_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/data_state.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/entities/pickup_request.dart';
import 'package:children_pickup_monitoring/domain/repositories/pickup_reponsitory.dart';

class PostPickUpUseCase implements UseCase<DataState<PickUpRequest>, PostPickUpRequest> {
final PickUpRepository _pickUpRepository;

PostPickUpUseCase(this._pickUpRepository);

  @override
  Future<DataState<PickUpRequest>> call({PostPickUpRequest? params}) {
   return _pickUpRepository.postPickUp(params!);
  }
}