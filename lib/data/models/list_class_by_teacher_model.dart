
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/entities/parent.dart';

class ClassByTeacherModel extends ClassByTeacher{
  const ClassByTeacherModel({
    int? classId,
    String? className,
  }) : super(
      classId: classId,
      className: className
  );

  factory ClassByTeacherModel.fromJson(Map<String, dynamic> json) {
    return ClassByTeacherModel(
        classId: (json['CLASS_ID'] as double? ?? -1.0).toInt(),
       className: json['CLASS_NAME'] as String? ?? '',

    );
  }
}