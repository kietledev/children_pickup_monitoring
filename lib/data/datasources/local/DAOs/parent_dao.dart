import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class ParentDao {
  @Query('SELECT * FROM ${DBConstants.kParentTableName}')
  Future<List<TableParent>> getParents();

  @Query('SELECT * FROM ${DBConstants.kParentTableName} WHERE parentId = :parentId')
  Future<TableParent?> getParentById(int parentId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertParent(TableParent parent);

  @delete
  Future<void> deleteParent(TableParent parent);
}
