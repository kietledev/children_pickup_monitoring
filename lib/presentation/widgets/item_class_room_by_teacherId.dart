import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/class_room_model.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/staff_class_detail.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemClassRoomByTeacherId extends StatefulWidget{
  final List<ClassRoomModel> listClassRoom;
  final List<StaffClassDetail> listStaffClassDetail;
  final String title;
  final bool enabled;
  final ValueChanged<List<int>> onSelect;
  ItemClassRoomByTeacherId({
    required this.listClassRoom,
    required this.title,
    required this.enabled,
    required this.listStaffClassDetail,
    required this.onSelect
  });

  @override
  State<StatefulWidget> createState() =>_ItemClassRoomByTeacherId();
}
class _ItemClassRoomByTeacherId extends State<ItemClassRoomByTeacherId>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24,),
        Text(
            "${widget.title}",
            style:widget.enabled
                ?EditProfileStyle.titleStyleEditTrue
                :EditProfileStyle.titleStyleEditFalse
        ),
        SizedBox(height: 6,),
        (widget.enabled) ? DropdownSelectedClassroomByTeacher(
          dropdownTitleTileText: 'Lớp nhận thông báo',
          items: widget.listClassRoom,
          listStaffClassDetail: widget.listStaffClassDetail,
          onSelect: (value) {
           widget.onSelect(value);
          },
        )
                         :  Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 9),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.listStaffClassDetail.length,
                itemBuilder: (context,index){
                  return Center(
                      child:Padding(
                        padding: EdgeInsets.only(left: 3),
                        child:  Text(widget.listStaffClassDetail[index].className! + ",",style: TextStyle(color: ColorConstants.neutralColor1),),
                      )
                  );
                }
            ),
          ),
        )

      ],
    );
  }
}