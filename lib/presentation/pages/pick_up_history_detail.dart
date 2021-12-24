import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/notification/notification_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/item_pick_up_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PickUpHistoryDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  BlocProvider(
        create: (context) => injector<NotificationBloc>(),
        child: Scaffold(
          appBar: WidgetAppBar(
            title: (AppLocalizations.of(context)!.detail),
            hideBack: true,
            actionBack: (){
              Navigator.pop(context);
            },
          ),
          body: BodyPickUpHistoryDetail(),
        )
    );
  }
}

class BodyPickUpHistoryDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BodyPickUpHistoryDetail();
}

class _BodyPickUpHistoryDetail extends State<BodyPickUpHistoryDetail>{
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_body_a.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32,),
            Container(
              height: 40,
              decoration: BoxDecoration(
                gradient: kMenuGradienColor,
                color: ColorConstants.brandColor,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [BoxShadow(color: Color(0xFFF3F5FF).withOpacity(1), spreadRadius: 3, blurRadius: 4, offset: Offset(0, 3),
                ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text("Ngày 26-06-2021", style: TextStyle(color: Colors.white,fontSize: 14),),
                    Spacer(),
                    Text("Trần Phú Nhuận"),
                  ],
                ),
              )
            ),
            SizedBox(height: 24,),
            Text("Sáng",style: TextStyle(color: ColorConstants.secondaryColor2,fontWeight: FontWeight.w600,fontFamily: FontsConstants.notoSans),),
            SizedBox(height: 12,),
            Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [BoxShadow(color: Color(0xFFF3F5FF).withOpacity(1), spreadRadius: 3, blurRadius: 4, offset: Offset(0, 3),
                  ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text("Vắng", style: TextStyle(color: ColorConstants.neutralColor1,fontFamily: FontsConstants.notoSans,fontWeight: FontWeight.w600,fontSize: 14),),
                      Spacer(),
                      Text("Bận việc gia đình",style: TextStyle(color: ColorConstants.neutralColor2,fontFamily: FontsConstants.notoSans,fontSize: 14)),
                    ],
                  ),
                )
            ),
            SizedBox(height: 24,),
            Text("Chiều",style: TextStyle(color: ColorConstants.secondaryColor2,fontWeight: FontWeight.w600,fontFamily: FontsConstants.notoSans),),
            SizedBox(height: 12,),
            Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [BoxShadow(color: Color(0xFFF3F5FF).withOpacity(1), spreadRadius: 3, blurRadius: 4, offset: Offset(0, 3),
                  ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text("Thời gian", style: TextStyle(color: ColorConstants.neutralColor1,fontFamily: FontsConstants.notoSans,fontWeight: FontWeight.w600,fontSize: 14),),
                      Spacer(),
                      Text("16-40",style: TextStyle(color: ColorConstants.neutralColor2,fontFamily: FontsConstants.notoSans,fontSize: 14)),
                    ],
                  ),
                )
            ),
            SizedBox(height: 12,),
            Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [BoxShadow(color: Color(0xFFF3F5FF).withOpacity(1), spreadRadius: 3, blurRadius: 4, offset: Offset(0, 3),
                  ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text("Địa điểm", style: TextStyle(color: ColorConstants.neutralColor1,fontFamily: FontsConstants.notoSans,fontWeight: FontWeight.w600,fontSize: 14),),
                      Spacer(),
                      Text("Tại Cổng A",style: TextStyle(color: ColorConstants.neutralColor2,fontFamily: FontsConstants.notoSans,fontSize: 14)),
                    ],
                  ),
                )
            ),
            SizedBox(height: 12,),
            Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [BoxShadow(color: Color(0xFFF3F5FF).withOpacity(1), spreadRadius: 3, blurRadius: 4, offset: Offset(0, 3),
                  ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text("Người đón", style: TextStyle(color: ColorConstants.neutralColor1,fontFamily: FontsConstants.notoSans,fontWeight: FontWeight.w600,fontSize: 14),),
                      Spacer(),
                      Text("Lê Tuấn Kiệt",style: TextStyle(color: ColorConstants.neutralColor2,fontFamily: FontsConstants.notoSans,fontSize: 14)),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }


}