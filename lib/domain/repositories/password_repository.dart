import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';

abstract class PasswordRepository {
  // API methods
  Future<DataState<String>> postPassword(PostPasswordRequest query);
}