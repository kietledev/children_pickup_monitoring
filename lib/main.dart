import 'package:children_pickup_monitoring/common/constants/constants.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'common/config/config.dart';
import 'common/constants/constants.dart';
import 'common/config/local_notification_service.dart';
import 'common/helpers/preferences.dart';
import 'data/models/language_model.dart';
import 'di/injection.dart';
import 'presentation/blocs/language/language_bloc.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
     @override
  State<StatefulWidget> createState() => _MyApp();
}
 class _MyApp extends State<MyApp>{
   LanguageBloc? _languageBloc;
   final preferences = Preferences();
   @override
   void initState() {
     _languageBloc = LanguageBloc();
     preferences.getLanguage().then((value){
       _languageBloc!.add(
           ToggleLanguageEvent(
             Languages.languages[value], // index value can be 0 or 1 in our case
           )
       );
     });
     super.initState();
   }

   @override
   void dispose() {
     _languageBloc!.close();
     super.dispose();
   }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc!,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              builder: () => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: TitlesConstants.appTitle,
                onGenerateRoute: AppRoutes.getRoute,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('en'),
                  Locale('vi'),
                ],
                locale: state.locale,
                initialRoute: RouteConstants.launch,
                theme: AppThemes.light,
                builder: EasyLoading.init(),
              ),

            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
 }