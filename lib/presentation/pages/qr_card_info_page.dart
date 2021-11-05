import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/constants/text_constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class QRCardInfomationPage extends StatelessWidget {
  const QRCardInfomationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final qrCart = ModalRoute.of(context)!.settings.arguments as PickUpRequest;

    return Scaffold(
      appBar:  WidgetAppBar(
        hideBack: true,
        title: TitlesConstants.details,
        menuItem: [],
        actionBack: () {
          Navigator.pop(context);
        },
      ),
      body: QRCardInfomationBody(
        // qrCart: qrCart,
      ),
    );
  }
}

class QRCardInfomationBody extends StatelessWidget {
  QRCardInfomationBody({
    Key? key,
    // required this.qrCart,
  }) : super(key: key);

  // final PickUpRequest qrCart;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_body_a.png'),
              fit: BoxFit.fill),
        ),
        child: new SingleChildScrollView(
          child: Container(
            margin:const EdgeInsets.all(24.0),
            child: Column(
                children: [
                  PickUpCard(),
                  Container(

                    height: 265,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(222, 223, 225, 0.5),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:  const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text('Thông tin người đón',
                            style: QRCodeStyle.contentStyle8,),
                          Container(
                            child: CircleAvatar(
                              radius: 100,
                              backgroundImage:
                              AssetImage("assets/images/img_avt_test.png"),
                            ),
                            height: 112,
                            width: 112,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(21, 12, 21, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text('Họ và tên người đón',
                                          style: QRCodeStyle.contentStyle9,),
                                        SizedBox(height: 6,),
                                        Text("Trần Phú Nhuận",
                                          style: QRCodeStyle.contentStyle3,),
                                        SizedBox(height: 6,),
                                        Text('Di động',
                                          style: QRCodeStyle.contentStyle9,),
                                        SizedBox(height: 6,),
                                        Text("0989777777",
                                          style: QRCodeStyle.contentStyle3,),
                                      ],
                                    ),
                                  ),
                                  flex: 1,
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Mối quan hệ với bé',
                                        style: QRCodeStyle.contentStyle9,),
                                      SizedBox(height: 6,),
                                      Text(
                                        "Chú", style: QRCodeStyle.contentStyle3,),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]

            ),
          ),
        ),
      ),
    );
  }
}