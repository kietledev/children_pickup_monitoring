
import 'package:children_pickup_monitoring/common/core/params/get_users_by_person.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';


abstract class UsersByPersonRepository {
  // API methods
  Future<DataState<List<UserByPersonModel>>> getUsersByPerson(GetUsersByPersonRequest query);
}