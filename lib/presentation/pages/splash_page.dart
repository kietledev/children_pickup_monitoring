import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}

class SplashBody extends StatefulWidget {
  const SplashBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "textheader": "Xem tất cả trên di động",
      "text":
          "Từ đây phụ huynh có thể xem trực tiếp\nlịch học, thời khó biểu, thực đơn cho con!",
      "image": "assets/images/splash1.png"
    },
    {
      "textheader": "Đặt lịch đón con",
      "text": "Giờ đây có thể đặt con, dù đang bận\nrộn ở bất kỳ nơi nào",
      "image": "assets/images/splash2.png"
    },
    {
      "textheader": "Giúp con học trực tuyến",
      "text":
          "Con có thể học mọi nơi và ứng dụng vào\nnhững lúc cấp bách không đến lớp được",
      "image": "assets/images/splash3.png"
    },
    {
      "textheader": "Giao tiếp với giáo viên!",
      "text": "Phụ huynh có thể trao đổi và nhận\nthông báo từ giáo viên",
      "image": "assets/images/splash4.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<String> a = [];
    a.clear();
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_splash_screen.png'),
              fit: BoxFit.fill),
        ),
        child: Column(children: <Widget>[
          Expanded(
            flex: 72,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            splashData[index]["image"]!,
                            fit: BoxFit.scaleDown,
                          ),
                          Text(splashData[index]['textheader']!,
                              style: Utils.setStyle(
                                color: ColorConstants.primaryColor3,
                                size: 24.sp,
                                weight: FontWeight.w600,
                              )),
                          SizedBox(height: 12.h),
                          Text(splashData[index]['text']!,
                              textAlign: TextAlign.center,
                              style: Utils.setStyle(
                                  color: const Color(0xFF4A4453))),
                        ],
                      ),
                    )),
          ),
          Expanded(
            flex: 28,
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                SizedBox(height: 48.h),
                CustomButton(
                    text: ButtonConstatns.start,
                    width: 154.w,
                    press: () {
                      Navigator.pushNamed(context, RouteConstants.login);
                    }),
              ],
            ),
          )
        ]));
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 38 : 10,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xFF8595FC)
            : const Color(0xFFD6E4FF),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
