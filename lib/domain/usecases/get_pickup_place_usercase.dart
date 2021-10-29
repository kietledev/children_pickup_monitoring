import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/params/get_users_by_person.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
class GetPickUpPlaceUseCase implements UseCase<DataState<List<PickUpPlaceModel>>, GetPickUpPlasesRequest> {
  final PickUpPlacesRepository _pickUpPlacesRepository;
  GetPickUpPlaceUseCase(this._pickUpPlacesRepository);

  @override
  Future<DataState<List<PickUpPlaceModel>>> call({GetPickUpPlasesRequest? params}) {
    return _pickUpPlacesRepository.getPickUpPlaces(params!);
  }
}
