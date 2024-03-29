import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';

abstract class MenusRepository {
  Future<DataState<List<FoodMenu>>> postMenus(PostMenusRequest params);
}
