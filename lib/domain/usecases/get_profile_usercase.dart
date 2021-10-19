import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class GetProfileUseCase implements UseCase<DataState<Person>, ProfileRequest> {
  final ProfileRepository _profileRepository;

  GetProfileUseCase(this._profileRepository);

  @override
  Future<DataState<Person>> call({ProfileRequest? params}) {
    return _profileRepository.getprofileUser(params!);
  }
}
