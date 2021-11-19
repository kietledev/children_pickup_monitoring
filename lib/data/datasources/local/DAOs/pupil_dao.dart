import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class PupilDao {
  @Query('SELECT * FROM ${DBConstants.kPupilTableName}')
  Future<List<Pupil>> getPupils();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPupil(Pupil pupil);

  @delete
  Future<void> deletePupil(Pupil pupil);
}
