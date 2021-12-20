import 'package:children_pickup_monitoring/common/constants/db_constants.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/domain/entities/staff_class_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: DBConstants.kPersonTableName)
class Person extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int personId;
  final String? employeeIdNumber;
  final int? currentPersonalTitleId;
  final String? currentPersonalTitle;
  final String? currentPersonalTitleEn;
  final int? academicTitleId;
  final String? academicTitle;
  final String? academicTitleEn;
  final String? currentLastName;
  final String? currentFirstName;
  final String? currentMiddleName;
  final String? currentNickname;
  final int? currentGenderId;
  final String? currentGender;
  final String? currentGenderEn;
  final String? birthDate;
  final String? birthPlace;
  final String? birthPlaceCity;
  final String? birthPlaceProvince;
  final String? birthPlaceState;
  final String? birthPlaceCountry;
  final int? currentMaritalStatusId;
  final String? currentMaritalStatus;
  final String? currentMaritalStatusEn;
  final String? currentPeopleIdNumber;
  final String? currentPeopleIdIssueDate;
  final String? currentPeopleIdIssuePlace;
  final String? currentSocialSecurityNumber;
  final String? currentMajorCitizenship;
  final String? currentPassportNumber;
  final String? currentPassportIssuePlace;
  final String? currentPassportIssueDate;
  final String? currentPassportExpirationDate;
  final String? homeAddress1;
  final String? homeAddress2;
  final String? homeWard;
  final String? homeDistrict;
  final String? homeCity;
  final String? homeProvince;
  final String? homeState;
  final String? homeCountry;
  final String? homePostalCode;
  final String? currentAddress1;
  final String? currentAddress2;
  final String? currentWard;
  final String? currentDistrict;
  final String? currentCity;
  final String? currentProvince;
  final String? currentState;
  final String? currentCountry;
  final String? currentPostalCode;
  final String? comments;
  final String? commentsEn;
  final String? closeupPicture1;
  final String? closeupPicture2;
  final String? avatarPicture;
  final String? signatureImage;
  final String? createdDatetime;
  final int? createdByUserId;
  final String? updatedDatetime;
  final int? updatedByUserId;
  final String? currentEmail;
  final String? currentPhoneNumber1;
  final String? currentPhoneNumber2;
  final int? staffId;
  final List<StaffClassDetail>? staffClassDetail;

  const Person({
    required this.personId,
    this.employeeIdNumber,
    this.currentPersonalTitleId,
    this.currentPersonalTitle,
    this.currentPersonalTitleEn,
    this.academicTitleId,
    this.academicTitle,
    this.academicTitleEn,
    this.currentLastName,
    this.currentFirstName,
    this.currentMiddleName,
    this.currentNickname,
    this.currentGenderId,
    this.currentGender,
    this.currentGenderEn,
    this.birthDate,
    this.birthPlace,
    this.birthPlaceCity,
    this.birthPlaceProvince,
    this.birthPlaceState,
    this.birthPlaceCountry,
    this.currentMaritalStatusId,
    this.currentMaritalStatus,
    this.currentMaritalStatusEn,
    this.currentPeopleIdNumber,
    this.currentPeopleIdIssueDate,
    this.currentPeopleIdIssuePlace,
    this.currentSocialSecurityNumber,
    this.currentMajorCitizenship,
    this.currentPassportNumber,
    this.currentPassportIssuePlace,
    this.currentPassportIssueDate,
    this.currentPassportExpirationDate,
    this.homeAddress1,
    this.homeAddress2,
    this.homeWard,
    this.homeDistrict,
    this.homeCity,
    this.homeProvince,
    this.homeState,
    this.homeCountry,
    this.homePostalCode,
    this.currentAddress1,
    this.currentAddress2,
    this.currentWard,
    this.currentDistrict,
    this.currentCity,
    this.currentProvince,
    this.currentState,
    this.currentCountry,
    this.currentPostalCode,
    this.comments,
    this.commentsEn,
    this.closeupPicture1,
    this.closeupPicture2,
    this.avatarPicture,
    this.signatureImage,
    this.createdDatetime,
    this.createdByUserId,
    this.updatedDatetime,
    this.updatedByUserId,
    this.currentEmail,
    this.currentPhoneNumber1,
    this.currentPhoneNumber2,
    this.staffId,
    this.staffClassDetail
  });
  String getFullName() {
    if (currentMiddleName!.isEmpty) {
      return '${currentLastName!.trim()} ${currentFirstName!.trim()}';
    } else {
      return '${currentLastName!.trim()} ${currentMiddleName!.trim()} ${currentFirstName!.trim()}';
    }
  }
  static const empty = Person(personId: -1);

  bool get isEmpty => this == Person.empty;

  bool get isNotEmpty => this != Person.empty;
  @override
  List<Object> get props {
    return [
      personId,
      employeeIdNumber!,
      currentPersonalTitleId!,
      currentPersonalTitle!,
      currentPersonalTitleEn!,
      academicTitleId!,
      academicTitle!,
      academicTitleEn!,
      currentLastName!,
      currentFirstName!,
      currentMiddleName!,
      currentNickname!,
      currentGenderId!,
      currentGender!,
      currentGenderEn!,
      birthDate!,
      birthPlace!,
      birthPlaceCity!,
      birthPlaceProvince!,
      birthPlaceState!,
      birthPlaceCountry!,
      currentMaritalStatusId!,
      currentMaritalStatus!,
      currentMaritalStatusEn!,
      currentPeopleIdNumber!,
      currentPeopleIdIssueDate!,
      currentPeopleIdIssuePlace!,
      currentSocialSecurityNumber!,
      currentMajorCitizenship!,
      currentPassportNumber!,
      currentPassportIssuePlace!,
      currentPassportIssueDate!,
      currentPassportExpirationDate!,
      homeAddress1!,
      homeAddress2!,
      homeWard!,
      homeDistrict!,
      homeCity!,
      homeProvince!,
      homeState!,
      homeCountry!,
      homePostalCode!,
      currentAddress1!,
      currentAddress2!,
      currentWard!,
      currentDistrict!,
      currentCity!,
      currentProvince!,
      currentState!,
      currentCountry!,
      currentPostalCode!,
      comments!,
      commentsEn!,
      closeupPicture1!,
      closeupPicture2!,
      avatarPicture!,
      signatureImage!,
      createdDatetime!,
      createdByUserId!,
      updatedDatetime!,
      updatedByUserId!,
      currentEmail!,
      currentPhoneNumber1!,
      currentPhoneNumber2!,
      staffId!,
      staffClassDetail!
    ];
  }

  @override
  bool get stringify => true;


  Map<String, dynamic> toJson() => <String, dynamic>{
    "PERSON_ID": personId,
    "EMPLOYEE_ID_NUMBER":employeeIdNumber,
    "CURRENT_PERSONAL_TITLE_ID":currentPersonalTitleId,
    "CURRENT_PERSONAL_TITLE":currentPersonalTitle,
    "CURRENT_PERSONAL_TITLE_EN":currentPersonalTitleEn,
    "ACADEMIC_TITLE_ID":academicTitleId,
    "ACADEMIC_TITLE":academicTitle,
    "ACADEMIC_TITLE_EN":academicTitleEn,
    "CURRENT_LAST_NAME":currentLastName,
    "CURRENT_FIRST_NAME":currentFirstName,
    "CURRENT_MIDDLE_NAME":currentMiddleName,
    "CURRENT_NICKNAME":currentNickname,
    "CURRENT_GENDER_ID":currentGenderId,
    "CURRENT_GENDER":currentGender,
    "CURRENT_GENDER_EN":currentGenderEn,
    "BIRTH_DATE":birthDate,
    "BIRTH_PLACE":birthPlace,
    "BIRTH_PLACE_CITY":birthPlaceCity,
    "BIRTH_PLACE_PROVINCE":birthPlaceProvince,
    "BIRTH_PLACE_STATE":birthPlaceState,
    "BIRTH_PLACE_COUNTRY":birthPlaceCountry,
    "CURRENT_MARITAL_STATUS_ID":currentMaritalStatusId,
    "CURRENT_MARITAL_STATUS":currentMaritalStatus,
    "CURRENT_MARITAL_STATUS_EN":currentMaritalStatusEn,
    "CURRENT_PEOPLE_ID_NUMBER":currentPeopleIdNumber,
    "CURRENT_PEOPLE_ID_ISSUE_DATE":currentPeopleIdIssueDate,
    "CURRENT_PEOPLE_ID_ISSUE_PLACE":currentPeopleIdIssuePlace,
    "CURRENT_SOCIAL_SECURITY_NUMBER":currentSocialSecurityNumber,
    "CURRENT_MAJOR_CITIZENSHIP":currentMajorCitizenship,
    "CURRENT_PASSPORT_NUMBER":currentPassportNumber,
    "CURRENT_PASSPORT_ISSUE_PLACE":currentPassportIssuePlace,
    "CURRENT_PASSPORT_ISSUE_DATE":currentPassportIssueDate,
    "CURRENT_PASSPORT_EXPIRATION_DATE":currentPassportExpirationDate,
    "HOME_ADDRESS_1":homeAddress1,
    "HOME_ADDRESS_2":homeAddress2,
    "HOME_WARD":homeWard,
    "HOME_DISTRICT":homeDistrict,
    "HOME_CITY":homeCity,
    "HOME_PROVINCE":homeProvince,
    "HOME_STATE":homeState,
    "HOME_COUNTRY":homeCountry,
    "HOME_POSTAL_CODE":homePostalCode,
    "CURRENT_ADDRESS_1":currentAddress1,
    "CURRENT_ADDRESS_2":currentAddress2,
    "CURRENT_WARD":currentWard,
    "CURRENT_DISTRICT":currentDistrict,
    "CURRENT_CITY":currentCity,
    "CURRENT_PROVINCE":currentProvince,
    "CURRENT_STATE":currentState,
    "CURRENT_COUNTRY":currentCountry,
    "CURRENT_POSTAL_CODE":currentPostalCode,
    "COMMENTS":comments,
    "COMMENTS_EN":commentsEn,
    "CLOSEUP_PICTURE_1":closeupPicture1,
    "CLOSEUP_PICTURE_2":closeupPicture2,
    "AVATAR_PICTURE":avatarPicture,
    "SIGNATURE_IMAGE":signatureImage,
    "CREATED_DATETIME":createdDatetime,
    "CREATED_BY_USER_ID":createdByUserId,
    "UPDATED_DATETIME":updatedDatetime,
    "UPDATED_BY_USER_ID":updatedByUserId,
    "CURRENT_EMAIL":currentEmail,
    "CURRENT_PHONE_NUMBER_1":currentPhoneNumber1,
    "CURRENT_PHONE_NUMBER_2":currentPhoneNumber2,
    "STAFF_ID":staffId,
    "StaffClassDetail":staffClassDetail,
  };
}
