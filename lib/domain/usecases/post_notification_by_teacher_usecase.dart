import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostNotificationByTeacherUseCase implements UseCase<DataState<String>, PostNotificationByTeacherRequest> {
  final NotificationRepository _notificationRepository;
  PostNotificationByTeacherUseCase(this._notificationRepository);

  @override
  Future<DataState<String>> call({PostNotificationByTeacherRequest? params}) {
    return _notificationRepository.postNotificationByTeacher(params!);
  }
}
