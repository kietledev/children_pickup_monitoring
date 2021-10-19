
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
  static const contentStyleEditTrue = TextStyle(
      color: ColorConstants.secondaryColor2,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: FontsConstants.notoSans);
  static const contentStyleEditFalse = TextStyle(
      color: ColorConstants.neutralColor2,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: FontsConstants.notoSans);
}