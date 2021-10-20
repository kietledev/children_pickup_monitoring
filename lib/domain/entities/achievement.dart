import 'package:equatable/equatable.dart';

class Achievement extends Equatable {
  final int? achievementId;
  final String? achievementTitle;
  final String? achievementTitleEn;
  final String? achievementBriefDescription;
  final String? achievementBriefDescriptionEn;
  final String? achievementDescription;
  final String? achievementDescriptionEn;
  final String? achievementDate;
  final String? achievementThumbnail;
  final String? achievementClip;
  final int? pupilId;
  final String? currentLastName;
  final String? currentFirstName;
  final String? currentMiddleName;
  final int? createdByStaffId;
  final String? createdDatetime;
  final int? updatedByStaffId;
  final String? updatedDatetime;
  final String? publiclyViewable;
  final String? visibled;

  const Achievement({
    this.achievementId,
    this.achievementTitle,
    this.achievementTitleEn,
    this.achievementBriefDescription,
    this.achievementBriefDescriptionEn,
    this.achievementDescription,
    this.achievementDescriptionEn,
    this.achievementDate,
    this.achievementThumbnail,
    this.achievementClip,
    this.pupilId,
    this.currentLastName,
    this.currentFirstName,
    this.currentMiddleName,
    this.createdByStaffId,
    this.createdDatetime,
    this.updatedByStaffId,
    this.updatedDatetime,
    this.publiclyViewable,
    this.visibled,
  });

  @override
  List<Object?> get props => [
        achievementId,
        achievementTitle,
        achievementTitleEn,
        achievementBriefDescription,
        achievementBriefDescriptionEn,
        achievementDescription,
        achievementDescriptionEn,
        achievementDate,
        achievementThumbnail,
        achievementClip,
        pupilId,
        currentLastName,
        currentFirstName,
        currentMiddleName,
        createdByStaffId,
        createdDatetime,
        updatedByStaffId,
        updatedDatetime,
        publiclyViewable,
        visibled,
      ];

  @override
  bool get stringify => true;
}
