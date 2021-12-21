import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ItemPickUpHistory extends StatefulWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;

  const ItemPickUpHistory({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  _ItemPickUpHistory createState() => _ItemPickUpHistory();
}

class _ItemPickUpHistory extends State<ItemPickUpHistory> {
  @override
  Widget build(BuildContext context) {
    final titleColor =
    widget.isSelected ? Colors.white : ColorConstants.neutralColor1;
    final bgColor = widget.isSelected ? ColorConstants.brandColor : Colors.white;
    final gradient = widget.isSelected ? kMenuGradienColor: kWhiteGradiendColor;
    return GestureDetector(
      key: UniqueKey(),
      onTap: widget.onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          gradient: gradient,
          color: bgColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [BoxShadow(color: Color(0xFFF3F5FF).withOpacity(1), spreadRadius: 3, blurRadius: 4, offset: Offset(0, 3),
          ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 24),
           Column(
             children: [
               Text("Ngày 28-06-2021",
                   style: Utils.setStyle(
                       color: ColorConstants.neutralColor1,
                       weight: FontWeight.w600,
                       fontFamily: FontsConstants.notoSans
                   )),
               SizedBox(height: 6,),
               Text("Trần Phú Nhuận",
                   style: Utils.setStyle(
                       color:ColorConstants.brandColor ,
                     fontFamily: FontsConstants.notoSans
                   )),
             ],
           ),
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
