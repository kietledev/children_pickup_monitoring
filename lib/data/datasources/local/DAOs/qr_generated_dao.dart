import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class QRGeneratedDao {
  @Query('SELECT * FROM ${DBConstants.kQRGeneratedTableName}')
  Future<List<PickUpGenerated>> getQRGenerateds();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertQRGenerated(Pupil pupil);

  @delete
  Future<void> deleteQRGenerated(Pupil pupil);
}
