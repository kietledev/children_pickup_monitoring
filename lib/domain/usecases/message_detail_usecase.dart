import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class MessageDetailUseCase
    implements UseCase<DataState<List<Message>>, GetAllMessagesRequest> {
  final GetAllMessagesRepository _repository;

  MessageDetailUseCase(this._repository);

  @override
  Future<DataState<List<Message>>> call({GetAllMessagesRequest? params}) {
    return _repository.getAllMessages(params!);
  }
}
