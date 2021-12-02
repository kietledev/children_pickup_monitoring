import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class ItemPupilQRCard extends StatefulWidget {
   final List<Pupil> pupils;

  const ItemPupilQRCard({
    Key? key,
    required this.pupils,
  }) : super(key: key);

  @override
  _ItemPupilQRCardState createState() => _ItemPupilQRCardState();
}

class _ItemPupilQRCardState extends State<ItemPupilQRCard> {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        padding: EdgeInsets.only(top: 24),

        // itemCount: widget.pupils.length,
        itemCount: widget.pupils.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              child: Column(children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        flex: 1, child: Text('Họ và Tên', style: QRCodeStyle.contentStyle9)),
                    Expanded(flex: 0, child: Text('Lớp', style: QRCodeStyle.contentStyle9)),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                            // widget.pupils[index].getFullName()!,
                            widget.pupils[index].personDetail!.getFullName(),
                            style: QRCodeStyle.contentStyle3),
                      ),
                      Expanded(
                          flex: 0,
                          // child: Text(widget.pupils[index].className!,
                          child: Text(widget.pupils[index].className!,
                              style: QRCodeStyle.contentStyle3)),
                    ]),
                SizedBox(
                  height: 12,
                ),
              ]));
        });
  }
}
