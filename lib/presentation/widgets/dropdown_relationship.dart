import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DropdownRelationship extends StatefulWidget{
  List<RelationshipTypeModel> listRelationship;
  int? relationshipTypeId;
  String title;
  Function(int value,int index)? returnRelationShip;
  DropdownRelationship({
    required this.listRelationship,
    this.relationshipTypeId,
    required this.title,
    required this.returnRelationShip,
  });
  @override
  State<StatefulWidget> createState() => _DropdownRelationship();
}
class _DropdownRelationship extends State<DropdownRelationship>{
  final shadowtextfield = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.15),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h,),
        Text(widget.title, style: EditProfileStyle.titleStyleEditTrue),
        SizedBox(height: 6.h,),
        Container(
          height: 42,
          margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
          decoration: shadowtextfield,
          child: CustomDropdown<int>(
            child: (widget.relationshipTypeId == null)
                ? Text('chọn mối quan hệ', style: EditProfileStyle.contentStyle,)
                : Text('${widget.relationshipTypeId}', style: EditProfileStyle.contentStyle,),
            onChange:widget.returnRelationShip!,
            dropdownButtonStyle: DropdownButtonStyle(
              height: 40,
              backgroundColor: Colors.white,
            ),
            dropdownStyle: DropdownStyle(
              borderRadius: BorderRadius.circular(8),
              elevation: 6,
            ),
            items: widget.listRelationship
                .asMap()
                .entries
                .map(
                  (item) => DropdownItem<int>(
                    value: item.key + 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Text(
                            item.value
                                .personToPersonPersonalRelationshipTypeName!,
                            style: TextStyle(
                                color: ColorConstants.neutralColor1,
                                fontSize: 14,
                                fontFamily: FontsConstants.notoSans)),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}