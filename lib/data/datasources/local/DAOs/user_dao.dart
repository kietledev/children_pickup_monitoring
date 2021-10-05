import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM ${DBConstants.kUserTableName}')
  Future<List<User>> getAllUsers();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(User user);

  @delete
  Future<void> deleteUser(User user);
}
