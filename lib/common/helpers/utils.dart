import 'package:children_pickup_monitoring/common/constants/text_constants.dart';
import 'package:children_pickup_monitoring/common/helpers/preferences.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  Utils._();

  static TextStyle setStyle(
      {Color? color = Colors.black,
      String? fontFamily = FontsConstants.notoSans,
      FontWeight? weight = FontWeight.w400,
      double? size = 16}) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontWeight: weight,
      fontSize: size,
    );
  }
  static String formatDate(String datetime) {
    if (datetime == "") {
      return " ";
    } else {
      DateTime parseDate =
      new DateFormat("yyyy-MM-dd").parse(datetime);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('dd-MM-yyyy');
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    }
  }
 static String formatDateTime(String datetime) {
    if (datetime == "") {
      return " ";
    } else {
      DateTime parseDate =
      new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(datetime);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('dd-MM-yyyy');
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    }
  }

  static String formatDay(String datetime) {
    if (datetime == "") {
      return "dd";
    } else {
      DateTime parseDate =
      new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(datetime);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('dd');
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    }
  }

  static String formatMonth(String datetime) {
    if (datetime == "") {
      return "MM";
    } else {
      DateTime parseDate =
      new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(datetime);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('MM');
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    }
  }

  static String formatYear(String datetime) {
    if (datetime == "") {
      return "yyyy";
    } else {
      DateTime parseDate =
      new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(datetime);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('yyyy');
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    }
  }

}
Future<UserModel?> getUser() async {
  final preferences = Preferences();
  final UserModel? user = await preferences.getUserPreference();
  return user;
}
Future<int> getClassID() async {
  final preferences = Preferences();
  final int classID = await preferences.getClassID();
  return classID;
}
Future<PersonModel?> getProfile() async {
  final preferences = Preferences();
  final PersonModel? user = await preferences.getProfilePreference();
  return user;
}
Future<int> getPupilID() async {
  final preferences = Preferences();
  final int pupilID = await preferences.getIDpupil();
  return pupilID;
}
Future<List<int>> getListPupilID() async {
  final preferences = Preferences();
  final List<int> pupilIDs = await preferences.getListPupilId();
  return pupilIDs;
}
Future<NotificationModel?> getNotification() async {
  final preferences = Preferences();
  final NotificationModel? notificationModel = await preferences.getNotification();
  return notificationModel;
}