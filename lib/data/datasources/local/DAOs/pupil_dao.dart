import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class PupilDao {
  @Query('SELECT * FROM ${DBConstants.kPupilTableName}')
  Future<List<TablePupil>> getPupils();

  @Query('SELECT * FROM ${DBConstants.kPupilTableName} WHERE pupilId IN ( :pupilId1, :pupilId2, :pupilId3 )')
  Future<List<TablePupil?>> getPupilById(int pupilId1, int pupilId2, int pupilId3 );

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPupil(TablePupil pupil);

  @delete
  Future<void> deletePupil(TablePupil pupil);
}
