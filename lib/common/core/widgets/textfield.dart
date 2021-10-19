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
  String? year = '';
  String? month = '';
  String? day = '';
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
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(typeTextField=='address'){
      return textFieldAddress();
    }else if(typeTextField=="birthday"){
      return textFielBirthDay();
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
                ? TextStyle(
                color: ColorConstants.secondaryColor2,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: FontsConstants.notoSans)
                : TextStyle(
                color: ColorConstants.neutralColor2,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: FontsConstants.notoSans),
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
                ? TextStyle(
                color: ColorConstants.secondaryColor2,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: FontsConstants.notoSans)
                : TextStyle(
                color: ColorConstants.neutralColor2,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: FontsConstants.notoSans),
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
                  offset: Offset(0,
                      3), // changes position of shadow
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
            "Năm sinh:",
            style: enabled
                ? EditProfileStyle.contentStyleEditTrue
                : EditProfileStyle.contentStyleEditFalse,
          ),
          enabled
              ? Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                          // decoration: shadowtextfield,
                          child: CustomDropdown<int>(
                            child: Text(
                              '$day',
                            ),
                            onChange: (int value, int index) {
                              day = listday[index];
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
                            items: listday
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
                          //decoration: shadowtextfield,
                          child: CustomDropdown<int>(
                            child: Text(
                              '$month',
                            ),
                            onChange: (int value, int index) {
                              month = listmonth[index];
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
                          //decoration: shadowtextfield,
                          child: CustomDropdown<int>(
                            child: Text(
                              '$year',
                            ),
                            onChange: (int value, int index) {
                              year = value.toString();
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
}