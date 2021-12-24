import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/params/post_update_profile_pupil_request.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';

abstract class PupilsRepository {
  Future<DataState<List<Pupil>>> postPupil(PostPupilsRequest params);
  Future<DataState<List<Pupil>>> postUpdateProfilePupil(PostUpdateProfilePupilRequest params);
}
