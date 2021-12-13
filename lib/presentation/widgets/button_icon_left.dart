import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonIconLeft extends StatelessWidget {
  const ButtonIconLeft({
    Key? key,
    required this.text,
    required this.press,
    required this.width,
    required this.icon
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  final double width;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
          color: ColorConstants.brandColor,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: TextButton.icon(
        icon: SvgPicture.asset(icon,height: 16,),
        label: Text(text,style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: FontsConstants.notoSans),),
        onPressed: press,
      ),
    );
  }
}
