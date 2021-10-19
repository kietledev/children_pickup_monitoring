import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/presentation/pages/achievements_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/pages.dart';
import 'package:children_pickup_monitoring/presentation/pages/pupil_detail_page.dart';
import 'package:flutter/material.dart';

import '../injection.dart';

class PageModule extends DIModule {
  @override
  Future<void> provides() async {
    injector.registerFactory<Widget>(() => const LaunchPage(),
        instanceName: RouteConstants.launch);

    injector.registerFactory<Widget>(() => const SplashPage(),
        instanceName: RouteConstants.splash);

    injector.registerFactory<Widget>(() => const LoginPage(),
        instanceName: RouteConstants.login);

    injector.registerFactory<Widget>(() => const BottomBarPage(),
        instanceName: RouteConstants.bottomBar);

    injector.registerFactory<Widget>(() => const HomePage(),
        instanceName: RouteConstants.home);

    injector.registerFactory<Widget>(() => const ClassInformationPage(),
        instanceName: RouteConstants.classInformation);

    injector.registerFactory<Widget>(() => const ClassDetailsPage(),
        instanceName: RouteConstants.classDetails);

    injector.registerFactory<Widget>(() => const TeacherInformationPage(),
        instanceName: RouteConstants.teacherInformation);

    injector.registerFactory<Widget>(() => const TeacherDetailsPage(),
        instanceName: RouteConstants.teacherDetails);

    injector.registerFactory<Widget>(() => const PupilDetailsPage(),
        instanceName: RouteConstants.pupilDetails);

    injector.registerFactory<Widget>(() => const AchievementsPage(),
        instanceName: RouteConstants.achievement);
  }
}
