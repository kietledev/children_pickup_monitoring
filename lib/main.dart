import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/config/config.dart';
import 'common/constants/constants.dart';
import 'common/config/local_notification_service.dart';
import 'di/injection.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    // final routeFromMessage = message.data['route'];
    // if (routeFromMessage == 'verify') {
    //   final id = message.data['id'];
    //   Navigator.of(navigatorKey.currentState!.context)
    //       .push<void>(VerifyPage.route(id));
    // } else if (routeFromMessage == 'live_stream') {
    //   Navigator.of(navigatorKey.currentState!.context)
    //       .push<void>(LiveStreamPage.route());
    // } else if (routeFromMessage == 'personal_information') {
    //   Navigator.of(navigatorKey.currentState!.context)
    //       .push<void>(PersonalInformationsPage.route());
    // }
  }
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await Firebase.initializeApp();
  await Injection.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: TitlesConstants.appTitle,
        onGenerateRoute: AppRoutes.getRoute,
        initialRoute: RouteConstants.launch,
        theme: AppThemes.light,
        builder: EasyLoading.init(),
      ),
    );
  }
}
