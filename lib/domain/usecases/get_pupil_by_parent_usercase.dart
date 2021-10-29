import 'package:children_pickup_monitoring/common/core/params/get_parents_request.dart';
import 'package:children_pickup_monitoring/common/core/params/get_pupil_by_parent_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/repositories/parents_repository.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/repositories/pupil_by_parent_repository.dart';
class GetPupilByParentUseCase implements UseCase<DataState<List<PupilModel>>, PupilByParentRequest> {
  final PupilByParentRepository _pupilByParentRepository;

  GetPupilByParentUseCase(this._pupilByParentRepository);

  @override
  Future<DataState<List<PupilModel>>> call({PupilByParentRequest? params}) {
    return _pupilByParentRepository.getPupils(params!);
  }
}

