import 'package:children_pickup_monitoring/common/constants/color_constants.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;
  final VoidCallback press;

  WidgetAppBar({
    this.backgroundColor = ColorConstants.brandColor,
    this.textIconColor = Colors.red,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height: kToolbarHeight,
    this.hideBack = false,
    required this.press
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_appbar_a.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: press,
          icon: SvgPicture.asset('assets/icons/ic_back_appbar.svg')),
      actions: menuItem,
      title: LinearGradientMask(
        firstColor: Color(0xFF1D61F2),
        secondColor: Color(0xFF26ABFB),
        child: Text(
          title!,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: FontsConstants.notoSans,
              fontSize: 20),
        ),
      ),
    );
    // return AppBar(
    //   actions: menuItem,
    //   toolbarHeight: preferredSize.height,
    //   iconTheme: IconThemeData(
    //     color: textIconColor,
    //   ),
    //   leading: hideBack
    //       ? Container()
    //       : icon == null
    //       ? BackButton()
    //       : IconButton(
    //     icon: Image.asset(
    //       icon!,
    //       height: 18,
    //       width: 18,
    //     ),
    //     onPressed: () {
    //       Navigator.pop(context, true);
    //     },
    //   ),
    //   title: Text(
    //     title!,
    //     style: TextStyle(
    //       fontSize: 20,
    //       fontWeight: FontWeight.bold,
    //       color: textIconColor,
    //     ),
    //   ),
    //   backgroundColor: backgroundColor,
    //   centerTitle: true,
    // );
  }
}