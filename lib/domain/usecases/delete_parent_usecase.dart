import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class DeleteParentUseCase implements UseCase<DataState<String>, DeleteParentRequest> {
  final ParentsRepository _parentsRepository;
  DeleteParentUseCase(this._parentsRepository);

  @override
  Future<DataState<String>> call({DeleteParentRequest? params}) {
    return _parentsRepository.deleteParent(params!);
  }
}
