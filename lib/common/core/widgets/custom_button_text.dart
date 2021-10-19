import 'package:children_pickup_monitoring/common/constants/color_constants.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/material.dart';


class CustomButtonText extends StatelessWidget {
  const CustomButtonText({
    Key? key,
    required this.text,
    required this.press,
    required this.width,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      child: TextButton(
        onPressed: press,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(ColorConstants.brandColor)),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontFamily: FontsConstants.notoSans,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
