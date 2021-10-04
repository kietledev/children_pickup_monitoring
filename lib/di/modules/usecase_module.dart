import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';

import '../injection.dart';

class UseCaseModule extends DIModule {
  @override
  Future<void> provides() async {
    /* Login Usecase */
    injector.registerSingleton<PostLoginUseCase>(PostLoginUseCase(injector()));
  }
}
