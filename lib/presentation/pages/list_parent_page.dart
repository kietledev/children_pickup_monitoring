import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListParentPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
        title: "Danh sách liên quan",
        actionBack: (){
          Navigator.pop(context);
        },
        menuItem: [
           itemRight()
        ],
      ),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_body_a.png'),
            fit: BoxFit.fill,
          ),
        ),
      ) ,
    );
  }
  Widget itemRight(){
    return TextButton(
      onPressed: () {
       // Navigator.pushNamed(context, SearchParentScreen.routeName);
      },
      child: SvgPicture.asset(
        'assets/icons/ic_add_16.svg',
        height: 16,
        width: 16,
      ),
    );
  }
}