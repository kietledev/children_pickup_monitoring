import 'dart:convert';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ItemAttencanceListView extends StatefulWidget{
  final int index;
  final bool isSelected;
  final String pupilToPupilStatusRelationshipTypeName;
  final int? pupilToPupilStatusRelationshipTypeId;
  final bool? position;
  final int genderId;
  final String avatar;
  final int? role;
  final String fullName;
  final String? avtDefaultMale;
  final String? avtDefaultFemale;
  final int? pupilId;
  final List<int>? pupilIds;
  final VoidCallback onSelect;

  const ItemAttencanceListView({
    Key? key,
    required this.index,
    required this.isSelected,
    this.position,
    this.role,
    required this.genderId,
    required this.avatar,
    this.pupilToPupilStatusRelationshipTypeId,
    required this.pupilToPupilStatusRelationshipTypeName,
    this.pupilId,
    this.avtDefaultFemale,
    this.avtDefaultMale,
    this.pupilIds,
    required this.fullName,
    required this.onSelect,
  }) : super(key: key);

  @override
  _ItemAttencanceListView createState() => _ItemAttencanceListView();

}
class _ItemAttencanceListView extends State<ItemAttencanceListView>{
  bool isSwitched = true;
  var textValue = 'Switch is OFF';
  String status ='';
  @override
  void initState() {
    setStatus();
    super.initState();

  }
  void setStatus(){
    status = widget.pupilToPupilStatusRelationshipTypeName;
    if(widget.pupilToPupilStatusRelationshipTypeId == 1){
      isSwitched = true;
    }else{
      isSwitched = false;
    }
  }
  void toggleSwitch(bool value) {

    print(value);
    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        status = AppLocalizations.of(context)!.present;
      });
      print('Switch Button is ON'+ widget.index.toString());
    }
    else
    {
      setState(() {
        isSwitched = false;
        status = AppLocalizations.of(context)!.offStatus;
      });
      print('Switch Button is OFF');
    }
  }
  @override
  Widget build(BuildContext context) {
    // String status = widget.pupilToPupilStatusRelationshipTypeName;
    final titleColor =
    widget.isSelected ? Colors.white : ColorConstants.neutralColor1;
    final bgColor =
    widget.isSelected ? ColorConstants.brandColor : Colors.white;
    Uint8List? bytesImage;
    if(widget.avatar == ""){
      bytesImage = null;
    }else{
      bytesImage = base64.decode('${widget.avatar}');
    }

    return GestureDetector(
      onTap: widget.onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [BoxShadow(color: Color(0xFFF3F5FF).withOpacity(1), spreadRadius: 3, blurRadius: 4, offset: Offset(0, 3),
          ),
          ],
        ),
        child: Row(
          children: [
            // SvgPicture.asset(widget.item.avatarPicture!),
            widget.avatar =='' ?
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.genderId == 1 ?
                  ColorConstants.secondaryColor3 : ColorConstants.primaryColor1,
                  width: 1.5,
                ),
              ),
              child: widget.genderId == 1  ?
              Padding(
                padding: EdgeInsets.all(2),
                child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                    AssetImage(
                        widget.avtDefaultMale!)

                ),
              ):
              Padding(
                padding: EdgeInsets.all(2),
              child:CircleAvatar(
                  radius: 20,
                  backgroundImage:
                  AssetImage(
                      widget.avtDefaultFemale!)

              ),
            )):
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.genderId == 1 ?
                  ColorConstants.secondaryColor3 : ColorConstants.primaryColor1,
                  width: 1.5,
                ),
              ),
              child:    Padding(
                padding: EdgeInsets.all(2),
                child: CircleAvatar(
                    radius: 20,
                    backgroundImage: MemoryImage(bytesImage!)
                ),
              ),
            ),
                const SizedBox(width: 12),
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.position == true ? widget.fullName + " \n("+(AppLocalizations.of(context)!.homeroomTeacher)+")": widget.fullName,
              style: AttendanceStyle.contentStyle),
          Text(status,
              style: status == AppLocalizations.of(context)!.present ? AttendanceStyle.contentStyle1: AttendanceStyle.contentStyle2),
          ]),

            const Spacer(),
            Transform.scale(
                scale: 1,
                child: Switch(

                  value: isSwitched,
                  onChanged: toggleSwitch,
                  //     (value){
                  //   print(value);
                  //   setState(() {
                  //     isSwitched = value;
                  //   });
                  // },
                  activeColor: ColorConstants.white,
                  activeTrackColor: ColorConstants.Secondary2,
                  inactiveThumbColor: ColorConstants.white,
                  inactiveTrackColor: ColorConstants.Pattette2,
                )
            ),
          ],
        ),
      ),
    );
  }

}