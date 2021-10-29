import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/presentation/pages/edit_profile_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/achievements_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/camera_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/list_parent_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/message_detail_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/pages.dart';
import 'package:children_pickup_monitoring/presentation/pages/parent_add_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/parent_details_page.dart';
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

    injector.registerFactory<Widget>(() => const AchievementDetailsPage(),
        instanceName: RouteConstants.achievementDetail);
    injector.registerFactory<Widget>(() => const MenuPage(),
        instanceName: RouteConstants.menu);

    injector.registerFactory<Widget>(() => const PupilDetailsPage(),
        instanceName: RouteConstants.pupilDetails);

    injector.registerFactory<Widget>(() => const AchievementsPage(),
        instanceName: RouteConstants.achievement);

    injector.registerFactory<Widget>(() => ProfilePage(),
        instanceName: RouteConstants.profile);

    injector.registerFactory<Widget>(() => const MessageDetailPage(),
        instanceName: RouteConstants.messageDetail);

    injector.registerFactory<Widget>(() => const CameraPage(),
        instanceName: RouteConstants.camera);
    injector.registerFactory<Widget>(() => EditProfilePage(),
        instanceName: RouteConstants.editProfile);
    injector.registerFactory<Widget>(() => ListParentPage(),
        instanceName: RouteConstants.listparent);
    injector.registerFactory<Widget>(() => ParentDetailsPage(),
        instanceName: RouteConstants.parentDetails);
    injector.registerFactory<Widget>(() => AddUserToParent(),
        instanceName: RouteConstants.addUserToParent);
    injector.registerFactory<Widget>(() => FormAddUserToParent(),
        instanceName: RouteConstants.formAddUserToParent);
    injector.registerFactory<Widget>(() => ParentAddPage(),
        instanceName: RouteConstants.parentAdd);

    injector.registerFactory<Widget>(() => GeneratedQRCodePage(),
        instanceName: RouteConstants.generatedQCode);
  }
}
