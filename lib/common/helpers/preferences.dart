import 'dart:convert';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  /* Key */
  static const String USER_PREFERENCE = 'USER_PREFERENCE';
  static const String LOGIN_TIME = 'LOGIN_TIME';
  static const String USER_ID = 'USER_ID';
  static const String LIST_PUPIL_ID = 'LIST_PUPIL_ID';
  static const String PUPIL_ID = 'PUPIL_ID';
  static const String IS_REMEMBER = 'IS_REMEMBER';
  static const String IS_SCROLL = 'IS_SCROLL';
  static const String SHOOL_FINISH_TIME = 'SHOOL_FINISH_TIME';
  static const String WARNING_TIME = 'WARNING_TIME';
  static const String PROFILE_PREFERENCE = 'PROFILE_PREFERENCE';
  static const String TOKEN_PREFERENCE = 'TOKEN_PREFERENCE';
  static const String PUPIL_PREFERENCE = 'PUPIL_PREFERENCE';
  static const String CLASS_ID_PREFERENCE = 'CLASS_ID_PREFERENCE';
  static const String LANGUAGE_PREFERENCE = 'LANGUAGE_PREFERENCE';
  static const String NOTIFICATION_PREFERENCE = 'NOTIFICATION_PREFERENCE';
  /* Initial shared preferences */
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static final Preferences preferences = Preferences();

  /* Initial method String */
  Future<String> get(String key) async {
    final SharedPreferences prefs = await _prefs;
    return json.decode(prefs.getString(key)!) ?? '';
  }

  Future<String> getObject(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }

  Future set(String key, dynamic value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, json.encode(value));
  }

  Future remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }

  Future clear() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }

  /* User Preference */
  void setUserPreference(UserModel user) {
    final Map<String, dynamic> userString = user.toJson();
    preferences.set(USER_PREFERENCE, userString);
  }

  Future<UserModel?> getUserPreference() async {
    final String userString = await preferences.getObject(USER_PREFERENCE);
    final Map<String, dynamic> map =
        jsonDecode(userString) as Map<String, dynamic>;
    return UserModel.json(map);
  }
  /* Profole Preference */
  void setProfilePreference(PersonModel user) {
    final Map<String, dynamic> userString = user.toJson();
    preferences.set(PROFILE_PREFERENCE, userString);
  }

  Future<PersonModel?> getProfilePreference() async {
    final String userString = await preferences.getObject(PROFILE_PREFERENCE);
    final Map<String, dynamic> map = jsonDecode(userString) as Map<String, dynamic>;
    return PersonModel.json(map);
  }

  /* Login time */
  void setLoginTime(String value) {
    preferences.set(LOGIN_TIME, value);
  }

  Future<String> getLoginTime() async {
    return preferences.get(LOGIN_TIME);
  }

  /* User id */
  void setUserId(String value) {
    preferences.set(USER_ID, value);
  }

  Future<String> getUserId() async {
    return preferences.get(USER_ID);
  }
  /* list Pupil id*/
  void setListPupilId(List<int> value) {
    preferences.set(LIST_PUPIL_ID, value);
  }

  Future<List<int>> getListPupilId() async {
    final String listPupilId = await preferences.getObject(LIST_PUPIL_ID);
    final List<int> data = json.decode(listPupilId).cast<int>();
    return data;
  }

  /* Pupil id*/
  void setPupilId(String value) {
    preferences.set(PUPIL_ID, value);
  }

  Future<String> getPupilId() async {
    return preferences.get(PUPIL_ID);
  }

  /* Is Remember Password */
  Future setIsRemember() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(IS_REMEMBER, true);
  }

  Future<bool?> getIsRemember() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(IS_REMEMBER);
  }
  /* Is Scroll Profile */
  Future setIsScroll(bool isScroll) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(IS_SCROLL, isScroll);
  }

  Future<bool?> getIsScroll() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(IS_SCROLL);
  }

  Future setIDpupil(int pupilID) async {
    final prefs = await _prefs;
    prefs.setInt(PUPIL_PREFERENCE, pupilID);
  }
  Future setClassPupil(int classId) async {
    final prefs = await _prefs;
    prefs.setInt(CLASS_ID_PREFERENCE, classId);
  }
  Future<int> getIDpupil() async {
    final prefs = await _prefs;
    final pupilID = prefs.getInt(PUPIL_PREFERENCE) ?? 0;
    return pupilID;
  }
  Future<int> getClassID() async {
    final prefs = await _prefs;
    final classID = prefs.getInt(CLASS_ID_PREFERENCE) ?? 0;
    return classID;
  }

  /* School Finish Time */
  void setSchoolFinishTime(String value) {
    preferences.set(SHOOL_FINISH_TIME, value);
  }

  Future<String> getSchoolFinishTime() async {
    return preferences.get(SHOOL_FINISH_TIME);
  }

  /* Warning Time */
  void setWarningTime(String value) {
    preferences.set(WARNING_TIME, value);
  }

  Future<String> getWarningTime() async {
    return preferences.get(WARNING_TIME);
  }
  /* Language */
  Future<int> getLanguage() async {
    final prefs = await _prefs;
    final language = prefs.getInt(LANGUAGE_PREFERENCE) ?? 0;
    return language;
  }

  Future setlanguage(int index) async {
    final prefs = await _prefs;
    prefs.setInt(LANGUAGE_PREFERENCE, index);
  }
  /* User Preference */
  void setNotification(NotificationModel notificationModel) {
    final Map<String, dynamic> notificationString = notificationModel.toJson();
    preferences.set(NOTIFICATION_PREFERENCE, notificationString);
  }
  Future<NotificationModel?> getNotification() async {
    final String notificationString = await preferences.getObject(NOTIFICATION_PREFERENCE);
    final Map<String, dynamic> map = jsonDecode(notificationString) as Map<String, dynamic>;
    return NotificationModel.json(map);
  }
}

