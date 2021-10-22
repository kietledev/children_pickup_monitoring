

import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostProfileUseCase implements UseCase<DataState<Person>, PostProfileRequest> {
  final ProfileRepository _profileRepository;
  PostProfileUseCase(this._profileRepository);

  @override
  Future<DataState<PersonModel>> call({PostProfileRequest? params}) {
    return _profileRepository.postProfileUser(params!);
  }
}
