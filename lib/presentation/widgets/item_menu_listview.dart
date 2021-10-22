import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemMenu {
  final int id;
  final String title;
  final String icon;
  final String route;

  ItemMenu(this.id, this.title, this.icon, this.route);
}

class ItemMenuListView extends StatefulWidget {
  final int index;
  final bool isSelected;
  final ItemMenu item;
  final VoidCallback onSelect;

  const ItemMenuListView({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.item,
    required this.onSelect,
  }) : super(key: key);

  @override
  _ItemMenuListViewState createState() => _ItemMenuListViewState();
}

class _ItemMenuListViewState extends State<ItemMenuListView> {
  @override
  Widget build(BuildContext context) {
    final titleColor =
        widget.isSelected ? Colors.white : ColorConstants.neutralColor1;
    final bgColor =
        widget.isSelected ? ColorConstants.brandColor : Colors.white;
    return GestureDetector(
      key: UniqueKey(),
      onTap: widget.onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          children: [
            SvgPicture.asset(widget.item.icon),
            const SizedBox(width: 24),
            Text(widget.item.title,
                style: Utils.setStyle(
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
