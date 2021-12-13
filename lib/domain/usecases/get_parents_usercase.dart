import 'package:children_pickup_monitoring/common/core/params/get_parents_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/repositories/parents_repository.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
class GetParentsUseCase implements UseCase<DataState<List<ParentModel>>, ParentsRequest> {
  final ParentsRepository _parentsRepository;

  GetParentsUseCase(this._parentsRepository);

  @override
  Future<DataState<List<ParentModel>>> call({ParentsRequest? params}) {


    return _parentsRepository.getParents(params!);
  }
}
