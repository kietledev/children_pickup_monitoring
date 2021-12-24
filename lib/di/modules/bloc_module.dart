import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/blocs/class_room/class_room_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/language/language_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/local_user/local_user_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/message_detail/message_detail_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/message_page/message_page_bloc.dart';

import 'package:children_pickup_monitoring/presentation/blocs/notification/notification_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/parents/parents_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/password/password_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/relationship_type/relationship_type_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/school_nofitication/school_notification_bloc.dart';
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
    injector.registerFactory<PupilsBloc>(() => PupilsBloc(injector(),injector()));

    /* Fetch Achievement */
    injector
        .registerFactory<AchievementBloc>(() => AchievementBloc(injector()));

    /* Message detail */
    injector.registerFactory<MessageDetailBloc>(
        () => MessageDetailBloc(MessageDetailState(), injector(), injector(),injector()));

    /* Home */
    injector.registerFactory<AlarmBloc>(() => AlarmBloc());
    injector.registerFactory<SchoolNotificationBloc>(
        () => SchoolNotificationBloc());

    /* Profile User */
    injector.registerFactory<ProfileBloc>(
        () => ProfileBloc(injector(), injector()));
    /* Create a pick up code */
    // injector.registerFactory<Pick>(()=>ProfileBloc(injector()));
    /* Parent */
    injector.registerFactory<ParentsBloc>(
        () => ParentsBloc(injector(), injector(), injector()));
    /* Users */
    injector.registerFactory<UsersBloc>(() => UsersBloc(injector()));
    /* Relationship Type */
    injector.registerFactory<RelationshipTypeBloc>(
        () => RelationshipTypeBloc(injector()));

    injector.registerFactory<MenuBloc>(() => MenuBloc(injector()));
    /* Password */
    injector.registerFactory<PasswordBloc>(() => PasswordBloc(injector()));

    injector
        .registerFactory<PickUpPlaceBloc>(() => PickUpPlaceBloc(injector()));

    injector.registerFactory<PupilByParentBloc>(
        () => PupilByParentBloc(injector()));
    //injector.registerFactory<LanguageBloc>(() =>LanguageBloc(injector()));
    /* list notification */
    injector.registerFactory<NotificationBloc>(() =>NotificationBloc(injector(),injector(),injector()));
    /* list classRoom */
    injector.registerFactory<ClassRoomBloc>(() =>ClassRoomBloc(injector(),injector()));

    injector.registerFactory<PickUpBloc>(() =>PickUpBloc(injector(), injector()));

    /* Message Page Bloc */
    injector.registerFactory<MessagePageBloc>(() => MessagePageBloc(injector()));

  }
}
