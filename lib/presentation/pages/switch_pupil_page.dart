import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class SwitchPupilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
        actionBack: ()=>Navigator.pop(context),
        title: "Chuyển bé",
      ),
      body: BlocProvider(
        create: (_) => injector<PupilByParentBloc>()..add(const FetchPupilByParent(parentId: 2)),
        child:  BodySwitchPupilPage(),
      )

    );
  }
}

class BodySwitchPupilPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BodySwitchPupilPage();
}
class _BodySwitchPupilPage extends State<BodySwitchPupilPage>{
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  BlocBuilder<PupilByParentBloc, PupilByParentState>(builder: (context, state) {
      if (state is FetchPupilByParentSuccessState) {
        EasyLoading.dismiss();
        final List<Pupil> pupils = state.pupils!;
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
                itemCount:pupils.length,
                itemBuilder: (context,index){
                  final items =pupils[index];
                  return ItemPupilListView(
                    index: 1,
                    isSelected: currentIndex == index,
                    avatar: items.personDetail!.avatarPicture!,
                    fullName: items.getFullName(),
                    className: items.className!,
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
      } else if (state is FetchTeachersFailureState) {
        EasyLoading.dismiss();
        return const SizedBox.shrink();
      } else {
        EasyLoading.show();
        return const SizedBox.shrink();
      }
    });
  }

}