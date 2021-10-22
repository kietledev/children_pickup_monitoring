class UrlConstatns {
  static const String urlServer = "http://dtuct.ddns.net:9999/";
  static const String apiLogin = urlServer + "api/Login";
  static const String apiPostTeachersByClassId =
      urlServer + "api/getListTeachersByClassId";
  static const String apiPostPupilsByClassId =
      urlServer + "api/getListChildrensByClassId";
  static const String apiPostMenusByClassTypeId =
      urlServer + "api/getListMenuForWeekByidClassType";
  static const String apiPostAchievements =
      urlServer + "api/getListAChievementsByPupilId";
  static const String apiGetProfile = urlServer + "api/getUserById";
}
