import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemTitleDateListView extends StatefulWidget {
  final int index;
  final bool isSelected;
  final String image;
  final String title;
  final String date;
  final VoidCallback onSelect;

  const ItemTitleDateListView({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.image,
    required this.title,
    required this.date,
    required this.onSelect,
  }) : super(key: key);

  @override
  _ItemTitleDateListViewState createState() => _ItemTitleDateListViewState();
}

class _ItemTitleDateListViewState extends State<ItemTitleDateListView> {
  @override
  Widget build(BuildContext context) {
    final titleColor =
    widget.isSelected ? Colors.white : ColorConstants.neutralColor1;
    final bgColor =
    widget.isSelected ? ColorConstants.brandColor : Colors.white;
    return GestureDetector(
      onTap: widget.onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/images/img_avatar.png")),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                style: Utils.setStyle(
                    color: titleColor, weight: FontWeight.w600)),
                Text(Utils.formatDateTime(widget.date),
                    style:AchievementsStyle.contentStyle2),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/ic_arrow_right.svg',
              color: widget.isSelected ? Colors.white: ColorConstants.brandColor,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),

    );
  }
}
