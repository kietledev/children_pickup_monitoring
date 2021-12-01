import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/notification/notification_bloc.dart';
import 'package:children_pickup_monitoring/presentation/pages/warning_page.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_NotificationPage();
}
class _NotificationPage extends State<NotificationPage>{
  bool isSystem = true;
  bool isSchool = false;
  NotificationModel? notificationModel;
  List<SchoolNotification> listSchoolNotification = [];
  List<SystemNotification> listSystemNotification = [];
  final Color active = Color(0xFFF7931A);
  final Color deactive = Color(0xFF797D88);
  int roleId = 2;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      notificationModel = ModalRoute.of(context)!.settings.arguments as NotificationModel?;
      setState(() {
        listSchoolNotification = notificationModel!.schoolNotification!;
        listSystemNotification = notificationModel!.systemNotification!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: WidgetAppBar(
       title: (AppLocalizations.of(context)!.notificationHome),
       actionBack: ()=>Navigator.pop(context),
       hideBack: true,
       menuItem: [
         (roleId == 2) ? itemRight(context) : SizedBox.shrink()
       ],
     ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_body_a.png'),
              fit: BoxFit.fill,
            ),
          ),
         child: Column(
           children: [
             Padding(
               padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
               child: buildHeaderTab(),
             ),
             Expanded(
                 child: ScrollConfiguration(
                   behavior: MyBehavior(),
                   child: Padding(
                     padding: EdgeInsets.only(bottom: 24),
                     child: Stack(
                       children: [
                         Visibility(
                             visible: isSystem,
                             child: (listSystemNotification.length == 0)
                                 ? WarningPage(type: 1,)
                                 : ListView.builder(
                                 itemCount: listSystemNotification.length,
                                 itemBuilder: (BuildContext context, int index){
                                   final item = listSystemNotification[index];
                                   return ItemNotificationSystem(
                                       index: index,
                                       context: context,
                                       item: item,
                                   );
                                 }
                             )
                         ),
                         Visibility(
                           visible: isSchool,
                           child: (listSchoolNotification.length == 0)
                               ? WarningPage(type: 1,)
                               : ListView.builder(
                               itemCount: listSchoolNotification.length,
                               itemBuilder: (BuildContext context, int index){
                                 final item = listSchoolNotification[index];
                                 return ItemNotificationSchool(
                                     index: index,
                                     context: context,
                                     item: item,
                                 );
                               }
                           ),
                         ),
                       ],
                     ),
                   ),
                 )
             )
           ],
         )
        )
   );
  }
  Widget buildHeaderTab() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 50,
          child: GestureDetector(
            onTap: () {
              setState(() {
                setState(() {
                  if (!isSystem) {
                    isSchool = isSystem;
                    isSystem = !isSystem;
                  }
                });
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_message.svg',
                    width: 12,
                    height: 12,
                    color: isSystem ? active : deactive,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Hệ thống',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: FontsConstants.notoSans,
                      fontWeight: FontWeight.w600,
                      color: isSystem ? active : deactive,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: SvgPicture.asset(
              'assets/icons/ic_line_message.svg',
              height: 24,
            )),
        Expanded(
          flex: 50,
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (!isSchool) {
                  isSystem = isSchool;
                  isSchool = !isSchool;
                }
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_notification_school.svg',
                    width: 12,
                    height: 12,
                    color: isSchool ? active : deactive,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Trường học',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: FontsConstants.notoSans,
                      fontWeight: FontWeight.w600,
                      color: isSchool ? active : deactive,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget itemRight(BuildContext context){
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context,RouteConstants.notificationAdd);
            //.then((value) => getPupilID().then((value) => context.read<ParentsBloc>().add(FetchParents(pupilId: value, relationshipTypeId: 0))));
      },
      child: SvgPicture.asset(
        'assets/icons/ic_add_16.svg',
        height: 16,
        width: 16,
      ),
    );
  }
}