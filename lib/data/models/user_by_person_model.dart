import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/entities/teacher.dart';

class UserByPersonModel extends UserByPerson{
  const UserByPersonModel({
    int? userId,
    PersonModel? personDetail
  }) : super(
      userId: userId,
      personDetail: personDetail
  );

  factory UserByPersonModel.fromJson(Map<String, dynamic> json) {
    var personDetail = json['PERSON_DETAIL'];
    PersonModel person = PersonModel.fromJson(personDetail);
    return UserByPersonModel(
        userId: (json['USER_ID'] as double? ?? -1.0).toInt(),
        personDetail: person

    );
  }
}
