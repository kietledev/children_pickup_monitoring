import 'package:children_pickup_monitoring/common/core/params/post_teachers_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostTeachersUseCase
    implements UseCase<DataState<List<Teacher>>, PostTeachersRequest> {
  final TeachersRepository _teachersRepository;

  PostTeachersUseCase(this._teachersRepository);

  @override
  Future<DataState<List<Teacher>>> call({PostTeachersRequest? params}) {
    return _teachersRepository.postTeacher(params!);
  }
}
