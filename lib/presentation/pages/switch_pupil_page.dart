import 'package:children_pickup_monitoring/common/constants/text_constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/common/helpers/preferences.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SwitchPupilPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SwitchPupilPage();
}

class _SwitchPupilPage extends State<SwitchPupilPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
        actionBack: ()=>Navigator.pop(context),
        hideBack: false,
        title: (AppLocalizations.of(context)!.switchPupil),
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
  List<Pupil> pupils = [];
  UserModel? userModel;
  int pupilId = -1;
  int parentId = -1;
  final preferences = Preferences();
  @override
  void initState() {
    super.initState();
    getUserId();
    getPupilID().then((value) => _onSelected(value, value));
  }
  getUserId() async {
    userModel = await getUser();
    parentId = userModel!.fromParentId;
    BlocProvider.of<PupilByParentBloc>(context).add(FetchPupilByParent(parentId: parentId));
  }
  _onSelected(int index, int classId) {
    setState(() {
      currentIndex = index;
      preferences.setIDpupil(index);
      preferences.setClassPupil(classId);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  BlocBuilder<PupilByParentBloc, PupilByParentState>(builder: (context, state) {
      if (state is FetchPupilByParentSuccessState) {
        EasyLoading.dismiss();
        pupils = state.pupils!;
        //Lưu id trẻ
        List<int> pupilIDs = [];
        for(int i = 0; i< pupils.length; i++){
          pupilIDs.add(pupils[i].pupilId!);
        }
        preferences.setListPupilId(pupilIDs);

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
                    isSelected: currentIndex == pupils[index].pupilId,
                    avatar: items.personDetail!.avatarPicture!,
                    fullName: items.getFullName(),
                    className: items.className!,
                    onSelect: ()=>_onSelected(items.pupilId!, items.classId!)
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