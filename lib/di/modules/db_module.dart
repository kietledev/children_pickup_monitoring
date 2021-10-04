import '../injection.dart';

class DBModule extends DIModule {
  @override
  Future<void> provides() async {
  //   final database =
  //     await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  // injector.registerSingleton<AppDatabase>(database);
  }
}