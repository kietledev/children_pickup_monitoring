import 'dart:async';

import 'package:children_pickup_monitoring/common/constants/color_constants.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/blocs/local_user/local_user_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/message_detail/message_detail_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/school_nofitication/school_notification_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserFuntion {
  String title;
  String icon;
  Color color;
  UserFuntion(this.title, this.icon, this.color);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AchievementBloc>(
          create: (BuildContext context) => injector<AchievementBloc>()
            ..add(const FetchAchievements(pupilId: 4)),
        ),
        BlocProvider<SchoolNotificationBloc>(
          create: (BuildContext context) => SchoolNotificationBloc(),
        ),
        BlocProvider<AlarmBloc>(
          create: (BuildContext context) => AlarmBloc(),
        ),
      ],
      child: const Scaffold(
        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final listFunction = <UserFuntion>[
    UserFuntion(
        'Thực đơn', 'assets/icons/ic_cookie.svg', ColorConstants.primaryColor2),
    UserFuntion('Danh sách\nlớp', 'assets/icons/ic_users_hexagon.svg',
        ColorConstants.primaryColor3),
    UserFuntion('Lịch sử\nđón', 'assets/icons/ic_history.svg',
        ColorConstants.primaryColor1),
    UserFuntion('Xem\ncamera', 'assets/icons/ic_camera.svg',
        ColorConstants.primaryColor4),
    UserFuntion('Xem\nthêm', 'assets/icons/ic_menu_more.svg',
        ColorConstants.brandColor),
  ];

  late int _currentPupilId;
  final int _role = 1;

/* Alarm */
  Timer? _timer;
  late DateTime _finishTime;
  late DateTime _targetTime;
  int _warningMinutes = 0;
  int _counter = 0;
  String _stringTime = '';

  bool fetchAchievement = false;
  bool fetchSchoolNoti = false;

  List<Achievement> _achievements = [];
  late AlarmBloc _alarmBloc;

  @override
  void initState() {
    super.initState();
    _alarmBloc = BlocProvider.of<AlarmBloc>(context);
    _initVariable();
    _currentPupilId = 2;
  }

  @override
  void dispose() {
    _alarmBloc.close();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _pullRefresh() async {
    // _fetchAchievements(_currentPupilId);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_body_b.png'),
              fit: BoxFit.fill),
        ),
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                _role == 1 ? buildNumberOfPupils() : const SizedBox.shrink(),
                _role == 0 ? _buildAlarm() : Container(),
                _buildFeaturedCards(listFunction),
                _buildSchoolNotifications(),
                _buildAchievements(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNumberOfPupils() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Text('Điểm số tuần qua',
                style: Utils.setStyle(
                    color: const Color(0xFF4F3A57), weight: FontWeight.w600)),
            const SizedBox(height: 12),
            Row(
              children: [
                buildItemInScore(),
                const SizedBox(width: 6),
                buildItemInScore(),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                buildItemInScore(),
                const SizedBox(width: 6),
                buildItemInScore(),
              ],
            )
          ],
        ),
      );

  Expanded buildItemInScore() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFDEDFE1).withOpacity(0.5),
              spreadRadius: 6,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/ic_max_scores.svg',
              width: 46.w,
              height: 46.w,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thành tích',
                  style: Utils.setStyle(
                      color: ColorConstants.neutralColor1,
                      size: 10,
                      weight: FontWeight.w600),
                ),
                Text(
                  '50',
                  style: Utils.setStyle(
                      color: ColorConstants.neutralColor2, size: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  IntrinsicHeight _buildAlarm() {
    return IntrinsicHeight(
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            _buildContentAlarm(),
            _buildTimer(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimer() {
    return Expanded(
      flex: 45,
      child: BlocBuilder<AlarmBloc, AlarmState>(
        builder: (context, state) {
          switch (state.status) {
            case AlarmStatus.before:
              _stringTime = state.stringTime;
              _counter = state.counter;
              break;
            case AlarmStatus.alarm:
              _stringTime = state.stringTime;
              _counter = state.counter;
              break;
            case AlarmStatus.after:
              _stringTime = state.stringTime;
              _counter = state.counter;
              break;
          }
          return Stack(
            children: [
              Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                child: CustomPaint(
                  size: Size(96.w, 96.w),
                  painter: CustomTimerPainter(
                      totalMinus: _warningMinutes, currentMinus: _counter),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(_stringTime,
                    textAlign: TextAlign.center,
                    style: Utils.setStyle(
                        color: ColorConstants.brandColor,
                        weight: FontWeight.w600)),
              )
            ],
          );
        },
      ),
    );
  }

  Expanded _buildContentAlarm() {
    return Expanded(
      flex: 55,
      child: Container(
        margin: const EdgeInsets.only(left: 16, top: 16),
        child: Column(
          children: [
            Text('Sắp đến giờ đón bé rồi!',
                textAlign: TextAlign.center,
                style: Utils.setStyle(
                    color: ColorConstants.brandColor, weight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(
              'Hotline: 1800 999 111',
              style: Utils.setStyle(color: const Color(0xFFEB5757), size: 14),
            ),
            const SizedBox(height: 12),
            Container(
              width: 180,
              height: 36,
              color: Colors.transparent,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(ColorConstants.brandColor)),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, RouteConstants.achievement),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tạo mã đón bé',
                        style: Utils.setStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset(
                        'assets/icons/ic_arrow_right.svg',
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Container _buildSchoolNotifications() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 36),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ic_school_hexagon.svg',
                  width: 30,
                  height: 40.5,
                ),
                const SizedBox(width: 12),
                Text('Thông báo của trường',
                    style: Utils.setStyle(
                        color: ColorConstants.primaryColor4,
                        weight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) => _itemSchoolNotification(),
            ),
          )
        ],
      ),
    );
  }

  Container _itemSchoolNotification() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Thông báo tạm dừng giảng dạy do Covid-19 cho đến khi có thông báo mới',
                  style: Utils.setStyle(
                      color: ColorConstants.neutralColor1, size: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text('17-05-2021',
                  style: Utils.setStyle(
                      color: ColorConstants.primaryColor4, size: 8)),
              const SizedBox(height: 4),
              Text(
                'Trường mầm non Duy Tân xin trân trọng thông báo ngày về việc ngừng giảng dạy trực tiếp do ảnh hưởng của dịch Covid-19 trên địa bàn thành phố Đà Nẵng.',
                style: Utils.setStyle(
                    color: ColorConstants.neutralColor2, size: 10),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAchievements() {
    return BlocBuilder<AchievementBloc, AchievementState>(
        builder: (context, state) {
      if (state is FetchAchievementFailureState) {
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            child: _buildTitleAchievement(
              'Không có thành tích mới',
            ));
      } else if (state is FetchAchievementSuccessState) {
        if (state.achievements!.isEmpty) {
          return const Center(child: Text('no posts'));
        } else {
          _achievements.clear();
          if (state.achievements!.length > 2) {
            _achievements.add(state.achievements!.first);
            _achievements.add(state.achievements![1]);
          } else {
            _achievements = state.achievements!;
          }
          return _uiAchievement(_achievements);
        }
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  Container _uiAchievement(List<Achievement> achievements) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          _buildTitleAchievement(
            'Thành tích mới',
          ),
          const SizedBox(height: 12),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: achievements.length,
              itemBuilder: (context, index) =>
                  _itemAchievement(achievements[index]),
            ),
          )
        ],
      ),
    );
  }

  Container _buildTitleAchievement(String _title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 36),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/ic_trophy_hexagon.svg',
              width: 30, height: 40.5),
          const SizedBox(width: 12),
          Text(_title,
              style: Utils.setStyle(
                  color: ColorConstants.primaryColor1,
                  weight: FontWeight.w600)),
        ],
      ),
    );
  }

  Container _itemAchievement(Achievement item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.achievementBriefDescription ?? '',
                style: Utils.setStyle(
                    color: ColorConstants.neutralColor1, size: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedCards(List<UserFuntion> listFunc) {
    final cards = <Widget>[];
    if (listFunc.isNotEmpty) {
      for (int i = 0; i < listFunc.length; i++) {
        cards.add(
          Container(
            width: 73,
            color: Colors.transparent,
            child: Column(
              children: [
                SvgPicture.asset(
                  listFunc[i].icon,
                  width: 36,
                  height: 40.5,
                ),
                const SizedBox(height: 4),
                Text(listFunc[i].title,
                    textAlign: TextAlign.center,
                    style: Utils.setStyle(
                        color: ColorConstants.neutralColor2, size: 10))
              ],
            ),
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 5),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: cards),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Future _initVariable() async {
    // final preferences = Preferences();
    const String stringOfFinishTime =
        '09:55'; //await preferences.getSchoolFinishTime();
    _finishTime = getDateTimeFromString(stringOfFinishTime);

    _warningMinutes = 35; //int.parse(await preferences.getWarningTime());
    _counter = _warningMinutes;
    _targetTime = DateTime(
        _finishTime.year,
        _finishTime.month,
        _finishTime.day,
        _finishTime.hour - (_warningMinutes ~/ 60),
        _finishTime.minute - (_warningMinutes % 60),
        _finishTime.second);
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) async {
      final DateTime now = DateTime.now();

      if (now.isAfter(_targetTime) && now.isBefore(_finishTime)) {
        _counter = (_finishTime.hour * 60 + _finishTime.minute) -
            (now.hour * 60 + now.minute);
        final String minutes = _formatNumber(_counter - 1);
        final String seconds = _formatNumber(59 - now.second);
        _stringTime = '$minutes:${seconds}s';
        if (int.parse(minutes) == 0 && int.parse(seconds) == 0) {
          _stringTime = '00:00s';
          _timer!.cancel();
        }
        _alarmBloc.add(NewAlarm(
            status: AlarmStatus.alarm,
            stringTime: _stringTime,
            counter: _counter));
      } else if (now.isAfter(_finishTime)) {
        _stringTime = 'Hết giờ';
        _alarmBloc.add(NewAlarm(
          status: AlarmStatus.after,
          stringTime: _stringTime,
          counter: 1,
        ));
      } else {
        _stringTime = '${_targetTime.hour}:${_targetTime.minute}:00';

        _alarmBloc.add(NewAlarm(
          status: AlarmStatus.before,
          stringTime: _stringTime,
          counter: _warningMinutes,
        ));
      }
    });
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  DateTime getDateTimeFromString(String value) {
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day,
        int.parse(value.split(":")[0]), int.parse(value.split(":")[1]));
  }
}
