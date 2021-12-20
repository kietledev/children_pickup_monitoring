import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/list_class_by_teacher_model.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/class_room/class_room_bloc.dart';
import 'package:children_pickup_monitoring/presentation/blocs/notification/notification_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationAddPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _NotificationAddPage();
}
class _NotificationAddPage extends State<NotificationAddPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: WidgetAppBar(
          title: (AppLocalizations.of(context)!.addNotificationNew),
          actionBack: ()=>Navigator.pop(context),
          hideBack: true,
        ),
        body: MultiBlocProvider(
            providers: [
              BlocProvider<ClassRoomBloc>(
                create: (context) => injector<ClassRoomBloc>()..add(GetListClassByTeacherId(personId: 104)),
              ),
              BlocProvider<NotificationBloc>(
                create: (context) => injector<NotificationBloc>(),
              ),
            ],
            child:BodyNotificationAddPage()
        )
    );
  }
}
class BodyNotificationAddPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BodyNotificationAddPage();
}
class _BodyNotificationAddPage extends State<BodyNotificationAddPage>{
  List<ClassByTeacherModel> listClassRoom = [];
   List<int> listClassId=[];
  TextEditingController titleAnnoucement = new TextEditingController();
  TextEditingController contentAnnoucement = new TextEditingController();
  @override
  void dispose() {
   titleAnnoucement.dispose();
   contentAnnoucement.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ClassRoomBloc,ClassRoomState>(
          listener: (context,state){
            if (state is FetchClassRoomLoadingState) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
              if (state is FetchClassRoomSuccessState) {
                setState(() {
                  listClassRoom = state.classRooms!;
                });
              } else if (state is FetchClassRoomFailureState) {
                print("Loix");
                UiHelper.showMyDialog(
                  context: context,
                  content: state.msg ?? "This is something wrong",
                );
              } else {}
            }
          },
        ),
        BlocListener<NotificationBloc,NotificationState>(
          listener: (context,state){
            if (state is NotificationLoadingState) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
              if (state is PostNotificationSuccessState) {
                WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildSuccessSnackbar(context, "Đăng tin thành công"));
                Navigator.pop(context);
              } else if (state is NotificationFailureState) {
                UiHelper.showMyDialog(
                  context: context,
                  content: state.msg ?? "This is something wrong",
                );
              } else {}
            }
          },
        )
      ],
      child: Container(
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
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
              child: Column(
                children: [
                  Container(
                    height: 72,
                    margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
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
                      maxLines: 5,
                      controller: titleAnnoucement,
                      style: TextStyle(
                          color: ColorConstants.neutralColor1,
                          fontSize: 14,
                          fontFamily: FontsConstants.notoSans),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Nhập tiêu đề",
                        hintStyle: TextStyle(fontSize: 14,color: ColorConstants.neutralColor2,fontFamily: FontsConstants.notoSans),
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.white, width: 2),),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                  ),
                  DropdownSelected(
                    dropdownTitleTileText: 'Lớp nhận thông báo',
                    items: listClassRoom,
                    onSelect: (value) {
                      listClassId = value;
                    },
                  ),
                  Container(
                    height: 400,
                    margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
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
                      maxLines: 1000,
                      controller: contentAnnoucement,
                      style: TextStyle(
                          color: ColorConstants.neutralColor1,
                          fontSize: 14,
                          fontFamily: FontsConstants.notoSans),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Nhập nội dung",
                        hintStyle: TextStyle(fontSize: 14,color: ColorConstants.neutralColor2,fontFamily: FontsConstants.notoSans),
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.white, width: 2),),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 44,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomButtonBorder(
                          text: (AppLocalizations.of(context)!.cancel),
                          width: 133,
                          press: ()=>Navigator.pop(context)
                      ),
                      Spacer(),
                      CustomButtonText(
                        text: (AppLocalizations.of(context)!.sendRequire),
                        width: 153,
                        press: () {
                          postNotificationByTeacher(context,titleAnnoucement.text.trim(),contentAnnoucement.text.trim(),104,11,listClassId);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future postNotificationByTeacher(BuildContext context, String title, String content,int personId, int teacherId, List<int>listClassId) async{
    if (title == "") {
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa nhập tiêu đề"));
    }else if(content ==""){
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa nhập nội dung"));
    }else if(listClassId.isEmpty){
      WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildErrorSnackbar(context, "Bạn chưa chọn lớp học"));
    }
    else {
      BlocProvider.of<NotificationBloc>(context).add(
          PostNotificationByTeacherEvent(
              personId: personId,
              teacherId: teacherId,
              listClassId: listClassId,
              titleAnnoucement: title,
              contentAnnoucement: content));
    }
  }
}