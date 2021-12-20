import 'dart:convert';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ItemTeacherPupilListView extends StatefulWidget {
  final int index;
  final bool isSelected;
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

  const ItemTeacherPupilListView({
    Key? key,
    required this.index,
    required this.isSelected,
    this.position,
    this.role,
    required this.genderId,
    required this.avatar,
    this.pupilId,
    this.avtDefaultFemale,
    this.avtDefaultMale,
    this.pupilIds,
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
                  ColorConstants.secondaryColor2 : ColorConstants.primaryColor1,
                  width: 2,
                ),
              ),
                child:

                widget.genderId == 1  ?
                Padding(
                  padding: EdgeInsets.all(2),
                   child: CircleAvatar(
                      radius: 20,
                      backgroundImage:
                      AssetImage(
                          widget.avtDefaultMale!)

                ),
                 ):     Padding(
                  padding: EdgeInsets.all(2),
                   child: CircleAvatar(
                      radius: 20,
                      backgroundImage:
                      AssetImage(
                          widget.avtDefaultFemale!)

                ),
                 ),
            ):
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.genderId == 1 ?
                  ColorConstants.secondaryColor2 : ColorConstants.primaryColor1,
                  width: 2,
                ),
              ),
              child:     Padding(
                padding: EdgeInsets.all(2),
                child: CircleAvatar(
                radius: 20,
                backgroundImage: MemoryImage(bytesImage!)
                ),
              ),
            ),

            const SizedBox(width: 12),
            Text(widget.position == true ? widget.fullName + " \n("+(AppLocalizations.of(context)!.homeroomTeacher)+")": widget.fullName,
                style:TeacherStyle.contentStyle),
            const Spacer(),
            widget.pupilIds!.length == 0  ? SvgPicture.asset(
              'assets/icons/ic_arrow_right.svg',
              color: widget.isSelected ? Colors.white: ColorConstants.brandColor,)
                : (widget.pupilIds!.contains(widget.pupilId!) == true && widget.role == 1 ? SvgPicture.asset('assets/icons/ic_arrow_right.svg',
              color: widget.isSelected ? Colors.white: ColorConstants.brandColor,
            ):  widget.role == 1 ? SvgPicture.asset(
              'assets/icons/ic_arrow_right.svg',
              color: widget.isSelected ? Colors.white: ColorConstants.primaryColor2
            ):SvgPicture.asset(
              'assets/icons/ic_arrow_right.svg',
              color: widget.isSelected ? Colors.white: ColorConstants.brandColor,)
            )
          ],
        ),
      ),
    );
  }
}
