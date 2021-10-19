import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';

import '../injection.dart';

class UseCaseModule extends DIModule {
  @override
  Future<void> provides() async {
    /* Login Usecase */
    injector.registerSingleton<PostLoginUseCase>(PostLoginUseCase(injector()));

    /* Local User Usecase */
    injector.registerSingleton<GetSavedUserUseCase>(
        GetSavedUserUseCase(injector()));
    injector.registerSingleton<SaveUserUseCase>(SaveUserUseCase(injector()));
    injector
        .registerSingleton<RemoveUserUseCase>(RemoveUserUseCase(injector()));

    /* Post Teachers Usecase */
    injector.registerSingleton<PostTeachersUseCase>(
        PostTeachersUseCase(injector()));

    /* Post Pupil Usecase */
    injector
        .registerSingleton<PostPupilsUseCase>(PostPupilsUseCase(injector()));

    /* Post Pupil Usecase */
    injector.registerSingleton<PostAchievementsUseCase>(
        PostAchievementsUseCase(injector()));
  }
}
