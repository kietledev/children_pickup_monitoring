import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class GetNotificationUseCase implements UseCase<DataState<NotificationModel>, GetNotificationRequest> {
  final NotificationRepository _notificationRepository;

  GetNotificationUseCase(this._notificationRepository);

  @override
  Future<DataState<NotificationModel>> call({GetNotificationRequest? params}) {
    return _notificationRepository.getListNotification(params!);
  }
}
