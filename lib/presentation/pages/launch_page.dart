import 'dart:async';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  late Timer _timer;
  bool isLogin = true;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 5), () {
      if (isLogin) {
        Navigator.of(context).pushReplacementNamed(RouteConstants.splash);
      } else if (isLogin) {
        Navigator.of(context).pushReplacementNamed(RouteConstants.bottomBar);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg_launch_screen.png'),
            fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/ic_logo.svg',
              width: 67.w, height: 94.h),
          SizedBox(height: 10.h),
          Text(
            TitlesConstants.appTitle,
            style: Utils.initTextStyle(
                color: const Color(0xFF5330AC),
                size: 24,
                weight: FontWeight.w900),
          )
        ],
      ),
    ));
  }
}
