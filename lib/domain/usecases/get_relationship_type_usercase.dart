import 'package:children_pickup_monitoring/common/core/params/get_relationship_type_request.dart';
import 'package:children_pickup_monitoring/common/core/params/get_users_by_person.dart';
import 'package:children_pickup_monitoring/common/core/resources/resources.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/common/core/usecase/usecase.dart';
import 'package:children_pickup_monitoring/domain/repositories/repositories.dart';
class GetRelationshipTypeUseCase implements UseCase<DataState<List<RelationshipTypeModel>>, GetRelationshipTypeRequest> {
  final RelationshipTypeRepository _relationshipTypeRepository;

  GetRelationshipTypeUseCase(this._relationshipTypeRepository);

  @override
  Future<DataState<List<RelationshipTypeModel>>> call({GetRelationshipTypeRequest? params}) {
    return _relationshipTypeRepository.getRelationshipType(params!);
  }
}
