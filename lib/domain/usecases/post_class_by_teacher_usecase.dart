import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/list_class_by_teacher_repository.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostClassByTeacherUseCase implements UseCase<DataState<List<ClassByTeacherModel>>, PostClassByTeacherRequest> {
  final ClassByTeacherRepository _classByTeacherRepository;

  PostClassByTeacherUseCase(this._classByTeacherRepository);

  @override
  Future<DataState<List<ClassByTeacherModel>>> call({PostClassByTeacherRequest? params}) {
    return _classByTeacherRepository.postListClassByTeacher(params!);
  }
}
