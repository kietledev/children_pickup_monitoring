import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/blocs/local_user/local_user_bloc.dart';

import '../injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    /* Login */
    injector
        .registerFactory<LoginBloc>(() => LoginBloc(injector(), injector()));

    /* Local User */
    injector.registerFactory<LocalUserBloc>(() => LocalUserBloc(injector()));
    /* Profile User */
    injector.registerFactory<ProfileBloc>(()=>ProfileBloc(injector()));
  }
}
