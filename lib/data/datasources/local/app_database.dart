import 'dart:async';
import 'package:children_pickup_monitoring/common/constants/db_constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'DAOs/user_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get appUserDao;
}
