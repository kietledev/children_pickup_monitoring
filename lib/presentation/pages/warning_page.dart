import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WarningPage extends StatefulWidget{
  int type = -1;
  // type = 0-- no internet
  //type = 1 -- no data
  WarningPage({required this.type});
  @override
  State<StatefulWidget> createState() =>_WarningPage();
}
class _WarningPage extends State<WarningPage>{
  @override
  Widget build(BuildContext context) {
     return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_body_a.png'),
          fit: BoxFit.cover,
        ),
      ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           (widget.type ==0) ? SvgPicture.asset("assets/images/img_404.svg")
                             : SvgPicture.asset("assets/images/img_404_data.svg"),
           (widget.type ==0) ? Text("No internet connection",style: TextStyle(fontSize: 16,color: ColorConstants.brandColor,fontFamily: FontsConstants.notoSans))
                             :Text("There is no data to show",style: TextStyle(fontSize: 16,color: ColorConstants.brandColor,fontFamily: FontsConstants.notoSans)),
           SizedBox(height: 12,),
           Padding(
               padding: EdgeInsets.symmetric(horizontal: 24),
             child: Center(
               child:(widget.type ==0)
                  ? Text(
                         "Hmm! Please check your network connectivity and try again",
                          textAlign: TextAlign.center,
                          style:TextStyle(fontSize: 14,color: ColorConstants.neutralColor1,fontFamily: FontsConstants.notoSans))
                   : Text(
                          "Sorry, please try again or wait for us to prepare the data",
                           textAlign: TextAlign.center,
                           style:TextStyle(fontSize: 14,color: ColorConstants.neutralColor1,fontFamily: FontsConstants.notoSans)
                  )
             ),
           )
         ],
       )
    );
  }
}