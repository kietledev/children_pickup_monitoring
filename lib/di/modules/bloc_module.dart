import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';

import '../injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    /* Login */
    injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));
  }
}
