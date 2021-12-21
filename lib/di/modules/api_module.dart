import 'package:children_pickup_monitoring/data/datasources/remote/get_all_conversations_api_service.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/post_notification_read_api_service.dart';
import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';

import '../injection.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    /* Dio client */
    injector.registerSingleton<Dio>(Dio());

    /* Login api */
    injector.registerSingleton<LoginApiService>(LoginApiService(injector()));

    /* Fetch teachers api */
    injector.registerSingleton<PostTeachersApiService>(
        PostTeachersApiService(injector()));

    /* Fetch pupils api */
    injector.registerSingleton<PostPupilsApiService>(
        PostPupilsApiService(injector()));

    /* Fetch Achievement api */
    injector.registerSingleton<PostAchievementsApiService>(
        PostAchievementsApiService(injector()));

    /* Profile api */
    injector
        .registerSingleton<ProfileApiService>(ProfileApiService(injector()));
    injector.registerSingleton<PostProfileApiService>(
        PostProfileApiService(injector()));

    /* Parents api */
    injector.registerSingleton<GetParentsApiService>(
        GetParentsApiService(injector()));
    injector.registerSingleton<PostParentApiService>(
        PostParentApiService(injector()));
    injector.registerSingleton<DeleteParentApiService>(
        DeleteParentApiService(injector()));

    /* Menu api */
    injector.registerSingleton<PostMenusApiService>(
        PostMenusApiService(injector()));

    /* Users api */
    injector.registerSingleton<GetUsersByPersonApiService>(
        GetUsersByPersonApiService(injector()));

    /* Relationship Type api */
    injector.registerSingleton<GetRelationshipTypeApiService>(
        GetRelationshipTypeApiService(injector()));

    /* Password api */
    injector.registerSingleton<PostPasswordApiService>(
        PostPasswordApiService(injector()));

    /* pickup place api */
    injector.registerSingleton<GetPickupPlacesApiService>(
        GetPickupPlacesApiService(injector()));

    /* pupil parent api */
    injector.registerSingleton<GetPupilByParentApiService>(
        GetPupilByParentApiService(injector()));

    /* Message Page Api */
    injector.registerSingleton<GetAllConversationsApiService>(
        GetAllConversationsApiService(injector()));
    /* Message Detail Api */
    injector.registerSingleton<GetMessagesApiService>(
        GetMessagesApiService(injector()));
    /* POST card api */
    injector.registerSingleton<PostPickUpCardApiService>(
        PostPickUpCardApiService(injector()));
    /* DELETE card api */
    injector.registerSingleton<DeletePickupDestroyedApiService>(
        DeletePickupDestroyedApiService(injector()));

    /* get list notification api */
    injector.registerSingleton<GetListNotificationApiService>(
        GetListNotificationApiService(injector()));
    /* get list classroom api */
    injector.registerSingleton<PostListClassByTeacherApiService>(
        PostListClassByTeacherApiService(injector()));
    /* post Notification by Teacher api */
    injector.registerSingleton<PostTeacherSendNotificationApiService>(
        PostTeacherSendNotificationApiService(injector()));
    /* post Notification Read api */
    injector.registerSingleton<PostNotificationReadApiService>(
        PostNotificationReadApiService(injector()));
    /* post message to group by goup id */
    injector.registerSingleton<PostMessageToGroupByGroupIdApiService>(
        PostMessageToGroupByGroupIdApiService(injector()));
    /*get list class room */
    injector.registerSingleton<GetListClassRoomsApiService>(
        GetListClassRoomsApiService(injector()));
  }

}
