import 'package:children_pickup_monitoring/data/repositories/achievements_repository_impl.dart';
import 'package:children_pickup_monitoring/data/repositories/parent_repository_impl.dart';
import 'package:children_pickup_monitoring/data/repositories/relationship_type_repository_impl.dart';
import 'package:children_pickup_monitoring/data/repositories/repositories.dart';
import 'package:children_pickup_monitoring/data/repositories/users_by_person_repository_impl.dart';
import 'package:children_pickup_monitoring/domain/repositories/parents_repository.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
import 'package:children_pickup_monitoring/presentation/blocs/message_detail/message_detail_bloc.dart';

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

    /* Message repository */
    injector.registerSingleton<MessageDetailRepository>(
      MessageDetailRepository(),
    );
    /* Parent repository */
    injector.registerSingleton<ParentsRepository>(
      ParentRepositoryImpl(injector(),injector()),
    );
    /* users repository */
    injector.registerSingleton<UsersByPersonRepository>(
      UsersByPersonRepositoryImpl(injector()),
    );
    /* relationship type repository */
    injector.registerSingleton<RelationshipTypeRepository>(
      RelationshipTypeRepositoryImpl(injector()),
    );
    /* menu repository */
    injector.registerSingleton<MenusRepository>(
      MenusRepositoryImpl(injector()),
    );
  }
}
