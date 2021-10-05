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
  }
}
