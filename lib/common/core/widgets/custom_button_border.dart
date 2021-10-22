import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/material.dart';


class CustomButtonBorder extends StatelessWidget {
  const CustomButtonBorder({
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
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: Colors.red
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: press,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontFamily: FontsConstants.notoSans,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
