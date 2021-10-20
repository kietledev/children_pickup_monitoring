import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostPupilsUseCase
    implements UseCase<DataState<List<Pupil>>, PostPupilsRequest> {
  final PupilsRepository _pupilsRepository;

  PostPupilsUseCase(this._pupilsRepository);

  @override
  Future<DataState<List<Pupil>>> call({PostPupilsRequest? params}) {
    return _pupilsRepository.postPupil(params!);
  }
}
