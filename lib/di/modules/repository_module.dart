import 'package:children_pickup_monitoring/data/repositories/achievements_repository_impl.dart';
import 'package:children_pickup_monitoring/data/repositories/repositories.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';

import '../injection.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    /* User repository */
    injector.registerSingleton<UserRepository>(
        UserRepositoryImpl(injector(), injector()));

    /* Teachers repository */
    injector.registerSingleton<TeachersRepository>(
        TeachersRepositoryImpl(injector()));

    /* Pupil repository */
    injector
        .registerSingleton<PupilsRepository>(PupilsRepositoryImpl(injector()));

    /* Achievement repository */
    injector.registerSingleton<AchievementsRepository>(
        AchievementsRepositoryImpl(injector()));

    /* Profile repository */
    injector.registerSingleton<ProfileRepository>(
      ProfileRepositoryImpl(injector(),injector()),
    );
  }
}
