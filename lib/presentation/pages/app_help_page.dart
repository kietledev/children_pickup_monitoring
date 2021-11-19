
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/my_behavior.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppHelpPage  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AppHelpPage();
}
class _AppHelpPage extends State<AppHelpPage>{
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(
        hideBack: true,
        title: TitlesAppBar.helpApp,
        actionBack: ()=>Navigator.pop(context),
      ),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_body_a.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index){
                return ItemQuestionListView(
                    index: index,
                    isSelected: currentIndex == index,
                    question: "Câu hỏi 1?",
                    onSelect: (){
                      setState(() {
                        currentIndex = index;
                      });
                    },
                );
              }
          ),
        ),
      ),
    );
  }
}