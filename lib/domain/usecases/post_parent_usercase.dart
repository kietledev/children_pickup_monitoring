import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostParentUseCase implements UseCase<DataState<String>, PostParentRequest> {
  final ParentsRepository _parentsRepository;
  PostParentUseCase(this._parentsRepository);

  @override
  Future<DataState<String>> call({PostParentRequest? params}) {
    return _parentsRepository.postParent(params!);
  }
}
