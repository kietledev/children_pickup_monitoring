import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';

abstract class UserRepository {
  // API methods
  Future<DataState<User>> postLogin(LoginRequest params);

  // Database methods
  Future<User> getSaveUser();

  Future<void> saveArticle(User user);

  Future<void> removeArticle(User user);
}
