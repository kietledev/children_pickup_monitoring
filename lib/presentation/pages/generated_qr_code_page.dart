import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';

class GeneratedQRCodePage extends StatelessWidget {
  const GeneratedQRCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      injector<PupilByParentBloc>()..add(const FetchPupilByParent(parentId: 2)),
      child:  Scaffold(
        appBar:  WidgetAppBar(
          title: TitlesConstants.generated_qr,
          menuItem: [itemButtonRightAppBar(context)],
          hideBack:true,
          actionBack: () {
            Navigator.pop(context);
          },
        ),

        body: GeneratedQRCodeBody(),
      ),
    );
  }

  Widget itemButtonRightAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: IconButton(
        icon: SvgPicture.asset('assets/icons/ic_create_qrcode.svg'),
        onPressed: () {
          Navigator.pushNamed(context, RouteConstants.createQCode);
          // Navigator.popUntil(context, ModalRoute.withName('/home_screen'));
        },
      ),
    );
  }
}

class GeneratedQRCodeBody extends StatefulWidget {
  const GeneratedQRCodeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<GeneratedQRCodeBody> createState() => _GeneratedQRCodeBodyState();
}

class _GeneratedQRCodeBodyState extends State<GeneratedQRCodeBody> {
  int _onSelected = -1;
  _getCard(int index){
    if(index == _onSelected){
      return PickUpCard( pickUpGenerated:null, checkShow: 1,);
    }else{
      return null;
    }


  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PupilByParentBloc, PupilByParentState>(builder: (context, state) {
      if (state is FetchPupilByParentSuccessState) {
        EasyLoading.dismiss();
        final List<Pupil> pupils = state.pupils!;
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_body_a.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(children: <Widget>[
              ScrollConfiguration(
                behavior: MyBehavior(),
                child: Expanded(
                  child: ListView.builder(

                    // itemCount: listContentDetail.length,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        var status = '';
                        // if (listData[index].STATUS == 0) {
                        //   status = ' (Đang chờ đón)';
                        // } else if (listData[index].STATUS == 1) {
                        //   status = ' (Đã hủy)';
                        // } else {
                        //   status = ' (Đã đón)';
                        // }
                        return InkWell(
                          onTap: () {
                            _onSelected = index;
                            setState(() {
                              // if (checkSelect.contains(index) == true) {
                              //   _firstPress = true;
                              //   _toggle = -1;
                              //   checkSelect = [];
                              // } else {
                              //   _firstPress = false;
                              //   //
                              //   _toggle = -1;
                              //   checkSelect = [];
                              //   checkSelect.add(index);
                              // }
                              // _toggle = index;
                              // if (_firstPress) {
                              //   _firstPress = false;
                              // } else {
                              //   _firstPress = true;
                              // }
                            });
                          },
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Container(
                                // width: 360,
                                height: 40,
                                margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFF3F5FF).withOpacity(1),
                                      spreadRadius: 3,
                                      blurRadius: 4,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Padding(
                                          padding: new EdgeInsets.only(left: 12),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                               "1234"+" (Đang chờ đón)",
                                                  textAlign: TextAlign.center,
                                                  // style: snapshot.data![index].STATUS == 0? TextStyle(
                                                  //     fontSize: 14,
                                                  //     fontWeight: FontWeight.w600,
                                                  //     color: _toggle != null && _toggle == index
                                                  //         ? brandColor
                                                  //         : SearchIconColor,
                                                  //     // color: SearchIconColor,
                                                  //     fontFamily: font):
                                                  // TextStyle(
                                                  //   fontSize: 14,
                                                  //   fontWeight: FontWeight.w600,
                                                  //   color: snapshot.data![index].STATUS == 1
                                                  //       ? Colors.black26
                                                  //       : Colors.blueAccent,
                                                  //   // color: SearchIconColor,
                                                  //   fontFamily: font,
                                                  // ),
                                                  ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          onPressed: () {
                                            _onSelected = index;
                                            setState(() {
                                              // if (checkSelect.contains(index) == true) {
                                              //   checkSelect = [];
                                              // } else {
                                              //   checkSelect = [];
                                              //   checkSelect.add(index);
                                              // }
                                              // _toggle = index;
                                              // if (_firstPress) {
                                              //   _firstPress = false;
                                              // } else {
                                              //   _firstPress = true;
                                              // }
                                            });
                                          },
                                            icon:SvgPicture.asset(
                                              'assets/icons/ic_dropdown_on.svg',
                                              color: ColorConstants.brandColor,
                                            )
                                          // icon: (_toggle == index &&
                                          //     _firstPress == true)
                                          //     ? SvgPicture.asset(
                                          //   'assets/icons/ic_dropdown_on.svg',
                                          //   color: brandColor,
                                          // )
                                          //     : SvgPicture.asset(
                                          //   'assets/icons/ic_dropdown_off.svg',
                                          //   color: brandColor,
                                          // ),
                                        )),
                                  ],
                                ),
                              ),
                              Center(
                                child: _getCard(index),
                              ),
                            ]),
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: 24,
              )
            ]),
          ),
        );
      } else if (state is FetchTeachersFailureState) {
        EasyLoading.dismiss();
        return const SizedBox.shrink();
      } else {
        EasyLoading.show();
        return const SizedBox.shrink();
      }
    });
  }

}
