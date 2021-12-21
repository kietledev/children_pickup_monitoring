import 'package:children_pickup_monitoring/common/constants/db_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

class StaffClassDetail extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final double? classId;
  final String? className;
  final String? facilityName;

  const StaffClassDetail({
    this.classId,
    this.className,
    this.facilityName,
  });

  @override
  List<Object> get props {
    return [
      classId!,
      className!,
      facilityName!,
    ];
  }
  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() => <String, dynamic>{
    "CLASS_ID": classId,
    "CLASS_NAME": className,
    "FACILITY_NAME": facilityName,

  };

}
