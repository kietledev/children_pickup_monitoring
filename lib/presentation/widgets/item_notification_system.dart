import 'dart:convert';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
class ItemNotificationSystem extends StatefulWidget {
  final int index;
  final BuildContext context;
  final SystemNotification item;
  const ItemNotificationSystem({
    Key? key,
    required this.index,
    required this.context,
    required this.item
  }) : super(key: key);

  @override
  _ItemNotificationSystem createState() => _ItemNotificationSystem();
}

class _ItemNotificationSystem extends State<ItemNotificationSystem> {
  late Duration timeReceived;
  @override
  void initState() {
  DateTime now = new DateTime.now();
  DateTime myDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(widget.item.dateTimeReceived!);
  timeReceived = now.difference(myDate);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final colorTitle = widget.item.isRead! ? ColorConstants.neutralColor2 : ColorConstants.secondaryColor2;
    return Container(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
            decoration: BoxDecoration(
                color: Color(0xFFF9F9FF),
                borderRadius: BorderRadius.all(Radius.circular(13))
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/ic_notification_qr.svg',color: ColorConstants.brandColor,),
                          Padding(
                            padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                            child: Text('${widget.item.title}',style: TextStyle(color:colorTitle,fontSize: 14,fontFamily: FontsConstants.notoSans),),
                          )
                        ],
                      ),
                      Spacer(),
                      Text("${_formateDuration(timeReceived)}",style: TextStyle(color: ColorConstants.brandColor,fontFamily: FontsConstants.notoSans,fontSize: 12),)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("- ${widget.item.getFullNamePupil1()}",style: TextStyle(color: ColorConstants.neutralColor1,fontFamily: FontsConstants.notoSans,fontSize: 12,fontWeight: FontWeight.bold),),
                            (widget.item.pupilId2 == -1)
                                ? SizedBox.shrink()
                                :Text("- ${widget.item.getFullNamePupil2()}",style: TextStyle(color: ColorConstants.neutralColor1,fontFamily: FontsConstants.notoSans,fontSize: 12,fontWeight: FontWeight.bold),),
                            (widget.item.pupilId3 == -1)
                                ? SizedBox.shrink()
                                : Text("- ${widget.item.getFullNamePupil3()}",style: TextStyle(color: ColorConstants.neutralColor1,fontFamily: FontsConstants.notoSans,fontSize: 12,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Spacer(),
                        Text("${widget.item.content}",style: TextStyle(fontSize: 12,color: ColorConstants.neutralColor2,fontFamily: FontsConstants.notoSans),)
                      ],
                    ),
                  )
                ],
              ),
            ),

          ),
        ));
  }
  String _formateDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}H${twoDigitMinutes}m ago";
  }
}
