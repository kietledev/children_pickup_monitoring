import 'dart:async';
import 'package:children_pickup_monitoring/data/datasources/local/DAOs/parent_dao.dart';
import 'package:children_pickup_monitoring/data/datasources/local/DAOs/pupil_dao.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/entities/table_parent.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'DAOs/person_dao.dart';
import 'DAOs/qr_generated_dao.dart';
import 'DAOs/user_dao.dart';
import 'DAOs/parent_dao.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [User, TablePickUpGenerated, PersonTable, TableParent, TablePupil])
abstract class AppDatabase extends FloorDatabase {
  UserDao get appUserDao;
  QRGeneratedDao get appQRGeneratedDao;
  PersonDao get appPersonDao;
  ParentDao get appParentDao;
  PupilDao get appPupilDao;
}
