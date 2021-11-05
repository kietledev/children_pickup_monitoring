import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/common/helpers/my_behavior.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class PickUpCard extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _PickUpCardBody();
  }
}

class _PickUpCardBody extends State<PickUpCard> {
  GlobalKey previewContainer = new GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/bg_card_pickup1_1.png"),
                    fit: BoxFit.fill)),
            child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 32, 0, 0,),
                    child: Text(
                      "Thẻ Đón Trẻ",
                      style:QRCodeStyle.contentStyle8,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 24),
                    child: Text(
                      // "",
                    "1234",
                      style: QRCodeStyle.contentStyle7,
                    ),
                  ),
                ]
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 24, right: 24),
            margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/bg_card_pickup1_2.png"),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child:
                        Align(
                          child: ItemPupilQRCard(),
                        ),
                      )
                    ]),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thời gian',
                              style: QRCodeStyle.contentStyle9,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                         "10:00",
                              style: QRCodeStyle.contentStyle3,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "12-12-2021",
                              style: QRCodeStyle.contentStyle3 ,
                            ),
                          ],
                        ),
                      ),

                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Điểm đón',
                              style:  QRCodeStyle.contentStyle9,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Cổng trường",
                              style:  QRCodeStyle.contentStyle3,
                            ),
                          ],
                        ),
                      ),
                      flex: 0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(

                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Người đón',
                              style:  QRCodeStyle.contentStyle9,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                             "Trần Phú Nhuận" +' - ' + "Chú",
                              style:  QRCodeStyle.contentStyle3,
                            ),
                          ],
                        ),
                      ),
                      flex: 1,
                    ),

                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Đại chỉ trường',
                      style:  QRCodeStyle.contentStyle9,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "123 nguyễn văn cừ, ninh kiều, cần thơ",
                        style:  QRCodeStyle.contentStyle3,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),

                  ],
                )

              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/bg_card_pickup1_3.png"),
                    fit: BoxFit.fill)),
            alignment: Alignment.bottomCenter,
            child:
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  new SizedBox(
                      height: 102,
                      width: 102,
                      child:Text("mã QRR")),
                  SizedBox(
                    height: 12,
                  ),

                ]),
            // QrImage(
            //     data:
            //         "Trần Phú Nhuận 1\n Lớp Mầm non, 01/03/1998"),
          ),
          SizedBox(
            height: 16,
          ),
          Center(
            child:  SizedBox(
              width: 130,
              height: 40,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(width: 1, color: Colors.deepOrange),
                ),
                onPressed: () {
                  _showAlert(context);
                  //HUE
                },
                // color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Hủy thẻ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.clear,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
   
  }
  void _showAlert(BuildContext context) {
    String nameChild = '';
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            height: 30,
            child: Column(
              children: [
                Text(
                  'Bạn muốn hủy thẻ đã tạo?',
                  style:  QRCodeStyle.contentStyle,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(children: [
              Expanded(
                flex: 1,
                child: CustomButtonBorder(
                    text: 'Hủy',
                    press: () {
                      Navigator.pop(context);
                    },
                    width: 117),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 1,
                child: CustomButtonText(
                    text: 'Tiếp tục',
                    press: () {


                    },
                    width: 117),
              ),
            ])
          ],
        ));
  }
}
