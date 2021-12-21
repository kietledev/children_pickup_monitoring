import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/datasources/local/app_database.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/pages/warning_page.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class GeneratedQRCodePage extends StatefulWidget {
  // const GeneratedQRCodePage({Key? key}) : super(key: key);
  @override
  State<GeneratedQRCodePage> createState() => _GeneratedQRCodeState();
}

class _GeneratedQRCodeState extends State<GeneratedQRCodePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
        create: (BuildContext context) => injector<PickUpBloc>(),
      child: GeneratedQRCodeBody(),
      );
  }
}

class GeneratedQRCodeBody extends StatefulWidget {
  // const GeneratedQRCodeBody({Key? key
  // }) : super(key: key);

  @override
  State<GeneratedQRCodeBody> createState() => _GeneratedQRCodeBodyState();
}

class _GeneratedQRCodeBodyState extends State<GeneratedQRCodeBody> {
  late final AppDatabase appDatabase;
  Future<List<PickUpGenerated>>? _listFuture;
  int _currentIndex = -1;
  int checkSelect = -1;
  UserModel? userModel;
  List<PickUpGenerated> pickUpGenerateds = [];

  @override
  void initState() {
    super.initState();
    $FloorAppDatabase
        .databaseBuilder('app_database.db')
        .build()
        .then((value) async {
      this.appDatabase = value;
      setState(() {
        _listFuture = getAllQRCode();
      });
    });
  }
  @override
void dispose() {
  super.dispose();
}
  Future<TablePickUpGenerated?> updateQRCode( int status, String cartId) async {
    return await appDatabase.appQRGeneratedDao.updateQRCode(status,cartId);
  }
  _deleteCard(int? requestId) async {
    userModel = await getUser();
    int userID = userModel!.userId;
    final Map<String, dynamic> body = <String, dynamic>{
      "status": 1,
      "USER_ID": userID
    };
    BlocProvider.of<PickUpBloc>(context).add(DeletePickUpRequestEvent(requestId: requestId!, body: body,roleId: 1));
  }
_getCard(int index, PickUpGenerated pickUpGenerated, int? requestID){
  if (checkSelect != -1) {
    if (index == checkSelect) {
      // TODO: implement build
      // return BlocProvider(
      //   create: (BuildContext context) => injector<PickUpBloc>(),
      //   child: PickUpCard(pickUpGenerated: pickUpGenerated, checkShow: 1,bloc:  BlocProvider.of<PickUpBloc>(context)),
      // );
      return PickUpCard(pickUpGenerated: pickUpGenerated, checkShow: 1,bloc:  BlocProvider.of<PickUpBloc>(context), onPress: () {setState(() {_deleteCard(requestID);});},);
    }
  }
}
void _onSelected(int index) {
  setState(() => _currentIndex = index);
}


Future<List<PickUpGenerated>> getAllQRCode( ) async{
  pickUpGenerateds = [];
  List<TablePickUpGenerated> qrCodeGenerateds = [];
  qrCodeGenerateds = await appDatabase.appQRGeneratedDao.getQRGenerateds();
  for (TablePickUpGenerated i in qrCodeGenerateds) {
    List<Pupil> pickupPupils = [];
    Parent pickupParent = new Parent();
    List<TablePupil?> tPupils = await appDatabase.appPupilDao.getPupilById(i.pupilId1!,i.pupilId2!, i.pupilId3!);
    for (TablePupil? m in tPupils) {
      PersonTable? person = (await appDatabase.appPersonDao.getPersonById(m!.personId!));
      Pupil pupil = new Pupil(pupilId: m.pupilId, classId: m.classId,className: m.className,personToPersonPersonalRelationshipTypeName: m.personToPersonPersonalRelationshipTypeName,
          personToPersonPersonalRelationshipTypeNameEn: m.personToPersonPersonalRelationshipTypeNameEn,currentPhoneNumber2Parent: m.currentPhoneNumber2Parent, currentPhoneNumber1Parent: m.currentPhoneNumber1Parent,
          currentFirstNameParent: m.currentFirstNameParent,currentMiddleNameParent: m.currentMiddleNameParent, currentLastNameParent: m.currentLastNameParent,personDetail: person);
      pickupPupils.add(pupil);
    }
    TableParent? tParent = await appDatabase.appParentDao.getParentById(i.parentId!);
    PersonTable? personParent = (await appDatabase.appPersonDao.getPersonById(tParent!.personId!)) ;
    pickupParent = new Parent(parentId:tParent.parentId, personToPersonPersonalRelationshipTypeName: tParent.personToPersonPersonalRelationshipTypeName,personToPersonPersonalRelationshipTypeNameEn: tParent.personToPersonPersonalRelationshipTypeNameEn,
        accountUser: tParent.accountUser, approvedDatetime: tParent.approvedDatetime, approvedByUserId: tParent.approvedByUserId, approved: tParent.approved, personDetail: personParent);
    PickUpGenerated pickupQR = new PickUpGenerated(pickupPupils, i.timePickUp, i.requestId, i.pupilId1, i.pupilId2, i.pupilId3, i.cardId, i.datePickUp, i.placePickUp,
        pickupParent, i.parentId, i.addressSchool, i.stringQrcode, i.status);
    pickUpGenerateds.add(pickupQR);
  }
  return pickUpGenerateds;
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WidgetAppBar(
          title: (AppLocalizations.of(context)!.generateQrCode),
          menuItem: [itemButtonRightAppBar(context)],
          hideBack: true,
          actionBack: () {
            Navigator.pop(context);
          },
        ),
        body: BlocConsumer<PickUpBloc, PickUpState>(
            bloc: BlocProvider.of<PickUpBloc>(context),
            listener: (context, state) {
              if (state is FetchPickUpLoadingState) {
                EasyLoading.show();
              } else {
                if (state is DeletePickUpSuccessState) {
                  EasyLoading.show();
                  updateQRCode(1, state.pickUpRequest!.idCard!);
                  Navigator.pop(context);
                    setState(() {
                      _listFuture = getAllQRCode();
                    });
                  EasyLoading.dismiss();
                } else if (state is PickUpFailureState) {
                  EasyLoading.dismiss();
                } else {
                  EasyLoading.show();
                }
              }
            },
            // buildWhen: (prevState, currState) {
            //   // return currState != prevState && currState.parents != null ||
            //   //     currState is FetchParentsSuccessState;
            // },
            builder: (context, state) {
              return new FutureBuilder<List<PickUpGenerated>>(
                  future: _listFuture,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return new Text('Chưa có mã đã tạo 1111!');
                      case ConnectionState.waiting:
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasError)
                          return new Text('Chưa có mã đã tạo2222!');
                        else if( snapshot.data!.length != 0) {
                          pickUpGenerateds = snapshot.data!;
                        }else{
                          return WarningPage(type:1,);
                        }
                        break;
                      default:
                        return Text("Error");
                    }
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
                                  itemCount: pickUpGenerateds.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var status = '';
                                    if (pickUpGenerateds[index].status == 0) {
                                      status = ' ('+(AppLocalizations.of(context)!.waitting)+')';
                                    } else if (pickUpGenerateds[index].status == 1) {
                                      status = ' ('+(AppLocalizations.of(context)!.cancelled)+')';
                                    } else {
                                      status = ' ('+(AppLocalizations.of(context)!.pickedup)+')';
                                    }
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _onSelected(index);
                                          if (checkSelect != -1 &&
                                              checkSelect != index) {
                                            checkSelect = index;
                                          } else if (checkSelect == index) {
                                            checkSelect = -1;
                                          } else {
                                            checkSelect = index;
                                          }
                                        });
                                      },
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          Container(
                                            // width: 360,
                                            height: 40,
                                            margin: EdgeInsets.fromLTRB(
                                                0, 12, 0, 0),
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
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    child: Padding(
                                                      padding:
                                                          new EdgeInsets.only(left: 12),
                                                      child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              pickUpGenerateds[index].cardId! + status,
                                                              textAlign: TextAlign.center,
                                                              style: pickUpGenerateds[index].status == 0
                                                                  ? TextStyle(fontSize: 14,
                                                                      fontWeight: FontWeight.w600,
                                                                      color: (pickUpGenerateds[index].status == 0)
                                                                          ? ColorConstants.brandColor
                                                                          : ColorConstants.secondaryColor2,
                                                                      // color: SearchIconColor,
                                                                      fontFamily: FontsConstants.notoSans)
                                                                  : TextStyle(fontSize: 14,
                                                                      fontWeight: FontWeight.w600,
                                                                      color: snapshot.data![index].status == 1
                                                                          ? Colors.black26
                                                                          : Colors.blueAccent,
                                                                      // color: SearchIconColor,
                                                                      fontFamily: FontsConstants.notoSans,
                                                                    ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _onSelected(index);
                                                          if (checkSelect != -1 && checkSelect != index) {
                                                            checkSelect = index;
                                                          } else if (checkSelect == index) {
                                                            checkSelect = -1;
                                                          } else {
                                                            checkSelect = index;
                                                          }
                                                        });
                                                      },
                                                      icon: (_currentIndex == index && checkSelect == index)
                                                          ? SvgPicture.asset(
                                                              'assets/icons/ic_dropdown_on.svg',
                                                              color: ColorConstants.brandColor,
                                                            )
                                                          : SvgPicture.asset(
                                                              'assets/icons/ic_dropdown_off.svg',
                                                              color: ColorConstants.brandColor,
                                                            ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Center(
                                            child: _getCard(index, pickUpGenerateds[index], pickUpGenerateds[index].requestId),
                                          ),
                                        ]),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                        ]),
                      ),
                    );
                  });
            }));
  }
  Widget itemButtonRightAppBar(BuildContext context) {
    late final AppDatabase appDatabase;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: IconButton(
        icon: SvgPicture.asset('assets/icons/ic_create_qrcode.svg'),
        onPressed: () {
          Navigator.of(context).pushNamed(RouteConstants.createQCode).then(
                  (value) => setState(() {    $FloorAppDatabase
                      .databaseBuilder('app_database.db')
                      .build()
                      .then((value) async {
                    setState(() {
                      _listFuture = getAllQRCode();
                    });
                  });}));
          // Navigator.pushNamed(context, RouteConstants.createQCode).then((value) => setState(() {}));
          // Navigator.popUntil(context, ModalRoute.withName('/home_screen'));
        },
      ),
    );
  }
}
