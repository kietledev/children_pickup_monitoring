import 'package:children_pickup_monitoring/domain/entities/entities.dart';
class PersonModel extends Person {
  const PersonModel(
      { required personId,
        String? employeeIdNumber,
        double? currentPersonalTitleId,
        String? currentPersonalTitle,
        String? currentPersonalTitleEn,
        double? academicTitleId,
        String? academicTitle,
        String? academicTitleEn,
        String? currentLastName,
        String? currentFirstName,
        String? currentMiddleName,
        String? currentNickname,
        double? currentGenderId,
        String? currentGender,
        String? currentGenderEn,
        String? birthDate,
        String? birthPlace,
        String? birthPlaceCity,
        String? birthPlaceProvince,
        String? birthPlaceState,
        String? birthPlaceCountry,
        double? currentMaritalStatusId,
        String? currentMaritalStatus,
        String? currentMaritalStatusEn,
        String? currentPeopleIdNumber,
        String? currentPeopleIdIssueDate,
        String? currentPeopleIdIssuePlace,
        String? currentSocialSecurityNumber,
        String? currentMajorCitizenship,
        String? currentPassportNumber,
        String? currentPassportIssuePlace,
        String? currentPassportIssueDate,
        String? currentPassportExpirationDate,
        String? homeAddress1,
        String? homeAddress2,
        String? homeWard,
        String? homeDistrict,
        String? homeCity,
        String? homeProvince,
        String? homeState,
        String? homeCountry,
        String? homePostalCode,
        String? currentAddress1,
        String? currentAddress2,
        String? currentWard,
        String? currentDistrict,
        String? currentCity,
        String? currentProvince,
        String? currentState,
        String? currentCountry,
        String? currentPostalCode,
        String? comments,
        String? commentsEn,
        String? closeupPicture1,
        String? closeupPicture2,
        String? avatarPicture,
        String? signatureImage,
        String? createdDatetime,
        double? createdByUserId,
        String? updatedDatetime,
        double? updatedByUserId,
        String? currentEmail,
        String? currentPhoneNumber1,
        String? currentPhoneNumber2,
      })
      : super(
    personId:personId,
    employeeIdNumber:employeeIdNumber,
    currentPersonalTitleId:currentPersonalTitleId,
    currentPersonalTitle:currentPersonalTitle,
    currentPersonalTitleEn:currentPersonalTitleEn,
    academicTitleId:academicTitleId,
    academicTitle:academicTitle,
    academicTitleEn:academicTitleEn,
    currentLastName:currentLastName,
    currentFirstName:currentFirstName,
    currentMiddleName:currentMiddleName,
    currentNickname:currentNickname,
    currentGenderId:currentGenderId,
    currentGender:currentGender,
    currentGenderEn:currentGenderEn,
    birthDate:birthDate,
    birthPlace:birthPlace,
    birthPlaceCity:birthPlaceCity,
    birthPlaceProvince:birthPlaceProvince,
    birthPlaceState:birthPlaceState,
    birthPlaceCountry:birthPlaceCountry,
    currentMaritalStatusId:currentMaritalStatusId,
    currentMaritalStatus:currentMaritalStatus,
    currentMaritalStatusEn:currentMaritalStatusEn,
    currentPeopleIdNumber:currentPeopleIdNumber,
    currentPeopleIdIssueDate: currentPeopleIdIssueDate,
    currentPeopleIdIssuePlace: currentPeopleIdIssuePlace,
    currentSocialSecurityNumber: currentSocialSecurityNumber,
    currentMajorCitizenship: currentMajorCitizenship,
    currentPassportNumber: currentPassportNumber,
    currentPassportIssuePlace: currentPassportIssuePlace,
    currentPassportIssueDate: currentPassportIssueDate,
    currentPassportExpirationDate: currentPassportExpirationDate,
    homeAddress1: homeAddress1,
    homeAddress2: homeAddress2,
    homeWard: homeWard,
    homeDistrict: homeDistrict,
    homeCity: homeCity,
    homeProvince: homeProvince,
    homeState: homeState,
    homeCountry: homeCountry,
    homePostalCode: homePostalCode,
    currentAddress1: currentAddress1,
    currentAddress2: currentAddress2,
    currentWard: currentWard,
    currentDistrict: currentDistrict,
    currentCity: currentCity,
    currentProvince: currentProvince,
    currentState: currentState,
    currentCountry: currentCountry,
    currentPostalCode:currentPostalCode,
    comments:comments,
    commentsEn: commentsEn,
    closeupPicture1:closeupPicture1,
    closeupPicture2: closeupPicture2,
    avatarPicture:avatarPicture,
    signatureImage:signatureImage,
    createdDatetime:createdDatetime,
    createdByUserId:createdByUserId,
    updatedDatetime: updatedDatetime,
    updatedByUserId: updatedByUserId,
    currentEmail:currentEmail,
    currentPhoneNumber1:currentPhoneNumber1,
    currentPhoneNumber2: currentPhoneNumber2,
  );

  factory PersonModel.fromJson(Map<String, dynamic> map) {
    return PersonModel(
      personId:map['PERSON_ID']as double? ?? 0.0,
      employeeIdNumber:map['EMPLOYEE_ID_NUMBER']as String? ?? "",
      currentPersonalTitleId:map['CURRENT_PERSONAL_TITLE_ID']as double? ?? 0.0,
      currentPersonalTitle:map['CURRENT_PERSONAL_TITLE']as String? ?? "",
      currentPersonalTitleEn:map['CURRENT_PERSONAL_TITLE_EN']as String? ?? "",
      academicTitleId:map['ACADEMIC_TITLE_ID']as double? ?? 0.0,
      academicTitle:map['ACADEMIC_TITLE']as String? ?? "",
      academicTitleEn:map['ACADEMIC_TITLE_EN']as String? ?? "",
      currentLastName:map['CURRENT_LAST_NAME']as String? ?? "",
      currentFirstName:map['CURRENT_FIRST_NAME']as String? ?? "",
      currentMiddleName:map['CURRENT_MIDDLE_NAME']as String? ?? "",
      currentNickname:map['CURRENT_NICKNAME']as String? ?? "",
      currentGenderId:map['CURRENT_GENDER_ID']as double? ?? 0.0,
      currentGender:map['CURRENT_GENDER']as String? ?? "",
      currentGenderEn:map['CURRENT_GENDER_EN']as String? ?? "",
      birthDate:map['BIRTH_DATE']as String? ?? "",
      birthPlace:map['BIRTH_PLACE']as String? ?? "",
      birthPlaceCity:map['BIRTH_PLACE_CITY']as String? ?? "",
      birthPlaceProvince:map['BIRTH_PLACE_PROVINCE']as String? ?? "",
      birthPlaceState:map['BIRTH_PLACE_STATE']as String? ?? "",
      birthPlaceCountry:map['BIRTH_PLACE_COUNTRY']as String? ?? "",
      currentMaritalStatusId:map['CURRENT_MARITAL_STATUS_ID']as double? ?? 0.0,
      currentMaritalStatus:map['CURRENT_MARITAL_STATUS']as String? ?? "",
      currentMaritalStatusEn:map['CURRENT_MARITAL_STATUS_EN']as String? ?? "",
      currentPeopleIdNumber:map['CURRENT_PEOPLE_ID_NUMBER']as String? ?? "",
      currentPeopleIdIssueDate: map['CURRENT_PEOPLE_ID_ISSUE_DATE']as String? ?? "",
      currentPeopleIdIssuePlace: map['CURRENT_PEOPLE_ID_ISSUE_PLACE']as String? ?? "",
      currentSocialSecurityNumber: map['CURRENT_SOCIAL_SECURITY_NUMBER']as String? ?? "",
      currentMajorCitizenship: map['CURRENT_MAJOR_CITIZENSHIP']as String? ?? "",
      currentPassportNumber: map['CURRENT_PASSPORT_NUMBER']as String? ?? "",
      currentPassportIssuePlace: map['CURRENT_PASSPORT_ISSUE_PLACE']as String? ?? "",
      currentPassportIssueDate: map['CURRENT_PASSPORT_ISSUE_DATE']as String? ?? "",
      currentPassportExpirationDate: map['CURRENT_PASSPORT_EXPIRATION_DATE']as String? ?? "",
      homeAddress1: map['HOME_ADDRESS_1']as String? ?? "",
      homeAddress2: map['HOME_ADDRESS_2']as String? ?? "",
      homeWard: map['HOME_WARD']as String? ?? "",
      homeDistrict: map['HOME_DISTRICT']as String? ?? "",
      homeCity: map['HOME_CITY']as String? ?? "",
      homeProvince: map['HOME_PROVINCE']as String? ?? "",
      homeState: map['HOME_STATE']as String? ?? "",
      homeCountry: map['HOME_COUNTRY']as String? ?? "",
      homePostalCode: map['HOME_POSTAL_CODE']as String? ?? "",
      currentAddress1: map['CURRENT_ADDRESS_1']as String? ?? "",
      currentAddress2: map['CURRENT_ADDRESS_2']as String? ?? "",
      currentWard: map['CURRENT_WARD']as String? ?? "",
      currentDistrict: map['CURRENT_DISTRICT']as String? ?? "",
      currentCity: map['CURRENT_CITY']as String? ?? "",
      currentProvince: map['CURRENT_PROVINCE']as String? ?? "",
      currentState: map['CURRENT_STATE']as String? ?? "",
      currentCountry: map['CURRENT_COUNTRY']as String? ?? "",
      currentPostalCode:map['CURRENT_POSTAL_CODE']as String? ?? "",
      comments:map['COMMENTS']as String? ?? "",
      commentsEn: map['COMMENTS_EN']as String? ?? "",
      closeupPicture1:map['CLOSEUP_PICTURE_1']as String? ?? "",
      closeupPicture2: map['CLOSEUP_PICTURE_2']as String? ?? "",
      avatarPicture:map['AVATAR_PICTURE']as String? ?? "",
      signatureImage:map['SIGNATURE_IMAGE']as String? ?? "",
      createdDatetime:map['CREATED_DATETIME']as String? ?? "",
      createdByUserId:map['CREATED_BY_USER_ID']as double? ?? 0.0,
      updatedDatetime: map['UPDATED_DATETIME']as String? ?? "",
      updatedByUserId: map['UPDATED_BY_USER_ID']as double? ?? 0.0,
      currentEmail:map['CURRENT_EMAIL']as String? ?? "",
      currentPhoneNumber1:map['CURRENT_PHONE_NUMBER_1']as String? ?? "",
      currentPhoneNumber2:map['CURRENT_PHONE_NUMBER_2']as String? ?? "",
    );
  }

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

  };
}
