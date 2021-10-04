import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/config/config.dart';
import 'common/constants/constants.dart';
import 'di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
