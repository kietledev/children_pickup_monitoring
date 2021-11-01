import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomWidgetsSnackBar {
  CustomWidgetsSnackBar._();
  static buildSuccessSnackbar(BuildContext context, String message) {
    final snackBar = new SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorConstants.neutralColor7,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: SvgPicture.asset("assets/icons/ic_success.svg"),
              ),
              Padding(
                padding: EdgeInsets.only(left:12),
                child:Text(message),
              ),
            ],
          )
      ),

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  static buildErrorSnackbar(BuildContext context, String message) {
    final snackBar = new SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: SvgPicture.asset( "assets/icons/ic_exclamation.svg"),
              ),
              Padding(
                padding: EdgeInsets.only(left:12),
                child:Text(message),
              ),
            ],
          )
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  }
