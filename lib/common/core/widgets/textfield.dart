import 'package:children_pickup_monitoring/common/constants/color_constants.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldCustom extends StatelessWidget{
  final String? typeTextField;
  final String title;
  final bool enabled;
  final String? keyboarType;
  final TextEditingController controller;
  //Textfield birthday
  String? year = '';
  String? month = '';
  String? day = '';
  Function(String index)? returnDay;
  Function(String index)? returnMonth;
  Function(String index)? returnYear;
  //TextField Name
  final TextEditingController? lastNameController;
  final TextEditingController? middleNameController;
  final TextEditingController? firstNameController;
  final shadowtextfield = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.15),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );
  TextFieldCustom(
  {
    this.typeTextField,
    this.title = "",
    this.enabled = false,
    this.keyboarType="",
    required this.controller,
    this.day,
    this.year,
    this.month,
    this.returnDay,
    this.returnMonth,
    this.returnYear,
    this.lastNameController,
    this.middleNameController,
    this.firstNameController,

  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(typeTextField=='address'){
      return textFieldAddress();
    }else if(typeTextField=="birthday"){
      return textFielBirthDay();
    }else if(typeTextField=="name"){
      return textFieldName();
    }
    else {
      return textField();
    }
  }

  Widget textFieldAddress(){
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: enabled
                ? EditProfileStyle.titleStyleEditTrue
                : EditProfileStyle.titleStyleEditFalse
          ),
          Container(
            height: 80,
            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: TextField(
              maxLines: 5,
              enabled: enabled,
              controller: controller,
              style: TextStyle(
                  color: ColorConstants.neutralColor1,
                  fontSize: 14,
                  fontFamily: FontsConstants.notoSans),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: Colors.white, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: Colors.white, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: Colors.white, width: 3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget textField(){
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: enabled
                ? EditProfileStyle.titleStyleEditTrue
                : EditProfileStyle.titleStyleEditFalse
          ),
          Container(
            height: 40,
            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,3), // changes position of shadow
                ),
              ],
            ),
            child: TextField(
              enabled: enabled,
              keyboardType: (keyboarType == "phone")
                  ? TextInputType.phone
                  : TextInputType.text,
              controller: controller,
              style: TextStyle(
                  color: ColorConstants.neutralColor1,
                  fontSize: 14,
                  fontFamily: FontsConstants.notoSans),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: Colors.white, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: Colors.white, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: Colors.white, width: 3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget textFielBirthDay() {
    int yearstart = 1950;
    List<String> listyears = [];
    String yearNow = DateFormat('yyyy').format(DateTime.now());
    for (int i = yearstart; i <= int.parse(yearNow); i++) {
      listyears.add(i.toString());
    }
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: enabled
                ? EditProfileStyle.titleStyleEditTrue
                : EditProfileStyle.titleStyleEditFalse,
          ),
          enabled
              ? Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.fromLTRB(0, 6, 12, 0),
                           decoration: shadowtextfield,
                          child: CustomDropdown<int>(
                            child: Text('$day', style: EditProfileStyle.contentStyle,),
                            onChange: (int value, int index) {
                              day = listday[index];
                              returnDay!(day!);
                            },
                            dropdownButtonStyle: DropdownButtonStyle(
                              width: 80,
                              height: 40,
                              backgroundColor: Colors.white,
                            ),
                            dropdownStyle: DropdownStyle(
                              borderRadius: BorderRadius.circular(8),
                              elevation: 6,
                            ),
                            items: listday.asMap().entries.map(
                                  (item) => DropdownItem<int>(
                                    value: item.key + 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(12, 0, 0, 0),
                                        child: Text(item.value,
                                            style: TextStyle(
                                                color: ColorConstants.neutralColor1,
                                                fontSize: 14,
                                                fontFamily: FontsConstants.notoSans)),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.fromLTRB(12, 6, 0, 0),
                          decoration: shadowtextfield,
                          child: CustomDropdown<int>(
                            child: Text('$month',style: EditProfileStyle.contentStyle,),
                            onChange: (int value, int index) {
                              month = listmonth[index];
                              returnMonth!(month!);
                            },
                            dropdownButtonStyle: DropdownButtonStyle(
                              width: 80,
                              height: 40,
                              backgroundColor: Colors.white,
                            ),
                            dropdownStyle: DropdownStyle(
                              borderRadius: BorderRadius.circular(8),
                              elevation: 6,
                            ),
                            items: listmonth
                                .asMap()
                                .entries
                                .map(
                                  (item) => DropdownItem<int>(
                                    value: item.key + 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(12, 0, 0, 0),
                                        child: Text(item.value,
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .neutralColor1,
                                                fontSize: 14,
                                                fontFamily:
                                                    FontsConstants.notoSans)),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.fromLTRB(12, 6, 0, 0),
                          decoration: shadowtextfield,
                          child: CustomDropdown<int>(
                            child: Text('$year',style: EditProfileStyle.contentStyle,),
                            onChange: (int value, int index) {
                              year = value.toString();
                              returnYear!(year!);
                            },
                            dropdownButtonStyle: DropdownButtonStyle(
                              width: 80,
                              height: 40,
                              backgroundColor: Colors.white,
                            ),
                            dropdownStyle: DropdownStyle(
                              borderRadius: BorderRadius.circular(8),
                              elevation: 6,
                            ),
                            items: listyears
                                .asMap()
                                .entries
                                .map(
                                  (item) => DropdownItem<int>(
                                    value: int.parse(item.value),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(12, 0, 0, 0),
                                        child: Text(item.value,
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .neutralColor1,
                                                fontSize: 14,
                                                fontFamily:
                                                    FontsConstants.notoSans)),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                )
              : Container(
                  height: 40,
                  margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    enabled: enabled,
                    controller: controller,
                    style: TextStyle(
                        color: ColorConstants.neutralColor1,
                        fontSize: 14,
                        fontFamily: FontsConstants.notoSans),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
  Widget textFieldName(){
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: enabled
                ?EditProfileStyle.titleStyleEditTrue
                :EditProfileStyle.titleStyleEditFalse
          ),
          enabled ? Container(
            child: Row(
              children: [
                Container(
                  width: 71,
                  height: 40,
                  margin: EdgeInsets.fromLTRB(
                      0, 6, 0, 0),
                  decoration: shadowtextfield,
                  child: TextField(
                    controller: lastNameController,
                    style: EditProfileStyle.contentStyle,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Họ',
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.fromLTRB(12, 6, 0, 0),
                    decoration: shadowtextfield,
                    child: TextField(
                      controller: middleNameController,
                      style: EditProfileStyle.contentStyle,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Tên đệm',
                        contentPadding:EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        focusedBorder:
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 116,
                  height: 40,
                  margin: EdgeInsets.fromLTRB(12, 6, 0, 0),
                  decoration: shadowtextfield,
                  child: TextField(
                    controller: firstNameController,
                    style:EditProfileStyle.contentStyle,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Tên',
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      enabledBorder:
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      disabledBorder:
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder:
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
              : Container(
            height: 40,
            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,3), // changes position of shadow
                ),
              ],
            ),
            child: TextField(
              enabled: enabled,
              controller: controller,
              style: EditProfileStyle.contentStyle,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white, width: 3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}