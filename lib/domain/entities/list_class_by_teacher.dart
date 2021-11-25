
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class ClassByTeacher extends Equatable {
  final int? classId;
  final String? className;

  const ClassByTeacher(
      {
        this.classId,
        this.className,
      });

  @override
  List<Object> get props {
    return [
      className!,
      classId!,

    ];
  }

  @override
  bool get stringify => true;

}
