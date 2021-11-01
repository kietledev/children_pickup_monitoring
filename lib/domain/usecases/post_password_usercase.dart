import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostPasswordUseCase implements UseCase<DataState<String>, PostPasswordRequest> {
  final PasswordRepository _passwordRepository;
  PostPasswordUseCase(this._passwordRepository);

  @override
  Future<DataState<String>> call({PostPasswordRequest? params}) {
    return _passwordRepository.postPassword(params!);
  }
}
