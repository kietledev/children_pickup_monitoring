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
    injector.registerSingleton<ProfileApiService>(ProfileApiService(injector()));
    injector.registerSingleton<PostProfileApiService>(PostProfileApiService(injector()));

    /* Parents api */
    injector.registerSingleton<GetParentsApiService>(GetParentsApiService(injector()));
    injector.registerSingleton<PostParentApiService>(PostParentApiService(injector()));
    injector.registerSingleton<DeleteParentApiService>(DeleteParentApiService(injector()));

    /* Menu api */
    injector.registerSingleton<PostMenusApiService>(PostMenusApiService(injector()));

    /* Users api */
    injector.registerSingleton<GetUsersByPersonApiService>(GetUsersByPersonApiService(injector()));

    /* Relationship Type api */
    injector.registerSingleton<GetRelationshipTypeApiService>(GetRelationshipTypeApiService(injector()));

    /* Password api */
    injector.registerSingleton<PostPasswordApiService>(PostPasswordApiService(injector()));

    /* pickup place api */
    injector.registerSingleton<GetPickupPlacesApiService>(GetPickupPlacesApiService(injector()));

    /* pupil parent api */
    injector.registerSingleton<GetPupilByParentApiService>(GetPupilByParentApiService(injector()));

    /* POST card api */
    injector.registerSingleton<PostPickUpCardApiService>(PostPickUpCardApiService(injector()));
    /* DELETE card api */
    injector.registerSingleton<DeletePickupDestroyedApiService>(DeletePickupDestroyedApiService(injector()));

    /* get list notification api */
    injector.registerSingleton<GetListNotificationApiService>(GetListNotificationApiService(injector()));
    /* get list classroom api */
    injector.registerSingleton<PostListClassByTeacherApiService>(PostListClassByTeacherApiService(injector()));
    /* post Notification api */
    injector.registerSingleton<PostTeacherSendNotificationApiService>(PostTeacherSendNotificationApiService(injector()));
  }
}
