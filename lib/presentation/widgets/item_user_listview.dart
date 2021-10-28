import 'dart:convert';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemUserListView extends StatefulWidget {
  final int index;
  final bool isSelected;
  final String avatar;
  final String fullName;
  final VoidCallback onSelect;
  final String phoneNumber1;
  final UserByPersonModel user;
  const ItemUserListView({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.avatar, required this.fullName,
    required this.onSelect,
    required this.phoneNumber1,
    required this.user
  }) : super(key: key);

  @override
  _ItemUserListViewState createState() => _ItemUserListViewState();
}

class _ItemUserListViewState extends State<ItemUserListView> {
  @override
  Widget build(BuildContext context) {
    final titleColor =
    widget.isSelected ? Colors.white : ColorConstants.neutralColor1;
    final bgColor =
    widget.isSelected ? ColorConstants.brandColor : Colors.white;
    final iconColor =
    widget.isSelected ? Colors.white : ColorConstants.brandColor;
    return GestureDetector(
      onTap: widget.onSelect,
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(top: 12),
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
                Text(widget.phoneNumber1,style:Utils.setStyle(color: ColorConstants.secondaryColor4,size: 12),)

              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/ic_arrow_right.svg',
              color: iconColor,
            )
          ],
        ),
      ),
    );
  }
}
