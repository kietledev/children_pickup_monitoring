import 'dart:typed_data';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/constants/text_constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/pickup/pickup_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;
import 'package:wc_flutter_share/wc_flutter_share.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class QRCardInfomationPage extends StatelessWidget {
  const QRCardInfomationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qrCart = ModalRoute.of(context)!.settings.arguments as PickUpGenerated;
    int count = 0;
    return Scaffold(
      appBar:  WidgetAppBar(
        hideBack: true,
        title: (AppLocalizations.of(context)!.detail),
        menuItem: [],
        actionBack: () {
          Navigator.of(context).popUntil((context) => count++ >= 3);

        },
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<PickUpBloc>(
              create: (BuildContext context) => injector<PickUpBloc>()
          ),
        ],
        child: Scaffold(
          body: QRCardInfomationBody(
            qrCart: qrCart,
          ),
        ),
      ),
      // body: QRCardInfomationBody(
      //   qrCart: qrCart,
      // ),
    );
  }
}

class QRCardInfomationBody extends StatelessWidget {
  QRCardInfomationBody({
    Key? key,
    required this.qrCart,
  }) : super(key: key);

  final PickUpGenerated qrCart;
  GlobalKey previewContainer = new GlobalKey();
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
                RepaintBoundary(
                  key: previewContainer,
                  child: Column(
                      children: [
                        PickUpCard(pickUpGenerated: qrCart, checkShow: 0, bloc: BlocProvider.of<PickUpBloc>(context),onPress: (){}),
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
                                Text((AppLocalizations.of(context)!.pupilPickupInformation),
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
                                              Text((AppLocalizations.of(context)!.fullName),
                                                style: QRCodeStyle.contentStyle9,),
                                              SizedBox(height: 6,),
                                              Text(qrCart.parentPickUp!.getFullName(),
                                                style: QRCodeStyle.contentStyle3,),
                                              SizedBox(height: 6,),
                                              Text((AppLocalizations.of(context)!.phone),
                                                style: QRCodeStyle.contentStyle9,),
                                              SizedBox(height: 6,),
                                              Text(qrCart.parentPickUp!.personDetail!.currentPhoneNumber1!,
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
                                            Text((AppLocalizations.of(context)!.relationshipWithPupil),
                                              style: QRCodeStyle.contentStyle9,),
                                            SizedBox(height: 6,),
                                            Text(
                                              qrCart.parentPickUp!.personToPersonPersonalRelationshipTypeName!, style: QRCodeStyle.contentStyle3,),

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
                      ]),

                ),
                  SizedBox(height: 44,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonIconLeft(text: 'Lưu', press: (){_saveScreen();}, width: 143, icon: "assets/icons/ic_dowload.svg"),
                      SizedBox(width: 41,),
                      ButtonIconLeft(
                          text: 'Chia sẻ',
                          press: (){
                            _shareImage();
                          },
                          width: 143,
                          icon: "assets/icons/ic_share.svg")
                    ],
                  ),

                ]

            ),
          ),
        ),
      ),
    );
  }
  _saveScreen() async {
    RenderRepaintBoundary boundary = previewContainer.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
      await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
    }
  }
  void _shareImage() async {
    try {
      RenderRepaintBoundary boundary =
      previewContainer.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
      await WcFlutterShare.share(
          sharePopupTitle: 'share',
          fileName: 'share.png',
          mimeType: 'image/png',
          bytesOfFile: byteData!.buffer.asUint8List());
    } catch (e) {
      print('error: $e');
    }
  }
}