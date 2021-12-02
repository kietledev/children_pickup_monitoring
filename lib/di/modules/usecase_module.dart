import 'package:children_pickup_monitoring/domain/usecases/get_parents_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/post_parent_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/post_profile_usercase.dart';
import 'package:children_pickup_monitoring/domain/usecases/usecases.dart';

import '../injection.dart';

class UseCaseModule extends DIModule {
  @override
  Future<void> provides() async {
    /* Login Usecase */
    injector.registerSingleton<PostLoginUseCase>(PostLoginUseCase(injector()));

    /* Local User Usecase */
    injector.registerSingleton<GetSavedUserUseCase>(
        GetSavedUserUseCase(injector()));
    injector.registerSingleton<SaveUserUseCase>(SaveUserUseCase(injector()));
    injector
        .registerSingleton<RemoveUserUseCase>(RemoveUserUseCase(injector()));

    /* Post Teachers Usecase */
    injector.registerSingleton<PostTeachersUseCase>(
        PostTeachersUseCase(injector()));

    /* Post Pupil Usecase */
    injector.registerSingleton<PostPupilsUseCase>(PostPupilsUseCase(injector()));

    /* Post Achievement Usecase */
    injector.registerSingleton<PostAchievementsUseCase>(
        PostAchievementsUseCase(injector()));
    /* Profile Usecase */
    injector.registerSingleton<GetProfileUseCase>(GetProfileUseCase(injector()));
    injector.registerSingleton<PostProfileUseCase>(PostProfileUseCase(injector()));
    /* Parent Usecase */
    injector.registerSingleton<GetParentsUseCase>(GetParentsUseCase(injector()));
    injector.registerSingleton<PostParentUseCase>(PostParentUseCase(injector()));
    injector.registerSingleton<DeleteParentUseCase>(DeleteParentUseCase(injector()));
    /* Users Usecase */
    injector.registerSingleton<GetUsersByPersonUseCase>(GetUsersByPersonUseCase(injector()));
    /* relationship type Usecase */
    injector.registerSingleton<GetRelationshipTypeUseCase>(GetRelationshipTypeUseCase(injector()));
    /*Post menu Usecase */
    injector.registerSingleton<PostMenusUseCase>(PostMenusUseCase(injector()));
    /*Get pickup place Usecase */
    injector.registerSingleton<GetPickUpPlaceUseCase>(GetPickUpPlaceUseCase(injector()));

    /*Get pupil by parent */
    injector.registerSingleton<GetPupilByParentUseCase>(GetPupilByParentUseCase(injector()));
    /*Post password Usecase */
    injector.registerSingleton<PostPasswordUseCase>(PostPasswordUseCase(injector()));
    /*Get list notification Usecase */
    injector.registerSingleton<GetNotificationUseCase>(GetNotificationUseCase(injector()));
    /*Get list classRoom Usecase */
    injector.registerSingleton<PostClassByTeacherUseCase>(PostClassByTeacherUseCase(injector()));
    /*Post Notification by teacher Usecase */
    injector.registerSingleton<PostNotificationByTeacherUseCase>(PostNotificationByTeacherUseCase(injector()));
    /*post notification read Usecase */
    injector.registerSingleton<PostNotificationReadUseCase>(PostNotificationReadUseCase(injector()));
    /*Post pickup card */
    injector.registerSingleton<PostPickUpUseCase>(PostPickUpUseCase(injector()));
    /*delete pickup card */
    injector.registerSingleton<DeletePickupCardUseCase>(DeletePickupCardUseCase(injector()));
  }
}
