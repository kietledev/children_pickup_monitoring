
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class ItemPupilCheckBox extends StatefulWidget {
  final PupilCheck pupil;


  const ItemPupilCheckBox({
    Key? key,
    required this.pupil,
  }) : super(key: key);

  @override
  _ItemPupilCheckBoxState createState() => _ItemPupilCheckBoxState();
}

class _ItemPupilCheckBoxState extends State<ItemPupilCheckBox> {
  bool isChecked = false;
  int checkCount = 0;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.orange;
  }
  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: widget.pupil.isCheck,
              onChanged: (bool? value) {
                setState(() {
                  widget.pupil.isCheck = value!;
                  checkCount = (checkCount + 1);
                });
              },
            ),

            Expanded(
                flex: 1,
                child: new Text(widget.pupil.pupil!.getFullName()+ " ("+widget.pupil.pupil!.personToPersonPersonalRelationshipTypeName!+")",style: QRCodeStyle.contentStyle4,)),
            Expanded(flex: 0, child: new Text(widget.pupil.pupil!.className!,style: QRCodeStyle.contentStyle4,)),
          ],
        ));
  }
}
