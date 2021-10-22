import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.imgBg = 'assets/images/bg_appbar_b.png',
      this.isNoti = false})
      : super(key: key);
  final String title;
  final String imgBg;
  final bool isNoti;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: imgBg.isNotEmpty
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgBg),
                  fit: BoxFit.cover,
                ),
              )
            : const BoxDecoration(),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/ic_arrow_left.svg', width: 30),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        isNoti
            ? Padding(
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
            : const SizedBox.shrink()
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
