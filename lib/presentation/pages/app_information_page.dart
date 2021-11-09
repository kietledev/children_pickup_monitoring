
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInformationPage  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AppInformationPage();
}
class _AppInformationPage extends State<AppInformationPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(
        hideBack: true,
        title: TitlesAppBar.infoApp,
        actionBack: ()=>Navigator.pop(context),
      ),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_body_a.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text("Nội dung")
        ),
      ) ,
    );
  }
}