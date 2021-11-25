import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';

abstract class ClassByTeacherRepository {
  // API methods
  Future<DataState<List<ClassByTeacherModel>>> postListClassByTeacher(PostClassByTeacherRequest query);
}