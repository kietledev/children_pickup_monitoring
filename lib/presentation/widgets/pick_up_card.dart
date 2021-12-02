import 'dart:convert';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/common/helpers/my_behavior.dart';
import 'package:children_pickup_monitoring/data/datasources/local/app_database.dart';
import 'package:children_pickup_monitoring/data/models/user_model.dart';
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
import 'package:permission_handler/permission_handler.dart';

class PickUpCard extends StatefulWidget {
  late PickUpGenerated? pickUpGenerated;
  late VoidCallback onPress;
  late int? checkShow;
  late PickUpBloc? bloc;
  PickUpCard({
    Key? key,
    this.pickUpGenerated,
    this.checkShow,
    this.bloc,
    required this.onPress,
  }) : super(key: key);

  @override
  _PickUpCardState createState() => _PickUpCardState();
}

class _PickUpCardState extends State<PickUpCard> {
  GlobalKey previewContainer = new GlobalKey();
  UserModel? userModel;
  late final AppDatabase appDatabase;
  int status = -1;
  int count = 0;
  String cartId = '';
  @override
  void initState() {
    super.initState();
    _requestPermission();

    // bloc = BlocProvider.of<PickUpBloc>(context);
  }


  @override
  Widget build(BuildContext context) {
    Uint8List imageQR = base64.decode('');
    if (widget.pickUpGenerated!.stringQrcode != null){
      imageQR = base64.decode(widget.pickUpGenerated!.stringQrcode!);
    }
    // TODO: implement build
    return  Container(
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
                        widget.pickUpGenerated!.cardId!,
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
                              child: ItemPupilQRCard(pupils:widget.pickUpGenerated!.pupils!),
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
                                  widget.pickUpGenerated!.timePickUp!,
                                  style: QRCodeStyle.contentStyle3,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  widget.pickUpGenerated!.datePickUp!,
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
                                  widget.pickUpGenerated!.placePickUp!,
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
                                  widget.pickUpGenerated!.parentPickUp!.getFullName() +' - ' +  widget.pickUpGenerated!.parentPickUp!.personToPersonPersonalRelationshipTypeName!,
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
                            widget.pickUpGenerated!.addressSchool!,
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
                          child:Image.memory(imageQR)),
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
              widget.checkShow == 1 &&  widget.pickUpGenerated!.status == 0 ?
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
              ):
              SizedBox(
                height: 24,
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
                    press: widget.onPress,

                    width: 117),
              ),
            ])
          ],
        ));
  }
  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    final info = statuses[Permission.storage].toString();
  }
}
