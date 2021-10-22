import 'package:children_pickup_monitoring/common/core/params/post_pickup_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/data_state.dart';
import 'package:children_pickup_monitoring/domain/entities/pickup_request.dart';

abstract class PickUpRepository {
  Future<DataState<PickUpRequest>> postPickUp(PostPickUpRequest params);
}
