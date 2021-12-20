import 'package:children_pickup_monitoring/common/core/params/get_all_conversations_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class MessagePageUseCase
    implements UseCase<DataState<List<Conversation>>, GetAllConversationsRequest> {
  final GetAllConversationsRepository _repository;

  MessagePageUseCase(this._repository);

  @override
  Future<DataState<List<Conversation>>> call({GetAllConversationsRequest? params}) {
    return _repository.getAllConversations(params!);
  }
}
