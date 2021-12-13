// ignore_for_file: file_names

import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';

abstract class GetAllMessagesRepository {
  // API methods
  Future<DataState<List<Message>>> getAllMessages(GetAllMessagesRequest params);
}
