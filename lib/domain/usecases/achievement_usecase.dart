import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostAchievementsUseCase
    implements UseCase<DataState<List<Achievement>>, PostAchievementsRequest> {
  final AchievementsRepository _achievementsRepository;

  PostAchievementsUseCase(this._achievementsRepository);

  @override
  Future<DataState<List<Achievement>>> call({PostAchievementsRequest? params}) {
    return _achievementsRepository.postAchievements(params!);
  }
}
