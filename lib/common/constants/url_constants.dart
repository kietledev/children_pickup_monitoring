class UrlConstatns {
  static const String urlServer = "http://dtuct.ddns.net:9999/";
  static const String apiLogin = urlServer + "api/Login";
  static const String apiGetProfile = urlServer + "api/getUserByPersonId";
  static const String apiUpdateProfile = urlServer + "updateProfile";
  static const String apiPostTeachersByClassId =
      urlServer + "api/getListTeachersByClassId";
  static const String apiPostPupilsByClassId =
      urlServer + "api/getListChildrensByClassId";
  static const String apiPostMenusByClassTypeId =
      urlServer + "api/getListMenuForWeekByClassTypeId";
  static const String apiPostAchievements =
      urlServer + "api/getListAChievementsByPupilId";
  static const String apiGetListParentRelationshipByPupilId = urlServer + "api/getListParentRelationshipByPupilId";
  static const String apiGetListUserbyPerson = urlServer + "api/getListUserbyPerson";
  static const String apiGetListRelationshipType = urlServer + "api/getListRelationshipType";
  static const String apiPostParent= urlServer + "insertPersonToParent";
  static const String apiGetListPickupPlace = urlServer + "api/getListPickUpPlaces";
  static const String apiGetPupilByParentId = urlServer + "api/getListPupilByParentId";

  static const String apiDeleteParent= urlServer + "deleteParent";
  static const String apiPostPassword= urlServer + "changePassWord";
}
