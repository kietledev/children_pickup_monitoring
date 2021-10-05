import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/datasources/local/DAOs/user_dao.dart';
import 'package:children_pickup_monitoring/data/datasources/local/app_database.dart';

import '../injection.dart';

// class DBModule extends DIModule {
//   @override
//   Future<void> provides() async {
//     injector.registerSingleton<AppDB>(AppDB());
//     await injector<AppDB>().initAppDB().then((_) => {
//           injector
//               .registerSingleton<UserDao>(injector<AppDB>().database.appUserDao)
//         });
//   }
// }
class DBModule extends DIModule {
  @override
  Future<void> provides() async {
    final database =
        await $FloorAppDatabase.databaseBuilder(DBConstants.kDatabaseName).build();
    injector.registerSingleton<AppDatabase>(database);
  }
}