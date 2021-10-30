import 'package:children_pickup_monitoring/common/core/params/get_parents_request.dart';
import 'package:children_pickup_monitoring/common/core/params/params.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/data/models/parent_model.dart';

abstract class PupilByParentRepository {
  // API methods
  Future<DataState<List<PupilModel>>> getPupils(PupilByParentRequest query);
}