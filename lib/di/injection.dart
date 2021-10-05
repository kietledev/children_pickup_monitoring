import 'package:get_it/get_it.dart';

import 'modules/module.dart';

final GetIt injector = GetIt.instance;

abstract class DIModule {
  void provides();
}

class Injection {
  static Future<void> inject() async {
    await DBModule().provides();
    await ApiModule().provides();
    await RepositoryModule().provides();
    await UseCaseModule().provides();
    await BlocModule().provides();
    await PageModule().provides();
  }
}
