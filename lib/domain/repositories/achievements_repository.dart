import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';

abstract class AchievementsRepository {
  Future<DataState<List<Achievement>>> postAchievements(
      PostAchievementsRequest params);
}
