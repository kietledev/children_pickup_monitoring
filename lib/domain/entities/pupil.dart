import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class Pupil extends Equatable {
  final String? className;
  final int? pupilId;
  final String? currentLastNameParent;
  final String? currentFirstNameParent;
  final String? currentMiddleNameParent;
  final Person? personDetail;

  const Pupil({
    this.className,
    this.pupilId,
    this.currentLastNameParent,
    this.currentFirstNameParent,
    this.currentMiddleNameParent,
    this.personDetail,
  });

  @override
  List<Object> get props {
    return [
      className!,
      pupilId!,
      currentLastNameParent!,
      currentFirstNameParent!,
      currentMiddleNameParent!,
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
