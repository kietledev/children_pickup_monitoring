import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/presentation/pages/edit_profile_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/pages.dart';

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
    injector.registerFactory<Widget>(() => ProfilePage(),
        instanceName: RouteConstants.profile);
    injector.registerFactory<Widget>(() => EditProfilePage(),
        instanceName: RouteConstants.editProfile);
  }
}
