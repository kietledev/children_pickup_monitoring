import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class UserByPerson extends Equatable {
  final int? userId;
  final Person? personDetail;

  const UserByPerson(
      {
        this.userId,
        this.personDetail
      });

  @override
  List<Object> get props {
    return [
      userId!,
      personDetail!,
    ];
  }

  @override
  bool get stringify => true;

  String getFullName() {
    if (personDetail!.currentMiddleName!.isEmpty) {
      return '${personDetail!.currentLastName!.trim()} ${personDetail!.currentFirstName!.trim()}';
    } else {
      return personDetail!.currentLastName!.trim() +
          ' ' +
          personDetail!.currentMiddleName!.trim() +
          ' ' +
          personDetail!.currentFirstName!.trim();
    }
  }
}
