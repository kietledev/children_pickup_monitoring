class UrlConstatns {
  static const String urlServer = "http://dtuct.ddns.net:9999/";
  static const String apiLogin = urlServer + "api/Login";
  static const String apiGetProfile = urlServer + "api/getUserByPersonId";
  static const String apiUpdateProfile = urlServer + "updateProfile";
  static const String apiPostTeachersByClassId =
      urlServer + "api/getListTeachersByClassId";
  static const String apiPostPupilsByClassId =
      urlServer + "api/getListPupilsByClassId";
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

  /* Chat */
  static const String apiGetAllConversations = urlServer + "getListConversationByPersonId";
  static const String getAllMessageInGroupByGroupId = urlServer + "getAllMessageInGroupByGroupId";
  static const String apiPostMessageToGroupByGroupId = urlServer + "sendMessageToGroupByGroupId";


  static const String apiPostPickUpCard= urlServer + "sendPickUpRequest";
  static const String apiGetPickUpCards= urlServer + "api/getListPickUpRequestByUserId";
  static const String apiPutPickUpCards= urlServer + "updatePickUpDestroyed";
  static const String apiGetListNotification= urlServer + "getListUnreadNotificationByPersonId";
  static const String apiPostListClassByTeacherId = urlServer + "getListClassByTeacherId";
  static const String apiPostTeacherSendNotification = urlServer + "teacherSendAnnoucementToClass";
  static const String apiPostNotificationRead = urlServer + "maskAnnoucementAsReadByAnnoucementId";
  static const String apiGetListClassRooms= urlServer + "api/getListClassRooms";
  static const String apiUpdateProfilePupil= urlServer + "updateProfilePupil";
  static const String apiGetListPickUpHistory= urlServer + "api/getListPickUpHistoryByUserId";

}
