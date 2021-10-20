import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemPersonListView extends StatefulWidget {
  final int index;
  final bool isSelected;
  final String avatar;
  final String fullName;
  final VoidCallback onSelect;

  const ItemPersonListView({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.avatar, required this.fullName,
    required this.onSelect, 
  }) : super(key: key);

  @override
  _ItemPersonListViewState createState() => _ItemPersonListViewState();
}

class _ItemPersonListViewState extends State<ItemPersonListView> {
  @override
  Widget build(BuildContext context) {
    final titleColor =
        widget.isSelected ? Colors.white : ColorConstants.neutralColor1;
    final bgColor =
        widget.isSelected ? ColorConstants.brandColor : Colors.white;
    return GestureDetector(
      onTap: widget.onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          children: [
            // SvgPicture.asset(widget.item.avatarPicture!),
            const SizedBox(
              width: 36,
              height: 36,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 32,
                backgroundImage: AssetImage("assets/images/img_avatar.png"),
              ),
            ),
            const SizedBox(width: 24),
            Text(widget.fullName,
                style: Utils.initTextStyle(
                    color: titleColor, weight: FontWeight.w600)),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/ic_arrow_right.svg',
              color: titleColor,
            )
          ],
        ),
      ),
    );
  }
}
