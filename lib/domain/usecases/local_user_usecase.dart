import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class GetSavedUserUseCase implements UseCase<List<User>, void> {
  final UserRepository _userRepository;

  GetSavedUserUseCase(this._userRepository);

  @override
  Future<List<User>> call({void params}) {
    return _userRepository.getSavedUser();
  }
}

class SaveUserUseCase implements UseCase<void, User> {
  final UserRepository _userRepository;

  SaveUserUseCase(this._userRepository);

  @override
  Future<void> call({User? params}) {
    return _userRepository.saveUser(params!);
  }
}

class RemoveUserUseCase implements UseCase<void, User> {
  final UserRepository _userRepository;

  RemoveUserUseCase(this._userRepository);

  @override
  Future<void> call({User? params}) {
    return _userRepository.removeUser(params!);
  }
}

class UserParams {
  final User user;
  UserParams({required this.user});
}
