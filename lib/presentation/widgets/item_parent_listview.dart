import 'dart:convert';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ItemParentListView extends StatefulWidget {
  final int index;
  final bool isSelected;
  final String avatar;
  final String fullName;
  final VoidCallback onSelect;
  final bool approved;
  final ParentModel parent;
  const ItemParentListView({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.avatar, required this.fullName,
    required this.onSelect,
    required this.approved,
    required this.parent
  }) : super(key: key);

  @override
  _ItemParentListViewState createState() => _ItemParentListViewState();
}

class _ItemParentListViewState extends State<ItemParentListView> {
  @override
  Widget build(BuildContext context) {
    final titleColor =
    widget.isSelected ? Colors.white : ColorConstants.neutralColor1;
    final bgColor =
    widget.isSelected ? ColorConstants.brandColor : Colors.white;
    final iconColor =
    widget.isSelected ? Colors.white : ColorConstants.brandColor;
    return GestureDetector(
      onTap: (){
        widget.onSelect;
        Navigator.pushNamed(context, RouteConstants.parentDetails,arguments: widget.parent);
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.fromLTRB(24, 12, 24, 0),
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
                   (widget.approved)
                      ? Text((AppLocalizations.of(context)!.confirm),style:Utils.setStyle(color: ColorConstants.secondaryColor4,size: 12),)
                      : Text((AppLocalizations.of(context)!.notVerified),style:Utils.setStyle(color: ColorConstants.neutralColor2,size: 12))
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
