import 'dart:convert';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemTeacherPupilListView extends StatefulWidget {
  final int index;
  final bool isSelected;
  final bool? position;
  final int genderId;
  final String avatar;
  final String fullName;
  final String? avtDefaultMale;
  final String? avtDefaultFemale;
  final VoidCallback onSelect;

  const ItemTeacherPupilListView({
    Key? key,
    required this.index,
    required this.isSelected,
    this.position,
    required this.genderId,
    required this.avatar,
    this.avtDefaultFemale,
    this.avtDefaultMale,
    required this.fullName,
    required this.onSelect,
  }) : super(key: key);

  @override
  _ItemTeacherPupilListViewState createState() => _ItemTeacherPupilListViewState();
}

class _ItemTeacherPupilListViewState extends State<ItemTeacherPupilListView> {
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(12.0)),
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
                 CircleAvatar(
                    radius: 20,
                    backgroundImage:
                    AssetImage(
                        widget.avtDefaultMale!)

                ): CircleAvatar(
                    radius: 20,
                    backgroundImage:
                    AssetImage(
                        widget.avtDefaultFemale!)

                ),
            ):
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.genderId == 1 ?
                  ColorConstants.secondaryColor3 : ColorConstants.primaryColor1,
                  width: 1.5,
                ),
              ),
              child: CircleAvatar(
              radius: 20,
              backgroundImage: MemoryImage(bytesImage!)
              ),
            ),
            const SizedBox(width: 12),
            Text(widget.position == true ? widget.fullName + " ("+StringConstatns.homeroomTeacher+")": widget.fullName,
                style: Utils.setStyle(
                    color: titleColor, weight: FontWeight.w600)),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/ic_arrow_right.svg',
              color: ColorConstants.brandColor,
            )
          ],
        ),
      ),
    );
  }
}
