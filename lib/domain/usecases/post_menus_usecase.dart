import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

class PostMenusUseCase
    implements UseCase<DataState<List<FoodMenu>>, PostMenusRequest> {
  final MenusRepository _menusRepository;

  PostMenusUseCase(this._menusRepository);

  @override
  Future<DataState<List<FoodMenu>>> call({PostMenusRequest? params}) {
    return _menusRepository.postMenus(params!);
  }
}
