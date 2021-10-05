import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostLoginUseCase implements UseCase<DataState<User>, LoginRequest> {
  final UserRepository _userRepository;

  PostLoginUseCase(this._userRepository);

  @override
  Future<DataState<User>> call({LoginRequest? params}) {
    return _userRepository.postLogin(params!);
  }
}
