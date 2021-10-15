import 'package:children_pickup_monitoring/common/constants/db_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: DBConstants.kPersonTableName)
class Person extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final double personId;
  final String? employeeIdNumber;
  final double? currentPersonalTitleId;
  final String? currentPersonalTitle;
  final String? currentPersonalTitleEn;
  final double? academicTitleId;
  final String? academicTitle;
  final String? academicTitleEn;
  final String? currentLastName;
  final String? currentFirstName;
  final String? currentMiddleName;
  final String? currentNickname;
  final double? currentGenderId;
  final String? currentGender;
  final String? currentGenderEn;
  final String? birthDate;
  final String? birthPlace;
  final String? birthPlaceCity;
  final String? birthPlaceProvince;
  final String? birthPlaceState;
  final String? birthPlaceCountry;
  final double? currentMaritalStatusId;
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
  final double? createdByUserId;
  final String? updatedDatetime;
  final double? updatedByUserId;
  final String? currentEmail;
  final String? currentPhoneNumber1;
  final String? currentPhoneNumber2;

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
    this.currentPhoneNumber2});
  String getFullName() {
    if (currentMiddleName!.isEmpty) {
      return '${currentLastName!.trim()} ${currentFirstName!.trim()}';
    } else {
      return '${currentLastName!.trim()} ${currentMiddleName!.trim()} ${currentFirstName!.trim()}';
    }
  }
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
    ];
  }

  @override
  bool get stringify => true;


}
