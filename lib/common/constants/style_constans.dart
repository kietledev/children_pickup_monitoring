
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/material.dart';

class ProfileStyle {
  static const contentStyle1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color:ColorConstants.neutralColor1 ,
    fontFamily: FontsConstants.notoSans,
  );
  static const contentStyle2 = TextStyle(
      fontSize: 14,
      color: ColorConstants.neutralColor2,
      fontFamily: FontsConstants.notoSans,
      fontWeight: FontWeight.w600);
}
class EditProfileStyle{
  static const titleStyleEditTrue = TextStyle(
      color: ColorConstants.secondaryColor2,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: FontsConstants.notoSans);
  static const titleStyleEditFalse = TextStyle(
      color: ColorConstants.neutralColor2,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: FontsConstants.notoSans);
  static const contentStyle = TextStyle(
      color: ColorConstants.neutralColor1,
      fontSize: 14,
      fontFamily:FontsConstants.notoSans);
  static const contentBottomshowStyle = TextStyle(
      fontSize: 18,
      fontFamily:FontsConstants.notoSans,
      color: ColorConstants.secondaryColor2);
}
class AppBarStyle{
   static const textButtonRightStyle = TextStyle(
       fontSize: 16,
       fontFamily: FontsConstants.notoSans,
       color: ColorConstants.secondaryColor2,
       fontWeight: FontWeight.w600);
}