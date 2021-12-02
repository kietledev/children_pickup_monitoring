import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/params/post_notification_read_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostNotificationReadUseCase implements UseCase<DataState<String>, PostNotificationReadRequest> {
  final NotificationRepository _notificationRepository;
  PostNotificationReadUseCase(this._notificationRepository);

  @override
  Future<DataState<String>> call({PostNotificationReadRequest? params}) {
    return _notificationRepository.postNotificationRead(params!);
  }
}
