import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SwitchPupilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
        actionBack: ()=>Navigator.pop(context),
        title: "Chuyển bé",
      ),
      body: BodySwitchPupilPage()
    );
  }
}

class BodySwitchPupilPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BodySwitchPupilPage();
}
class _BodySwitchPupilPage extends State<BodySwitchPupilPage>{
  int currentIndex = -1;
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
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
            itemCount:5 ,
            itemBuilder: (context,index){
              return ItemPupilListView(
                index: 1,
                isSelected: currentIndex == index,
                avatar: "",
                fullName: "Tran Phu Nhuan",
                onSelect: (){
                  setState(() {
                    print(index);
                    currentIndex = index;
                  });
                },
              );
            }
        ),
      ),
    );
  }

}