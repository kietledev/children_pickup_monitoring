import 'dart:convert';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemQuestionListView extends StatefulWidget {
  final int index;
  final bool isSelected;
  final String question;
  final VoidCallback onSelect;

  const ItemQuestionListView({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.question,
    required this.onSelect,
  }) : super(key: key);

  @override
  _ItemQuestionListViewState createState() => _ItemQuestionListViewState();
}

class _ItemQuestionListViewState extends State<ItemQuestionListView> {
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
        height: 40,
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
            Text(widget.question, style: Utils.setStyle(color: titleColor, weight: FontWeight.w600,size: 14)),
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
