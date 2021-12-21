import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';

import 'package:floor/floor.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM ${DBConstants.kPersonTableName}')
  Future<List<PersonTable>> getPersons();

  @Query('SELECT * FROM ${DBConstants.kPersonTableName} WHERE personId = :personId')
  Future<PersonTable?> getPersonById(int personId);


  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPerson(PersonTable person);

@delete
Future<void> deletePerson(PersonTable person);
}