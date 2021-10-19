class UrlConstatns {
  static const String urlServer = "http://dtuct.ddns.net:9999/";
  static const String apiLogin = urlServer + "api/Login";
  static const String apiPostTeachersByClassId =
      urlServer + "api/getListTeachersByClassID";
  static const String apiPostPupilsByClassId =
      urlServer + "api/getListChildrensByIdClass";
  static const String apiPostMenusByClassTypeId =
      urlServer + "api/getListMenuForWeekByidClassType";
  static const String apiPostAchievements =
      urlServer + "api/getListAChievementsByIdPupil";
}
