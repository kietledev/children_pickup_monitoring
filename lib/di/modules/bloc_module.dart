import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/blocs/local_user/local_user_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/message_detail/message_detail_bloc.dart';

import '../injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    /* Login */
    injector
        .registerFactory<LoginBloc>(() => LoginBloc(injector(), injector()));

    /* Local User */
    injector.registerFactory<LocalUserBloc>(() => LocalUserBloc(injector()));

    /* Fetch Teacher */
    injector.registerFactory<TeachersBloc>(() => TeachersBloc(injector()));

    /* Fetch Pupil */
    injector.registerFactory<PupilsBloc>(() => PupilsBloc(injector()));

    /* Fetch Achievement */
    injector
        .registerFactory<AchievementBloc>(() => AchievementBloc(injector()));

    /* Message detail */
    injector.registerFactory<MessageDetailBloc>(
        () => MessageDetailBloc(MessageDetailState(), injector()));

    injector.registerFactory<ProfileBloc>(() => ProfileBloc());
  }
}
