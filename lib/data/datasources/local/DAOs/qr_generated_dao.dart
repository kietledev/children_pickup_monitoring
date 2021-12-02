import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class QRGeneratedDao {
  @Query('SELECT * FROM ${DBConstants.kQRGeneratedTableName}')
  Future<List<TablePickUpGenerated>> getQRGenerateds();

  @Query('SELECT * FROM ${DBConstants.kQRGeneratedTableName} WHERE cardId = :cardId')
  Future<TablePickUpGenerated?> getQRGeneratedById(String cardId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertQRGenerated(TablePickUpGenerated pickUpGenerated);

  @delete
  Future<void> deleteQRGenerated(TablePickUpGenerated pickUpGenerated);

  @Query('UPDATE ${DBConstants.kQRGeneratedTableName} SET status = :status WHERE cardId = :cardId')
  Future<TablePickUpGenerated?> updateQRCode(int status, String cardId);
}
