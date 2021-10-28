
import 'package:children_pickup_monitoring/common/core/params/get_relationship_type_request.dart';
import 'package:children_pickup_monitoring/common/core/params/get_users_by_person.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';


abstract class RelationshipTypeRepository {
  // API methods
  Future<DataState<List<RelationshipTypeModel>>> getRelationshipType(GetRelationshipTypeRequest query);
}