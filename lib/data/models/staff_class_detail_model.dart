import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/entities/pupil.dart';
import 'package:children_pickup_monitoring/domain/entities/staff_class_detail.dart';

class StaffClassDetailModel extends StaffClassDetail {
  const StaffClassDetailModel({
    double? classId,
    String? className,
    String? facilityName,
  }) : super(
    classId: classId,
    className: className,
    facilityName: facilityName,
  );

  factory StaffClassDetailModel.fromJson(Map<String, dynamic> json) {
    return StaffClassDetailModel(
      classId: json['CLASS_ID'] as double? ?? -1.0,
      className: json['CLASS_NAME'] as String? ?? '',
      facilityName: json['FACILITY_NAME'] as String? ?? '',

    );
  }
  factory StaffClassDetailModel.json(Map<String, dynamic> json) {
    return StaffClassDetailModel(
      classId: json['CLASS_ID'] as double? ?? -1.0,
      // classId: json['CLASS_ID'] as int? ?? -1,
      className: json['CLASS_NAME'] as String? ?? '',
      facilityName: json['FACILITY_NAME'] as String? ?? '',
    );
  }


}
