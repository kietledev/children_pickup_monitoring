import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/params/send_message_to_group_by_group_id.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class MessageSendUseCase implements UseCase<DataState<String>, SendMessageToGroupByGroupId> {
  final GetAllMessagesRepository _getAllMessagesRepository;

  MessageSendUseCase(this._getAllMessagesRepository);

  @override
  Future<DataState<String>> call({SendMessageToGroupByGroupId? params}) {
    return _getAllMessagesRepository.postMessageToGroupByGroupId(params!);
  }
}
