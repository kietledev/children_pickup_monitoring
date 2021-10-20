import 'package:children_pickup_monitoring/domain/entities/achievement.dart';

class AchievementModel extends Achievement {
  const AchievementModel({
    int? achievementId,
    String? achievementTitle,
    String? achievementTitleEn,
    String? achievementBriefDescription,
    String? achievementBriefDescriptionEn,
    String? achievementDescription,
    String? achievementDescriptionEn,
    String? achievementDate,
    String? achievementThumbnail,
    String? achievementClip,
    int? pupilId,
    String? currentLastName,
    String? currentFirstName,
    String? currentMiddleName,
    int? createdByStaffId,
    String? createdDatetime,
    int? updatedByStaffId,
    String? updatedDatetime,
    String? publiclyViewable,
    String? visibled,
  }) : super(
            achievementId: achievementId,
            achievementTitle: achievementTitle,
            achievementTitleEn: achievementTitleEn,
            achievementBriefDescription: achievementBriefDescription,
            achievementBriefDescriptionEn: achievementBriefDescriptionEn,
            achievementDescription: achievementDescription,
            achievementDescriptionEn: achievementDescriptionEn,
            achievementDate: achievementDate,
            achievementThumbnail: achievementThumbnail,
            achievementClip: achievementClip,
            pupilId: pupilId,
            currentLastName: currentLastName,
            currentFirstName: currentFirstName,
            currentMiddleName: currentMiddleName,
            createdByStaffId: createdByStaffId,
            createdDatetime: createdDatetime,
            updatedByStaffId: updatedByStaffId,
            updatedDatetime: updatedDatetime,
            publiclyViewable: publiclyViewable,
            visibled: visibled);

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return AchievementModel(
      achievementId: (json['ACHIEVEMENT_ID'] as double? ?? -1.0).toInt(),
      achievementTitle: json['ACHIEVEMENT_TITLE'] as String? ?? '',
      achievementTitleEn: json['ACHIEVEMENT_TITLE_EN'] as String? ?? '',
      achievementBriefDescription:
          json['ACHIEVEMENT_BRIEF_DESCRIPTION'] as String? ?? '',
      achievementBriefDescriptionEn:
          json['ACHIEVEMENT_BRIEF_DESCRIPTION_EN'] as String? ?? '',
      achievementDescription: json['ACHIEVEMENT_DESCRIPTION'] as String? ?? '',
      achievementDescriptionEn:
          json['ACHIEVEMENT_DESCRIPTION_EN'] as String? ?? '',
      achievementDate: json['ACHIEVEMENT_DATE'] as String? ?? '',
      achievementThumbnail: json['ACHIEVEMENT_THUMBNAIL'] as String? ?? '',
      achievementClip: json['ACHIEVEMENT_CLIP'] as String? ?? '',
      pupilId: (json['PUPIL_ID'] as double? ?? -1.0).toInt(),
      currentLastName: json['CURRENT_LAST_NAME'] as String? ?? '',
      currentFirstName: json['CURRENT_FIRST_NAME'] as String? ?? '',
      currentMiddleName: json['CURRENT_MIDDLE_NAME'] as String? ?? '',
      createdByStaffId:
          (json['CREATED_BY_STAFF_ID'] as double? ?? -1.0).toInt(),
      createdDatetime: json['CREATED_DATETIME'] as String? ?? '',
      updatedByStaffId:
          (json['UPDATED_BY_STAFF_ID'] as double? ?? -1.0).toInt(),
      updatedDatetime: json['UPDATED_DATETIME'] as String? ?? '',
      publiclyViewable: json['PUBLICLY_VIEWABLE'] as String? ?? '',
      visibled: json['VISIBLED'] as String? ?? '',
    );
  }
}
