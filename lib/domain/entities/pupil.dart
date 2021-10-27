import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class Pupil extends Equatable {
  final String? className;
  final int? pupilId;
  final String? currentLastNameParent;
  final String? currentFirstNameParent;
  final String? currentMiddleNameParent;
  final String? currentPhoneNumber1Parent;
  final String? currentPhoneNumber2Parent;
  final Person? personDetail;

  const Pupil({
    this.className,
    this.pupilId,
    this.currentLastNameParent,
    this.currentFirstNameParent,
    this.currentMiddleNameParent,
    this.currentPhoneNumber1Parent,
    this.currentPhoneNumber2Parent,
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
      currentPhoneNumber1Parent!,
      currentPhoneNumber2Parent!,
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
  String getFullNameParent() {
    if (currentMiddleNameParent!.isEmpty) {
      return '${currentLastNameParent!.trim()} ${currentFirstNameParent!.trim()}';
    } else {
      return currentLastNameParent!.trim() +
          ' ' +
         currentMiddleNameParent!.trim() +
          ' ' +
          currentFirstNameParent!.trim();
    }
  }
}
