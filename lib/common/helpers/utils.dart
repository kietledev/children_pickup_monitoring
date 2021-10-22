import 'package:children_pickup_monitoring/common/constants/text_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static TextStyle setStyle(
      {Color? color = Colors.black,
      String? fontFamily = FontsConstants.notoSans,
      FontWeight? weight = FontWeight.w400,
      double? size = 16}) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontWeight: weight,
      fontSize: size,
    );
  }
}
