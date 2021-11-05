import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/common/helpers/my_behavior.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
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

class CreateQRCodePage extends StatefulWidget {
  const CreateQRCodePage({Key? key}) : super(key: key);

  @override
  State<CreateQRCodePage> createState() => _CreateQRCodeState();
}

class _CreateQRCodeState extends State<CreateQRCodePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WidgetAppBar(
          title: TitlesConstants.send_request_pickup,
          menuItem: [],
          hideBack:true,
          actionBack: () {
            Navigator.pop(context);
          },
        ),

      body: MultiBlocProvider(
      providers: [
        BlocProvider<PickUpPlaceBloc>(
          create: (BuildContext context) => injector<PickUpPlaceBloc>()
            ..add(const FetchPickUpPlace(),)
        ),
        BlocProvider<PupilByParentBloc>(
        create: (BuildContext context) => injector<PupilByParentBloc>()
        ),
        BlocProvider<ParentsBloc>(
            create: (BuildContext context) => injector<ParentsBloc>()
              ..add(const FetchParents(pupilId: 1, relationshipTypeId: 0),)
        ),
        BlocProvider<PickUpBloc>(
            create: (BuildContext context) => injector<PickUpBloc>()
        ),


      ],
      child: const Scaffold(
        body: CreateQRCodeBody(),
      ),
    ),
    );
  }
}

class CreateQRCodeBody extends StatefulWidget {
  const CreateQRCodeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateQRCodeBody> createState() => _CreateQRCodeBody();
}

class _CreateQRCodeBody extends State<CreateQRCodeBody> {
  UserModel? userModel;
  //format ngày
  final formatDate = new DateFormat('dd-MM-yyyy');
  DateTime now = DateTime.now();
  //TIME
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  late FocusNode pin2FocusNode;
  String? hourNew = "10";
  String? minutesNew = '00';
  String timeString = '10:00';
  int ischeckOrder = 0;
  //Pickup place
  List<PickUpPlace> _pickUpPlaces = [];
  List<Parent> _parents = [];
  String? locationSelected;
  String? locationNameSelected;
  //parent pickup
  String? currentParentName = '';
  String? parentIDSelected =  '0';
  String? parentID =  '-1';
  String? parentNameSelected;
  List<Parent>? _parentPickUps = [];
  //pupil pickup
  List<PupilCheck> _pupilsCheckbox = [];
  List<Pupil> _pupils = [];
  List<PupilCheck> _pupilsPickUp = [];
  List<int?> _pupilIDs = [];
 //Request
  PickUpRequest _pickUpRequest = new PickUpRequest();
  String? dateTimeRequest = '';
  int _timeIndex = 1;
  int isselected = 0;
  int userID = 0;
  @override
  void initState() {
    super.initState();
    getParentId(parentID!);
    pin2FocusNode = FocusNode();
  }
  getParentId(String? parentId) async {
    userModel = await getUser();
      if (parentId == "-1"){
        parentIDSelected = userModel!.fromParentId.toString();
        parentID = userModel!.fromParentId.toString();
        userID = userModel!.userId;
        setState(() {
          currentParentName = userModel!.currentLastName+ " "+ userModel!.currentMiddleName! + " "+ userModel!.currentFirstName;
        });
        BlocProvider.of<PupilByParentBloc>(context).add(FetchPupilByParent(parentId: userModel!.fromParentId));
      }else{
        BlocProvider.of<PupilByParentBloc>(context).add(FetchPupilByParent(parentId: int.parse(parentId!)));
      }
  }
  Future createQR() async {
    int? pupil_1 = 0;
    int? pupil_2 = 0;
    int? pupil_3 = 0;
    dateTimeRequest = formatDate.format(now) + ' ' + timeString + ":00";
    if (_pupilIDs.length == 1) {
      pupil_1 = _pupilIDs[0];
    } else if (_pupilIDs.length == 2) {
      pupil_1 = _pupilIDs[0];
      pupil_2 = _pupilIDs[1];
    } else if (_pupilIDs.length == 3) {
      pupil_1 = _pupilIDs[0];
      pupil_2 = _pupilIDs[1];
      pupil_3 = _pupilIDs[2];
    }
    print("USER ID --> "+userID.toString());
    final Map<String, dynamic> body = <String, dynamic>{
      "REQUEST_BY_USER_ID": userID,
      "REQUEST_BY_PARENT_ID": int.parse(parentIDSelected!),
      "REQUEST_DATETIME": dateTimeRequest,
      "PICK_UP_PLACE_ID":  int.parse(locationSelected!),
      "PICK_UP_PUPIL_ID_1": pupil_1,
      "PICK_UP_PUPIL_ID_2": pupil_2,
      "PICK_UP_PUPIL_ID_3": pupil_3,
    };
    print(body);
    BlocProvider.of<PickUpBloc>(context).add(InsertPickUpRequestEvent(body: body));
  }
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
            margin: const EdgeInsets.fromLTRB(24,12,24,24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  child:  Text('Chọn giờ đón',style: QRCodeStyle.contentStyle3,),
                  alignment: Alignment.centerLeft,
                ),
                _buildTimePickup(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: const Divider(
                    color: Color(0xFFA693D9),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Align(
                  child:  Text('Chọn điểm đón',style: QRCodeStyle.contentStyle3,),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 12.0,
                ),
                _buildPickupPlace(),
                SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: const Divider(
                    color: Color(0xFFA693D9),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Align(
                  child:  Text('Người đón',style: QRCodeStyle.contentStyle3,),
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isselected = 0;
                              });
                            },
                            icon: (isselected == 0)
                                ? SvgPicture.asset(
                                'assets/icons/ic_radio_selected.svg')
                                : SvgPicture.asset(
                              'assets/icons/ic_radio_no_selected.svg',
                              height: 20,
                            ),
                          ),
                          new Text(
                            "Phụ huynh",
                            style: QRCodeStyle.contentStyle2,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isselected = 1;
                              });
                            },
                            icon: (isselected == 1)
                                ? SvgPicture.asset(
                                'assets/icons/ic_radio_selected.svg')
                                : SvgPicture.asset(
                              'assets/icons/ic_radio_no_selected.svg',
                            ),
                          ),
                          new Text(
                            "Khác",
                            style:EditProfileStyle.contentStyle,
                          )
                        ],
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: const Divider(
                    color: Color(0xFFA693D9),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Align(
                  child:  Text('Họ và tên',style: QRCodeStyle.contentStyle3,),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 12.0,
                ),
                isselected == 0?
                // Container(
                //   decoration: const BoxDecoration(
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black12,
                //         blurRadius: 10,
                //         offset: const Offset(0, 2),
                //       ),
                //     ],
                //   ),
                //   child: TextField(
                //
                //     decoration: InputDecoration(
                //         contentPadding:
                //         const EdgeInsets.fromLTRB(10, 5, 10, 5),
                //         disabledBorder:
                //         OutlineInputBorder(
                //           borderSide: BorderSide(
                //               color: Colors.white,
                //               width: 0),
                //           borderRadius:
                //           BorderRadius.circular(6.0),
                //         ),
                //         filled: true,
                //         hintStyle: QRCodeStyle.contentStyle4,
                //         hintText: currentParentName,
                //         fillColor: Colors.white),
                //     enabled: false,
                //   ),
                // ):
                CustomTextFieldMenu(
                    value: currentParentName!,
                    style: QRCodeStyle.contentStyle2):
                _buildParents(),
                SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: const Divider(
                    color: Color(0xFFA693D9),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Align(
                  child:  Text('Chọn trẻ đón',style: QRCodeStyle.contentStyle3,),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 12.0,
                ),

                _buildPupilsCheckBox(),
                // PupilPickUp(parentID:int.parse(parentIDSelected!)),
            // getUser().then((value) => _buildPupilsCheckBox(value!.fromParentId));

                SizedBox(
                  height: 24.0,
                ),
                _buildButtonNext(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildWidget(String language, int index) {
    bool isSelected = _timeIndex == index;
    return Container(

      margin: EdgeInsets.fromLTRB(0, 16, 14, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //border: Border.all(color: isSelected ? Colors.blue[300]!.withOpacity(0.8) : Colors.grey[700]),
          color: isSelected ? ColorConstants.brandColor : ColorConstants.neutralColor4),
      child: Text(
        language,
        style: TextStyle(
            fontSize: 16, color: isSelected ? ColorConstants.white : ColorConstants.neutralColor2),
      ),
    );
  }
  void nextField(String value, FocusNode focusNode) {
    if (value.length == 2) {
      focusNode.requestFocus();
    }
  }
  Widget _buildTimePickup() {
    return Column(
      children: [
        Container(
          height: 120.h,
          child:GridView.count(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            childAspectRatio: 0.5,
            crossAxisCount: 2,

            // Generate 100 widgets that display their index in the List.
            children:
            List.generate(listTime.length, (index) {
              return GestureDetector(
                  child: _buildWidget(listTime[index].time,
                      listTime[index].id),
                  onTap: () {
                    setState(() {
                      ischeckOrder = 0;
                      _timeIndex = listTime[index].id;
                      timeString = listTime[index].time;
                    });
                  });
            }),
          )

      ),
        ischeckOrder == 0
            ? Container(
          margin: const EdgeInsets.fromLTRB(0,16.0,0,12.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 40.h,
              width: 94.w,
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    ischeckOrder = 1;
                    _timeIndex = -1;
                    _buildWidget('', -1);
                  });
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all(
                        ColorConstants.neutralColor4)),
                icon: Text(
                  "khác",
                  style: QRCodeStyle.contentStyle,
                ),
                label: SvgPicture.asset(
                    'assets/icons/ic_pencil.svg'),
              ),
            ),
          ),
        )
            : Container(
          margin: const EdgeInsets.fromLTRB(0,16.0,0,12.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 40,
              width: 94,
              decoration: BoxDecoration(
                  color: ColorConstants.brandColor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    child: TextFormField(
                      controller: pin1,
                      autofocus: true,
                      style: QRCodeStyle.contentStyle1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 11),
                        counterText: '',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      onChanged: (value) {
                        nextField(value, pin2FocusNode);
                        hourNew = value;
                      },
                    ),
                  ),
                  Text(
                    ':',
                    style: QRCodeStyle.contentStyle1,
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    child: TextFormField(
                      controller: pin2,
                      focusNode: pin2FocusNode,
                      style: QRCodeStyle.contentStyle1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(
                            vertical: 11),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      onChanged: (value) {
                        if (value.length == 2) {
                          pin2FocusNode.unfocus();
                          minutesNew = value;
                          timeString = hourNew! + ':' + minutesNew!;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    ],
    );
  }
  Widget _buildPickupPlace() {
    return BlocBuilder<PickUpPlaceBloc, PickUpPlaceState>(
        builder: (context, state) {
          if (state is FetchPickUpPlaceFailureState) {
            return Text("khong co dl");
            } else if (state is FetchPickUpPlaceSuccessState) {
              _pickUpPlaces = state.pickUpPlaces!;
              return Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16,0,16,0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text(
                        'chọn địa điểm đón',
                        style: ProfileStyle.contentStyle2 ,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorConstants.neutralColor1,
                      ),
                      value: locationSelected,
                      isDense: true,
                      onChanged: (newValue) {
                        setState(() {
                          locationSelected = newValue;
                        });
                        for (PickUpPlace i
                        in _pickUpPlaces) {
                          if (i.pickUpPlaceId == int.parse(locationSelected!)) {
                            locationNameSelected = i.pickUpPlaceName;
                          }
                        };
                      },
                      items: _pickUpPlaces.map((PickUpPlace value) {
                        return DropdownMenuItem<String>(
                          value: value.pickUpPlaceId.toString(),
                          child: Text(value.pickUpPlaceName!),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF3F5FF).withOpacity(1),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              );

          }else{

           return const SizedBox.shrink();
          }
        });

  }

  Widget _buildParents() {
    return BlocBuilder<ParentsBloc, ParentsState>(
        builder: (context, state) {
          if (state is FetchParentsFailureState) {
            return Text("khong co dl");
          } else if (state is FetchParentsSuccessState) {
            _parents = state.parents!;
            return Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16,0,16,0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(
                      'chọn người đón hộ',
                      style: ProfileStyle.contentStyle2 ,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: ColorConstants.neutralColor1,
                    ),
                    value: parentIDSelected,
                    isDense: true,
                    onChanged: (newValue) {
                      setState(() {
                        parentIDSelected = newValue;
                        for (Parent i in _parents) {
                            if (i.parentId == int.parse(parentIDSelected!)) {
                            parentNameSelected = i.getFullName();
                            }
                            }
                        print("parentIDSelected  -> "+parentIDSelected!);
                        getParentId(parentIDSelected!);
                      });

                    },
                    items: _parents.map((Parent value) {
                      return DropdownMenuItem<String>(
                        value: value.parentId.toString(),
                        child: Text(value.getFullName()),
                      );
                    }).toList(),
                  ),
                ),
              ),
              height: 40.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF3F5FF).withOpacity(1),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            );

          }else{
            print("LỖI");
            return const SizedBox.shrink();
          }
        });
  }
  Widget _buildPupilsCheckBox() {
    print("VAO HÀM----");
    return  BlocBuilder<PupilByParentBloc, PupilByParentState>(
      builder: (context, state) {
        if (state is FetchPupilByParentFailureState) {
          return Text("khong co dl");
        } else if (state is FetchPupilByParentSuccessState) {
          _pupilsCheckbox = [];
          _pupils = state.pupils!;
          print("_pupils length ==>>  "+_pupils.length.toString());
          for (Pupil pupil in _pupils){
            _pupilsCheckbox.add(new PupilCheck(isCheck: false,pupil: pupil));
          }
          print("_pupilsCheckbox ==>>     "+_pupilsCheckbox[0].pupil!.personToPersonPersonalRelationshipTypeName!);
          return SizedBox(
              height: 60 * _pupilsCheckbox.length.toDouble(),
              child: ListView(

                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: _pupilsCheckbox.map((PupilCheck pupil) {
                  return new ItemPupilCheckBox(
                    pupil: pupil,
                  );
                }).toList(),
              )
          );
        }else{
          print("LỖI");
          return const SizedBox.shrink();
        }
      },
    );
  }
  Widget _saveData(){
    return BlocBuilder<PickUpBloc,PickUpState>(
      builder: (context, state) {
        if (state is PickUpFailureState) {
          return Text("khong co dl");
        } else if (state is PickUpSuccessState) {
          _pickUpRequest = state.pickUpRequest!;
          return const SizedBox.shrink();
        }else{
          return const SizedBox.shrink();
        }
      },
    );

}
  Widget _buildButtonNext() {
    return Align(
        alignment: Alignment.center,
        child: CustomButtonText(
            text: 'Tiếp tục',
            press: () {
              _pupilsPickUp = [];
              _pupilIDs = [];
              for (PupilCheck pupil in _pupilsCheckbox) {
                if (pupil.isCheck! == true) {
                  _pupilsPickUp.add(pupil);
                  _pupilIDs.add(pupil.pupil!.pupilId);
                }
              }
              if (_pupilIDs.length <= 3 &&
                  _pupilIDs.length > 0) {
                if (locationSelected != null) {
                  _showAlert(context, _pupilsPickUp);
                } else {
                  _showError(context,
                      'Bạn chưa chọn địa điểm đón');
                }
              } else if (_pupilIDs.length == 0) {
                _showError(context, 'Bạn chưa chọn bé đón');
              } else {
                _showError(context,
                    'Bạn chỉ được đón tối đa 3 bé');
              }

            },
            width: 156)
    );
  }
  void _showAlert(BuildContext context, List<PupilCheck> _pupilsPickUp) {
    String nameChild = '';
    for (PupilCheck a in _pupilsPickUp) {
      nameChild += a.pupil!.getFullName() +' , ';
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            height: 150,
            child: Column(
              children: [
                Text(
                  'Bạn sẽ đón bé',
                  style: QRCodeStyle.contentStyle6,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(nameChild,
                    style:QRCodeStyle.contentStyle5),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lúc',
                      style: QRCodeStyle.contentStyle6,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$timeString, ${formatDate.format(DateTime.now())}',
                        style: QRCodeStyle.contentStyle5,),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tại',
                      style: QRCodeStyle.contentStyle6,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(locationNameSelected!,
                        style: QRCodeStyle.contentStyle5),
                    SizedBox(
                      width: 6,
                    ),
                  ],
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
                    text: 'Xác nhận',
                    press: () {
                      createQR();
                      // Navigator.of(context).pushNamed(RouteConstants.qrInformation);

                    },
                    width: 117),
              ),
            ])
          ],
        ));
  }
  void _showError(BuildContext context, String title) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container( height: 50,child:Center(child: Text(title,style:QRCodeStyle.contentStyle2))),
            actions: <Widget>[
              Center(
                child: CustomButtonBorder(
                    text: 'Đóng',
                    press: () {
                      Navigator.pop(context);
                    },
                    width: 117),
              ),
            ],
          );
        });
  }
}