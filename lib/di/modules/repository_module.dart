import 'package:children_pickup_monitoring/data/repositories/repositories.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

import '../injection.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    injector.registerSingleton<UserRepository>(
      UserRepositoryImpl(injector()),
    );
  }
}
