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
    /* Menu api */
    injector.registerSingleton<PostMenusApiService>(PostMenusApiService(injector()));
    injector.registerSingleton<PostParentApiService>(PostParentApiService(injector()));
    /* Users api */
    injector.registerSingleton<GetUsersByPersonApiService>(GetUsersByPersonApiService(injector()));
    /* Relationship Type api */
    injector.registerSingleton<GetRelationshipTypeApiService>(GetRelationshipTypeApiService(injector()));
  }
}
