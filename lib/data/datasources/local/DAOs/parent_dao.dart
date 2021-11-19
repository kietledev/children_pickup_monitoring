import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class ParentDao {
  @Query('SELECT * FROM ${DBConstants.kParentTableName}')
  Future<List<Parent>> getParents();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertParent(Parent parent);

  // @delete
  // Future<void> deleteParent(Parent parent);
}
