import 'package:children_pickup_monitoring/common/core/params/get_parents_request.dart';
import 'package:children_pickup_monitoring/common/core/params/get_users_by_person.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/repositories/parents_repository.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
class GetUsersByPersonUseCase implements UseCase<DataState<List<UserByPersonModel>>, GetUsersByPersonRequest> {
  final UsersByPersonRepository _usersByPersonRepository;

  GetUsersByPersonUseCase(this._usersByPersonRepository);

  @override
  Future<DataState<List<UserByPersonModel>>> call({GetUsersByPersonRequest? params}) {
    return _usersByPersonRepository.getUsersByPerson(params!);
  }
}
