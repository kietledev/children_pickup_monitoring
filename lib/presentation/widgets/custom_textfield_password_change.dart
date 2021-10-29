 import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TextFieldPasswordChange extends StatefulWidget{
  TextEditingController controller;
  bool passwordVisible;
  String title;
  TextFieldPasswordChange({
    required this.controller,
    required this.passwordVisible,
    required this.title,
  });
  @override
  State<StatefulWidget> createState() => _TextFieldPasswordChange();
}
class _TextFieldPasswordChange extends State<TextFieldPasswordChange>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,style: EditProfileStyle.titleStyleEditTrue,),
        SizedBox(height: 6.h,),
        Container(
          height: 40.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            controller: widget.controller,
            obscureText: widget.passwordVisible,
            style: TextStyle(color:ColorConstants.neutralColor1),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: widget.passwordVisible  ? SvgPicture.asset('assets/icons/ic_eye.svg'):SvgPicture.asset('assets/icons/ic_hiden_eye.svg'),
                onPressed: (){
                  setState(() {
                    widget.passwordVisible = !widget.passwordVisible;
                  });
                },
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.white, width: 3),
              ),
            ),
          ),
        )
      ],
    );
  }
}