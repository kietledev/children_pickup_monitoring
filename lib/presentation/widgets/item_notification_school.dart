
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/utils.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:flutter/material.dart';
class ItemNotificationSchool extends StatefulWidget {
  final int index;
  final BuildContext context;
  final SchoolNotification item;
  const ItemNotificationSchool({
    Key? key,
    required this.index,
    required this.context,
    required this.item,
  }) : super(key: key);

  @override
  _ItemNotificationSchool createState() => _ItemNotificationSchool();
}

class _ItemNotificationSchool extends State<ItemNotificationSchool> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, RouteConstants.notificationDetail,arguments: widget.item),
      child: Container(
        margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFF3F5FF).withOpacity(1),
              spreadRadius: 3,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${widget.item.title}",
                  style: TextStyle(
                    color: ColorConstants.neutralColor1,
                    fontFamily: FontsConstants.notoSans,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  "${Utils.formatDateTime('${widget.item.dateTimeReceived ?? ""}')}",
                  style: TextStyle(
                    color: Color(0xFF7DB2AC),
                    fontFamily: FontsConstants.notoSans,
                    fontWeight: FontWeight.w400,
                    fontSize: 8,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 8),
                child: Text(
                    '${widget.item.content}',
                    style: TextStyle(
                      color: ColorConstants.neutralColor2,
                      fontFamily: FontsConstants.notoSans,
                      fontWeight: FontWeight.w400,
                      fontSize:10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              )
            ],
          ),
        ),
      ),
    );
  }
}
