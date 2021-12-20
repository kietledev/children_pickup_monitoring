import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';

abstract class GetAllConversationsRepository {
  // API methods
  Future<DataState<List<Conversation>>> getAllConversations(
      GetAllConversationsRequest params);
}
