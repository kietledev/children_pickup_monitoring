import 'dart:convert';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemPupilListView extends StatefulWidget {
  final bool isSelected;
  final String avatar;
  final String fullName;
  final String className;
  final VoidCallback onSelect;

  const ItemPupilListView({
    Key? key,
    required this.isSelected,
    required this.avatar, required this.fullName,
    required this.onSelect,
    required this.className,
  }) : super(key: key);

  @override
  _ItemPupilListViewState createState() => _ItemPupilListViewState();
}

class _ItemPupilListViewState extends State<ItemPupilListView> {
  @override
  Widget build(BuildContext context) {
    final titleColor =
    widget.isSelected ? ColorConstants.neutralColor1 : ColorConstants.neutralColor1;
    final bgColor =
    widget.isSelected ? ColorConstants.white : Colors.white;
    final iconColor =
    widget.isSelected ? Colors.white : ColorConstants.brandColor;
    return GestureDetector(
      onTap: widget.onSelect,
      child: Container(
        height: 50,
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFF3F5FF).withOpacity(1),
              spreadRadius: 3,
              blurRadius: 4,
              offset: Offset(
                  0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            // SvgPicture.asset(widget.item.avatarPicture!),
            SizedBox(
              width: 36,
              height: 36,
              child: CircleAvatar(
                  radius: 32,
                  backgroundImage:(widget.avatar != "")
                      ? MemoryImage(base64.decode(widget.avatar))
                      : AssetImage("assets/images/img_avatar_null.png") as ImageProvider
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.fullName, style: Utils.setStyle(color: titleColor, weight: FontWeight.w600,size: 14)),
                Text(widget.className,style:Utils.setStyle(color: ColorConstants.neutralColor2,size: 10,fontFamily: FontsConstants.notoSans),)

              ],
            ),
            const Spacer(),
           Padding(
               padding: EdgeInsets.only(right: 5),
             child: (widget.isSelected)
                 ? Icon(Icons.check,color: ColorConstants.brandColor,)
                 : null,
           )
          ],
        ),
      ),
    );
  }
}
