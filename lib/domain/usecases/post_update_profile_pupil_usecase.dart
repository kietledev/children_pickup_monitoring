

import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/params/post_update_profile_pupil_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostUpdateProfilePupilUseCase implements UseCase<DataState<List<Pupil>>, PostUpdateProfilePupilRequest> {
  final PupilsRepository _pupilsRepository;
  PostUpdateProfilePupilUseCase(this._pupilsRepository);

  @override
  Future<DataState<List<Pupil>>> call({PostUpdateProfilePupilRequest? params}) {
    return _pupilsRepository.postUpdateProfilePupil(params!);
  }
}
