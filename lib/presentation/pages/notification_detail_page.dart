import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/domain/entities/school_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NotificationDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as SchoolNotification;
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
        actionBack: ()=>Navigator.pop(context),
        hideBack: true,
        title:(AppLocalizations.of(context)!.detail) ,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_body_a.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Text("${item.title}",style: TextStyle(fontSize: 14,fontFamily: FontsConstants.notoSans,color: ColorConstants.neutralColor1)),
                  ),
                  SizedBox(height: 22,),
                  Text("${Utils.formatDateTime('${item.dateTimeReceived ?? ""}')}",style: TextStyle(fontSize: 10,color: ColorConstants.primaryColor4,fontFamily: FontsConstants.notoSans),),
                  SizedBox(height: 4,),
                  Text("${item.content}",style: TextStyle(fontSize: 14,fontFamily: FontsConstants.notoSans,color: ColorConstants.neutralColor2)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}