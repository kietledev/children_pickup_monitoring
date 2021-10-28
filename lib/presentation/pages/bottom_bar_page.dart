import 'package:children_pickup_monitoring/common/config/local_notification_service.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/utils.dart';
import 'package:children_pickup_monitoring/presentation/pages/classroom_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/home_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/message_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/profile_page.dart';
import 'package:children_pickup_monitoring/presentation/pages/school_page.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);
  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isParent = false;
  final String _bgAppbar = 'assets/images/bg_appbar_b.png';

  final int _role = 0;
  int _currentIndex = 0;
  final _pageController = PageController();

  final _home = const HomePage();
  final _school = const SchoolPage();
  final _classroom = const ClassroomPage();
  final _message = const MessagePage();
  final _profile = const ProfilePage();

  final _itemHome = BottomNavigationBarItem(
      label: 'Trang chủ',
      icon: SvgPicture.asset('assets/icons/ic_home.svg',
          color: ColorConstants.primaryColor3),
      activeIcon: SvgPicture.asset('assets/icons/ic_home.svg',
          color: ColorConstants.brandColor));
  final _itemSchool = BottomNavigationBarItem(
      label: 'Trường học',
      icon: SvgPicture.asset('assets/icons/ic_school.svg',
          color: ColorConstants.primaryColor3),
      activeIcon: SvgPicture.asset('assets/icons/ic_school.svg',
          color: ColorConstants.brandColor));
  final _itemClassroom = BottomNavigationBarItem(
      label: StringConstatns.className,
      icon: SvgPicture.asset('assets/icons/ic_class.svg',
          color: ColorConstants.primaryColor3),
      activeIcon: SvgPicture.asset('assets/icons/ic_class.svg',
          color: ColorConstants.brandColor));
  final _itemMessage = BottomNavigationBarItem(
      label: 'Tin nhắn',
      icon: SvgPicture.asset('assets/icons/ic_message.svg',
          color: ColorConstants.primaryColor3),
      activeIcon: SvgPicture.asset('assets/icons/ic_message.svg',
          color: ColorConstants.brandColor));
  final _itemPersonal = BottomNavigationBarItem(
      label: 'Cá nhân',
      icon: SvgPicture.asset('assets/icons/ic_profile.svg',
          color: ColorConstants.primaryColor3),
      activeIcon: SvgPicture.asset('assets/icons/ic_profile.svg',
          color: ColorConstants.brandColor));
  final _itemQR = const BottomNavigationBarItem(label: '', icon: Icon(null));

  @override
  void initState() {
    super.initState();
    if (_role == 0) _isParent = true;
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.getInitialMessage();

    messaging.getToken().then((value) {
      String? token = value;
      print("Instance ID: $token");
    });

    //Forground
    FirebaseMessaging.onMessage.listen((message) {
      print('sssssss');
      LocalNotificationService.display(message);
    });

    //When the app is in background but opened and users taps
    //on the nofitication
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // final routeFromMessage = message.data['route'];
      // if (routeFromMessage == 'verify') {
      //   final id = message.data['id'];
      //   Navigator.of(context).push<void>(VerifyPage.route(id));
      // } else if (routeFromMessage == 'live_stream') {
      //   Navigator.of(context).push<void>(LiveStreamPage.route());
      // } else if (routeFromMessage == 'personal_information') {
      //   Navigator.of(context).push<void>(PersonalInformationsPage.route());
      // }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      drawerEdgeDragWidth: 0,
      drawer: const Drawer(
          // child: TransferPuppilScreen(),
          ),
      key: _scaffoldKey,
      body: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: appBar(title: getTitle(_currentIndex), isParent: _isParent),
            body: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _home,
                if (_role == 2) _school else _classroom,
                if (_role == 0) Container() else _message,
                if (_role == 0) _message else _profile,
                if (_role == 0) _profile,
              ],
            ),
            floatingActionButton: buildFloatingActionButton(showFab),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: buildBottomNavigationBar(context),
          );
        },
      ),
    );
  }

  Theme buildBottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        iconSize: 20,
        elevation: 0.0,
        selectedLabelStyle:
            const TextStyle(fontSize: 12, fontFamily: FontsConstants.notoSans),
        unselectedLabelStyle:
            const TextStyle(fontSize: 12, fontFamily: FontsConstants.notoSans),
        selectedItemColor: ColorConstants.brandColor,
        unselectedItemColor: ColorConstants.neutralColor2,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          _itemHome,
          if (_role == 2) _itemSchool else _itemClassroom,
          if (_role == 0) _itemQR else _itemMessage,
          if (_role == 0) _itemMessage else _itemPersonal,
          if (_role == 0) _itemPersonal,
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }

  Opacity buildFloatingActionButton(bool showFab) {
    return Opacity(
      opacity: showFab ? 1 : 0,
      child: Visibility(
        visible: _isParent,
        child: GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, GeneratedQRCodeScreen.routeName);
          },
          child: SvgPicture.asset(
            'assets/icons/ic_create_qr.svg',
            width: 36,
            height: 45,
          ),
        ),
      ),
    );
  }

  AppBar appBar({required String title, bool isParent = false}) {
    return AppBar(
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_bgAppbar),
            fit: BoxFit.cover,
          ),
        ),
      ),
      leading: isParent
          ? InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: InkWell(
                  onTap: () => _scaffoldKey.currentState!.openDrawer(),
                  child: const CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage("assets/images/img_avatar.png"),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, NotificationScreen.routeName);
            },
            icon: SvgPicture.asset(
              'assets/icons/ic_notification.svg',
              width: 20,
              height: 18,
              color: ColorConstants.brandColor,
            ),
          ),
        )
      ],
      title: LinearGradientMask(
        firstColor: const Color(0xFF1D5CF2),
        secondColor: const Color(0xFF27AFFC),
        child: Text(
          title,
          style: Utils.setStyle(
              color: Colors.white, size: 20, weight: FontWeight.w600),
        ),
      ),
    );
  }

  String getTitle(int index) {
    final List<String> title = [
      _itemHome.label!,
      if (_role == 2) _itemSchool.label! else _itemClassroom.label!,
      if (_role == 0) '' else _itemMessage.label!,
      if (_role == 0) _itemMessage.label! else _itemPersonal.label!,
      if (_role == 0) _itemPersonal.label!,
    ];
    return title[index];
  }
}
