// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _appUserDaoInstance;

  QRGeneratedDao? _appQRGeneratedDaoInstance;

  PersonDao? _appPersonDaoInstance;

  ParentDao? _appParentDaoInstance;

  PupilDao? _appPupilDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user_table` (`userId` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `personId` INTEGER NOT NULL, `currentFirstName` TEXT NOT NULL, `currentLastName` TEXT NOT NULL, `currentMiddleName` TEXT, `loginTime` TEXT NOT NULL, `roleId` INTEGER NOT NULL, `roleName` TEXT NOT NULL, `roleAllowAdd` INTEGER NOT NULL, `roleAllowUpdate` INTEGER NOT NULL, `roleAllowDelete` INTEGER NOT NULL, `fromParentId` INTEGER NOT NULL, `toPupilId` INTEGER NOT NULL, `staffIdNumber` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `qrgenerated_table` (`requestId` INTEGER PRIMARY KEY AUTOINCREMENT, `timePickUp` TEXT, `pupilId1` INTEGER, `pupilId2` INTEGER, `pupilId3` INTEGER, `cardId` TEXT, `datePickUp` TEXT, `placePickUp` TEXT, `parentId` INTEGER, `addressSchool` TEXT, `stringQrcode` TEXT, `status` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `person_table` (`personId` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `employeeIdNumber` TEXT, `currentPersonalTitleId` INTEGER, `currentPersonalTitle` TEXT, `currentPersonalTitleEn` TEXT, `academicTitleId` INTEGER, `academicTitle` TEXT, `academicTitleEn` TEXT, `currentLastName` TEXT, `currentFirstName` TEXT, `currentMiddleName` TEXT, `currentNickname` TEXT, `currentGenderId` INTEGER, `currentGender` TEXT, `currentGenderEn` TEXT, `birthDate` TEXT, `birthPlace` TEXT, `birthPlaceCity` TEXT, `birthPlaceProvince` TEXT, `birthPlaceState` TEXT, `birthPlaceCountry` TEXT, `currentMaritalStatusId` INTEGER, `currentMaritalStatus` TEXT, `currentMaritalStatusEn` TEXT, `currentPeopleIdNumber` TEXT, `currentPeopleIdIssueDate` TEXT, `currentPeopleIdIssuePlace` TEXT, `currentSocialSecurityNumber` TEXT, `currentMajorCitizenship` TEXT, `currentPassportNumber` TEXT, `currentPassportIssuePlace` TEXT, `currentPassportIssueDate` TEXT, `currentPassportExpirationDate` TEXT, `homeAddress1` TEXT, `homeAddress2` TEXT, `homeWard` TEXT, `homeDistrict` TEXT, `homeCity` TEXT, `homeProvince` TEXT, `homeState` TEXT, `homeCountry` TEXT, `homePostalCode` TEXT, `currentAddress1` TEXT, `currentAddress2` TEXT, `currentWard` TEXT, `currentDistrict` TEXT, `currentCity` TEXT, `currentProvince` TEXT, `currentState` TEXT, `currentCountry` TEXT, `currentPostalCode` TEXT, `comments` TEXT, `commentsEn` TEXT, `closeupPicture1` TEXT, `closeupPicture2` TEXT, `avatarPicture` TEXT, `signatureImage` TEXT, `createdDatetime` TEXT, `createdByUserId` INTEGER, `updatedDatetime` TEXT, `updatedByUserId` INTEGER, `currentEmail` TEXT, `currentPhoneNumber1` TEXT, `currentPhoneNumber2` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `parent_table` (`parentId` INTEGER PRIMARY KEY AUTOINCREMENT, `personToPersonPersonalRelationshipTypeName` TEXT, `personToPersonPersonalRelationshipTypeNameEn` TEXT, `approved` INTEGER, `approvedByUserId` INTEGER, `approvedDatetime` TEXT, `personId` INTEGER, `accountUser` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `pupil_table` (`pupilId` INTEGER PRIMARY KEY AUTOINCREMENT, `className` TEXT, `classId` INTEGER, `personToPersonPersonalRelationshipTypeName` TEXT, `personToPersonPersonalRelationshipTypeNameEn` TEXT, `currentLastNameParent` TEXT, `currentFirstNameParent` TEXT, `currentMiddleNameParent` TEXT, `currentPhoneNumber1Parent` TEXT, `currentPhoneNumber2Parent` TEXT, `personId` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get appUserDao {
    return _appUserDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  QRGeneratedDao get appQRGeneratedDao {
    return _appQRGeneratedDaoInstance ??=
        _$QRGeneratedDao(database, changeListener);
  }

  @override
  PersonDao get appPersonDao {
    return _appPersonDaoInstance ??= _$PersonDao(database, changeListener);
  }

  @override
  ParentDao get appParentDao {
    return _appParentDaoInstance ??= _$ParentDao(database, changeListener);
  }

  @override
  PupilDao get appPupilDao {
    return _appPupilDaoInstance ??= _$PupilDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'user_table',
            (User item) => <String, Object?>{
                  'userId': item.userId,
                  'personId': item.personId,
                  'currentFirstName': item.currentFirstName,
                  'currentLastName': item.currentLastName,
                  'currentMiddleName': item.currentMiddleName,
                  'loginTime': item.loginTime,
                  'roleId': item.roleId,
                  'roleName': item.roleName,
                  'roleAllowAdd': item.roleAllowAdd ? 1 : 0,
                  'roleAllowUpdate': item.roleAllowUpdate ? 1 : 0,
                  'roleAllowDelete': item.roleAllowDelete ? 1 : 0,
                  'fromParentId': item.fromParentId,
                  'toPupilId': item.toPupilId,
                  'staffIdNumber': item.staffIdNumber
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'user_table',
            ['userId'],
            (User item) => <String, Object?>{
                  'userId': item.userId,
                  'personId': item.personId,
                  'currentFirstName': item.currentFirstName,
                  'currentLastName': item.currentLastName,
                  'currentMiddleName': item.currentMiddleName,
                  'loginTime': item.loginTime,
                  'roleId': item.roleId,
                  'roleName': item.roleName,
                  'roleAllowAdd': item.roleAllowAdd ? 1 : 0,
                  'roleAllowUpdate': item.roleAllowUpdate ? 1 : 0,
                  'roleAllowDelete': item.roleAllowDelete ? 1 : 0,
                  'fromParentId': item.fromParentId,
                  'toPupilId': item.toPupilId,
                  'staffIdNumber': item.staffIdNumber
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<List<User>> getAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM user_table',
        mapper: (Map<String, Object?> row) => User(
            userId: row['userId'] as int,
            personId: row['personId'] as int,
            currentFirstName: row['currentFirstName'] as String,
            currentLastName: row['currentLastName'] as String,
            currentMiddleName: row['currentMiddleName'] as String?,
            loginTime: row['loginTime'] as String,
            roleId: row['roleId'] as int,
            roleName: row['roleName'] as String,
            roleAllowAdd: (row['roleAllowAdd'] as int) != 0,
            roleAllowUpdate: (row['roleAllowUpdate'] as int) != 0,
            roleAllowDelete: (row['roleAllowDelete'] as int) != 0,
            fromParentId: row['fromParentId'] as int,
            toPupilId: row['toPupilId'] as int,
            staffIdNumber: row['staffIdNumber'] as String));
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteUser(User user) async {
    await _userDeletionAdapter.delete(user);
  }
}

class _$QRGeneratedDao extends QRGeneratedDao {
  _$QRGeneratedDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _tablePickUpGeneratedInsertionAdapter = InsertionAdapter(
            database,
            'qrgenerated_table',
            (TablePickUpGenerated item) => <String, Object?>{
                  'requestId': item.requestId,
                  'timePickUp': item.timePickUp,
                  'pupilId1': item.pupilId1,
                  'pupilId2': item.pupilId2,
                  'pupilId3': item.pupilId3,
                  'cardId': item.cardId,
                  'datePickUp': item.datePickUp,
                  'placePickUp': item.placePickUp,
                  'parentId': item.parentId,
                  'addressSchool': item.addressSchool,
                  'stringQrcode': item.stringQrcode,
                  'status': item.status
                }),
        _tablePickUpGeneratedDeletionAdapter = DeletionAdapter(
            database,
            'qrgenerated_table',
            ['requestId'],
            (TablePickUpGenerated item) => <String, Object?>{
                  'requestId': item.requestId,
                  'timePickUp': item.timePickUp,
                  'pupilId1': item.pupilId1,
                  'pupilId2': item.pupilId2,
                  'pupilId3': item.pupilId3,
                  'cardId': item.cardId,
                  'datePickUp': item.datePickUp,
                  'placePickUp': item.placePickUp,
                  'parentId': item.parentId,
                  'addressSchool': item.addressSchool,
                  'stringQrcode': item.stringQrcode,
                  'status': item.status
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TablePickUpGenerated>
      _tablePickUpGeneratedInsertionAdapter;

  final DeletionAdapter<TablePickUpGenerated>
      _tablePickUpGeneratedDeletionAdapter;

  @override
  Future<List<TablePickUpGenerated>> getQRGenerateds() async {
    return _queryAdapter.queryList('SELECT * FROM qrgenerated_table',
        mapper: (Map<String, Object?> row) => TablePickUpGenerated(
            requestId: row['requestId'] as int?,
            timePickUp: row['timePickUp'] as String?,
            pupilId1: row['pupilId1'] as int?,
            pupilId2: row['pupilId2'] as int?,
            pupilId3: row['pupilId3'] as int?,
            cardId: row['cardId'] as String?,
            datePickUp: row['datePickUp'] as String?,
            placePickUp: row['placePickUp'] as String?,
            parentId: row['parentId'] as int?,
            addressSchool: row['addressSchool'] as String?,
            stringQrcode: row['stringQrcode'] as String?,
            status: row['status'] as int?));
  }

  @override
  Future<TablePickUpGenerated?> getQRGeneratedById(String cardId) async {
    return _queryAdapter.query(
        'SELECT * FROM qrgenerated_table WHERE cardId = ?1',
        mapper: (Map<String, Object?> row) => TablePickUpGenerated(
            requestId: row['requestId'] as int?,
            timePickUp: row['timePickUp'] as String?,
            pupilId1: row['pupilId1'] as int?,
            pupilId2: row['pupilId2'] as int?,
            pupilId3: row['pupilId3'] as int?,
            cardId: row['cardId'] as String?,
            datePickUp: row['datePickUp'] as String?,
            placePickUp: row['placePickUp'] as String?,
            parentId: row['parentId'] as int?,
            addressSchool: row['addressSchool'] as String?,
            stringQrcode: row['stringQrcode'] as String?,
            status: row['status'] as int?),
        arguments: [cardId]);
  }

  @override
  Future<TablePickUpGenerated?> updateQRCode(int status, String cardId) async {
    return _queryAdapter.query(
        'UPDATE qrgenerated_table SET status = ?1 WHERE cardId = ?2',
        mapper: (Map<String, Object?> row) => TablePickUpGenerated(
            requestId: row['requestId'] as int?,
            timePickUp: row['timePickUp'] as String?,
            pupilId1: row['pupilId1'] as int?,
            pupilId2: row['pupilId2'] as int?,
            pupilId3: row['pupilId3'] as int?,
            cardId: row['cardId'] as String?,
            datePickUp: row['datePickUp'] as String?,
            placePickUp: row['placePickUp'] as String?,
            parentId: row['parentId'] as int?,
            addressSchool: row['addressSchool'] as String?,
            stringQrcode: row['stringQrcode'] as String?,
            status: row['status'] as int?),
        arguments: [status, cardId]);
  }

  @override
  Future<void> insertQRGenerated(TablePickUpGenerated pickUpGenerated) async {
    await _tablePickUpGeneratedInsertionAdapter.insert(
        pickUpGenerated, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteQRGenerated(TablePickUpGenerated pickUpGenerated) async {
    await _tablePickUpGeneratedDeletionAdapter.delete(pickUpGenerated);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _personInsertionAdapter = InsertionAdapter(
            database,
            'person_table',
            (Person item) => <String, Object?>{
                  'personId': item.personId,
                  'employeeIdNumber': item.employeeIdNumber,
                  'currentPersonalTitleId': item.currentPersonalTitleId,
                  'currentPersonalTitle': item.currentPersonalTitle,
                  'currentPersonalTitleEn': item.currentPersonalTitleEn,
                  'academicTitleId': item.academicTitleId,
                  'academicTitle': item.academicTitle,
                  'academicTitleEn': item.academicTitleEn,
                  'currentLastName': item.currentLastName,
                  'currentFirstName': item.currentFirstName,
                  'currentMiddleName': item.currentMiddleName,
                  'currentNickname': item.currentNickname,
                  'currentGenderId': item.currentGenderId,
                  'currentGender': item.currentGender,
                  'currentGenderEn': item.currentGenderEn,
                  'birthDate': item.birthDate,
                  'birthPlace': item.birthPlace,
                  'birthPlaceCity': item.birthPlaceCity,
                  'birthPlaceProvince': item.birthPlaceProvince,
                  'birthPlaceState': item.birthPlaceState,
                  'birthPlaceCountry': item.birthPlaceCountry,
                  'currentMaritalStatusId': item.currentMaritalStatusId,
                  'currentMaritalStatus': item.currentMaritalStatus,
                  'currentMaritalStatusEn': item.currentMaritalStatusEn,
                  'currentPeopleIdNumber': item.currentPeopleIdNumber,
                  'currentPeopleIdIssueDate': item.currentPeopleIdIssueDate,
                  'currentPeopleIdIssuePlace': item.currentPeopleIdIssuePlace,
                  'currentSocialSecurityNumber':
                      item.currentSocialSecurityNumber,
                  'currentMajorCitizenship': item.currentMajorCitizenship,
                  'currentPassportNumber': item.currentPassportNumber,
                  'currentPassportIssuePlace': item.currentPassportIssuePlace,
                  'currentPassportIssueDate': item.currentPassportIssueDate,
                  'currentPassportExpirationDate':
                      item.currentPassportExpirationDate,
                  'homeAddress1': item.homeAddress1,
                  'homeAddress2': item.homeAddress2,
                  'homeWard': item.homeWard,
                  'homeDistrict': item.homeDistrict,
                  'homeCity': item.homeCity,
                  'homeProvince': item.homeProvince,
                  'homeState': item.homeState,
                  'homeCountry': item.homeCountry,
                  'homePostalCode': item.homePostalCode,
                  'currentAddress1': item.currentAddress1,
                  'currentAddress2': item.currentAddress2,
                  'currentWard': item.currentWard,
                  'currentDistrict': item.currentDistrict,
                  'currentCity': item.currentCity,
                  'currentProvince': item.currentProvince,
                  'currentState': item.currentState,
                  'currentCountry': item.currentCountry,
                  'currentPostalCode': item.currentPostalCode,
                  'comments': item.comments,
                  'commentsEn': item.commentsEn,
                  'closeupPicture1': item.closeupPicture1,
                  'closeupPicture2': item.closeupPicture2,
                  'avatarPicture': item.avatarPicture,
                  'signatureImage': item.signatureImage,
                  'createdDatetime': item.createdDatetime,
                  'createdByUserId': item.createdByUserId,
                  'updatedDatetime': item.updatedDatetime,
                  'updatedByUserId': item.updatedByUserId,
                  'currentEmail': item.currentEmail,
                  'currentPhoneNumber1': item.currentPhoneNumber1,
                  'currentPhoneNumber2': item.currentPhoneNumber2
                }),
        _personDeletionAdapter = DeletionAdapter(
            database,
            'person_table',
            ['personId'],
            (Person item) => <String, Object?>{
                  'personId': item.personId,
                  'employeeIdNumber': item.employeeIdNumber,
                  'currentPersonalTitleId': item.currentPersonalTitleId,
                  'currentPersonalTitle': item.currentPersonalTitle,
                  'currentPersonalTitleEn': item.currentPersonalTitleEn,
                  'academicTitleId': item.academicTitleId,
                  'academicTitle': item.academicTitle,
                  'academicTitleEn': item.academicTitleEn,
                  'currentLastName': item.currentLastName,
                  'currentFirstName': item.currentFirstName,
                  'currentMiddleName': item.currentMiddleName,
                  'currentNickname': item.currentNickname,
                  'currentGenderId': item.currentGenderId,
                  'currentGender': item.currentGender,
                  'currentGenderEn': item.currentGenderEn,
                  'birthDate': item.birthDate,
                  'birthPlace': item.birthPlace,
                  'birthPlaceCity': item.birthPlaceCity,
                  'birthPlaceProvince': item.birthPlaceProvince,
                  'birthPlaceState': item.birthPlaceState,
                  'birthPlaceCountry': item.birthPlaceCountry,
                  'currentMaritalStatusId': item.currentMaritalStatusId,
                  'currentMaritalStatus': item.currentMaritalStatus,
                  'currentMaritalStatusEn': item.currentMaritalStatusEn,
                  'currentPeopleIdNumber': item.currentPeopleIdNumber,
                  'currentPeopleIdIssueDate': item.currentPeopleIdIssueDate,
                  'currentPeopleIdIssuePlace': item.currentPeopleIdIssuePlace,
                  'currentSocialSecurityNumber':
                      item.currentSocialSecurityNumber,
                  'currentMajorCitizenship': item.currentMajorCitizenship,
                  'currentPassportNumber': item.currentPassportNumber,
                  'currentPassportIssuePlace': item.currentPassportIssuePlace,
                  'currentPassportIssueDate': item.currentPassportIssueDate,
                  'currentPassportExpirationDate':
                      item.currentPassportExpirationDate,
                  'homeAddress1': item.homeAddress1,
                  'homeAddress2': item.homeAddress2,
                  'homeWard': item.homeWard,
                  'homeDistrict': item.homeDistrict,
                  'homeCity': item.homeCity,
                  'homeProvince': item.homeProvince,
                  'homeState': item.homeState,
                  'homeCountry': item.homeCountry,
                  'homePostalCode': item.homePostalCode,
                  'currentAddress1': item.currentAddress1,
                  'currentAddress2': item.currentAddress2,
                  'currentWard': item.currentWard,
                  'currentDistrict': item.currentDistrict,
                  'currentCity': item.currentCity,
                  'currentProvince': item.currentProvince,
                  'currentState': item.currentState,
                  'currentCountry': item.currentCountry,
                  'currentPostalCode': item.currentPostalCode,
                  'comments': item.comments,
                  'commentsEn': item.commentsEn,
                  'closeupPicture1': item.closeupPicture1,
                  'closeupPicture2': item.closeupPicture2,
                  'avatarPicture': item.avatarPicture,
                  'signatureImage': item.signatureImage,
                  'createdDatetime': item.createdDatetime,
                  'createdByUserId': item.createdByUserId,
                  'updatedDatetime': item.updatedDatetime,
                  'updatedByUserId': item.updatedByUserId,
                  'currentEmail': item.currentEmail,
                  'currentPhoneNumber1': item.currentPhoneNumber1,
                  'currentPhoneNumber2': item.currentPhoneNumber2
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Person> _personInsertionAdapter;

  final DeletionAdapter<Person> _personDeletionAdapter;

  @override
  Future<List<Person>> getPersons() async {
    return _queryAdapter.queryList('SELECT * FROM person_table',
        mapper: (Map<String, Object?> row) => Person(
            personId: row['personId'] as int,
            employeeIdNumber: row['employeeIdNumber'] as String?,
            currentPersonalTitleId: row['currentPersonalTitleId'] as int?,
            currentPersonalTitle: row['currentPersonalTitle'] as String?,
            currentPersonalTitleEn: row['currentPersonalTitleEn'] as String?,
            academicTitleId: row['academicTitleId'] as int?,
            academicTitle: row['academicTitle'] as String?,
            academicTitleEn: row['academicTitleEn'] as String?,
            currentLastName: row['currentLastName'] as String?,
            currentFirstName: row['currentFirstName'] as String?,
            currentMiddleName: row['currentMiddleName'] as String?,
            currentNickname: row['currentNickname'] as String?,
            currentGenderId: row['currentGenderId'] as int?,
            currentGender: row['currentGender'] as String?,
            currentGenderEn: row['currentGenderEn'] as String?,
            birthDate: row['birthDate'] as String?,
            birthPlace: row['birthPlace'] as String?,
            birthPlaceCity: row['birthPlaceCity'] as String?,
            birthPlaceProvince: row['birthPlaceProvince'] as String?,
            birthPlaceState: row['birthPlaceState'] as String?,
            birthPlaceCountry: row['birthPlaceCountry'] as String?,
            currentMaritalStatusId: row['currentMaritalStatusId'] as int?,
            currentMaritalStatus: row['currentMaritalStatus'] as String?,
            currentMaritalStatusEn: row['currentMaritalStatusEn'] as String?,
            currentPeopleIdNumber: row['currentPeopleIdNumber'] as String?,
            currentPeopleIdIssueDate:
                row['currentPeopleIdIssueDate'] as String?,
            currentPeopleIdIssuePlace:
                row['currentPeopleIdIssuePlace'] as String?,
            currentSocialSecurityNumber:
                row['currentSocialSecurityNumber'] as String?,
            currentMajorCitizenship: row['currentMajorCitizenship'] as String?,
            currentPassportNumber: row['currentPassportNumber'] as String?,
            currentPassportIssuePlace:
                row['currentPassportIssuePlace'] as String?,
            currentPassportIssueDate:
                row['currentPassportIssueDate'] as String?,
            currentPassportExpirationDate:
                row['currentPassportExpirationDate'] as String?,
            homeAddress1: row['homeAddress1'] as String?,
            homeAddress2: row['homeAddress2'] as String?,
            homeWard: row['homeWard'] as String?,
            homeDistrict: row['homeDistrict'] as String?,
            homeCity: row['homeCity'] as String?,
            homeProvince: row['homeProvince'] as String?,
            homeState: row['homeState'] as String?,
            homeCountry: row['homeCountry'] as String?,
            homePostalCode: row['homePostalCode'] as String?,
            currentAddress1: row['currentAddress1'] as String?,
            currentAddress2: row['currentAddress2'] as String?,
            currentWard: row['currentWard'] as String?,
            currentDistrict: row['currentDistrict'] as String?,
            currentCity: row['currentCity'] as String?,
            currentProvince: row['currentProvince'] as String?,
            currentState: row['currentState'] as String?,
            currentCountry: row['currentCountry'] as String?,
            currentPostalCode: row['currentPostalCode'] as String?,
            comments: row['comments'] as String?,
            commentsEn: row['commentsEn'] as String?,
            closeupPicture1: row['closeupPicture1'] as String?,
            closeupPicture2: row['closeupPicture2'] as String?,
            avatarPicture: row['avatarPicture'] as String?,
            signatureImage: row['signatureImage'] as String?,
            createdDatetime: row['createdDatetime'] as String?,
            createdByUserId: row['createdByUserId'] as int?,
            updatedDatetime: row['updatedDatetime'] as String?,
            updatedByUserId: row['updatedByUserId'] as int?,
            currentEmail: row['currentEmail'] as String?,
            currentPhoneNumber1: row['currentPhoneNumber1'] as String?,
            currentPhoneNumber2: row['currentPhoneNumber2'] as String?));
  }

  @override
  Future<Person?> getPersonById(int personId) async {
    return _queryAdapter.query('SELECT * FROM person_table WHERE personId = ?1',
        mapper: (Map<String, Object?> row) => Person(
            personId: row['personId'] as int,
            employeeIdNumber: row['employeeIdNumber'] as String?,
            currentPersonalTitleId: row['currentPersonalTitleId'] as int?,
            currentPersonalTitle: row['currentPersonalTitle'] as String?,
            currentPersonalTitleEn: row['currentPersonalTitleEn'] as String?,
            academicTitleId: row['academicTitleId'] as int?,
            academicTitle: row['academicTitle'] as String?,
            academicTitleEn: row['academicTitleEn'] as String?,
            currentLastName: row['currentLastName'] as String?,
            currentFirstName: row['currentFirstName'] as String?,
            currentMiddleName: row['currentMiddleName'] as String?,
            currentNickname: row['currentNickname'] as String?,
            currentGenderId: row['currentGenderId'] as int?,
            currentGender: row['currentGender'] as String?,
            currentGenderEn: row['currentGenderEn'] as String?,
            birthDate: row['birthDate'] as String?,
            birthPlace: row['birthPlace'] as String?,
            birthPlaceCity: row['birthPlaceCity'] as String?,
            birthPlaceProvince: row['birthPlaceProvince'] as String?,
            birthPlaceState: row['birthPlaceState'] as String?,
            birthPlaceCountry: row['birthPlaceCountry'] as String?,
            currentMaritalStatusId: row['currentMaritalStatusId'] as int?,
            currentMaritalStatus: row['currentMaritalStatus'] as String?,
            currentMaritalStatusEn: row['currentMaritalStatusEn'] as String?,
            currentPeopleIdNumber: row['currentPeopleIdNumber'] as String?,
            currentPeopleIdIssueDate:
                row['currentPeopleIdIssueDate'] as String?,
            currentPeopleIdIssuePlace:
                row['currentPeopleIdIssuePlace'] as String?,
            currentSocialSecurityNumber:
                row['currentSocialSecurityNumber'] as String?,
            currentMajorCitizenship: row['currentMajorCitizenship'] as String?,
            currentPassportNumber: row['currentPassportNumber'] as String?,
            currentPassportIssuePlace:
                row['currentPassportIssuePlace'] as String?,
            currentPassportIssueDate:
                row['currentPassportIssueDate'] as String?,
            currentPassportExpirationDate:
                row['currentPassportExpirationDate'] as String?,
            homeAddress1: row['homeAddress1'] as String?,
            homeAddress2: row['homeAddress2'] as String?,
            homeWard: row['homeWard'] as String?,
            homeDistrict: row['homeDistrict'] as String?,
            homeCity: row['homeCity'] as String?,
            homeProvince: row['homeProvince'] as String?,
            homeState: row['homeState'] as String?,
            homeCountry: row['homeCountry'] as String?,
            homePostalCode: row['homePostalCode'] as String?,
            currentAddress1: row['currentAddress1'] as String?,
            currentAddress2: row['currentAddress2'] as String?,
            currentWard: row['currentWard'] as String?,
            currentDistrict: row['currentDistrict'] as String?,
            currentCity: row['currentCity'] as String?,
            currentProvince: row['currentProvince'] as String?,
            currentState: row['currentState'] as String?,
            currentCountry: row['currentCountry'] as String?,
            currentPostalCode: row['currentPostalCode'] as String?,
            comments: row['comments'] as String?,
            commentsEn: row['commentsEn'] as String?,
            closeupPicture1: row['closeupPicture1'] as String?,
            closeupPicture2: row['closeupPicture2'] as String?,
            avatarPicture: row['avatarPicture'] as String?,
            signatureImage: row['signatureImage'] as String?,
            createdDatetime: row['createdDatetime'] as String?,
            createdByUserId: row['createdByUserId'] as int?,
            updatedDatetime: row['updatedDatetime'] as String?,
            updatedByUserId: row['updatedByUserId'] as int?,
            currentEmail: row['currentEmail'] as String?,
            currentPhoneNumber1: row['currentPhoneNumber1'] as String?,
            currentPhoneNumber2: row['currentPhoneNumber2'] as String?),
        arguments: [personId]);
  }

  @override
  Future<void> insertPerson(Person person) async {
    await _personInsertionAdapter.insert(person, OnConflictStrategy.replace);
  }

  @override
  Future<void> deletePerson(Person person) async {
    await _personDeletionAdapter.delete(person);
  }
}

class _$ParentDao extends ParentDao {
  _$ParentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _tableParentInsertionAdapter = InsertionAdapter(
            database,
            'parent_table',
            (TableParent item) => <String, Object?>{
                  'parentId': item.parentId,
                  'personToPersonPersonalRelationshipTypeName':
                      item.personToPersonPersonalRelationshipTypeName,
                  'personToPersonPersonalRelationshipTypeNameEn':
                      item.personToPersonPersonalRelationshipTypeNameEn,
                  'approved':
                      item.approved == null ? null : (item.approved! ? 1 : 0),
                  'approvedByUserId': item.approvedByUserId,
                  'approvedDatetime': item.approvedDatetime,
                  'personId': item.personId,
                  'accountUser': item.accountUser == null
                      ? null
                      : (item.accountUser! ? 1 : 0)
                }),
        _tableParentDeletionAdapter = DeletionAdapter(
            database,
            'parent_table',
            ['parentId'],
            (TableParent item) => <String, Object?>{
                  'parentId': item.parentId,
                  'personToPersonPersonalRelationshipTypeName':
                      item.personToPersonPersonalRelationshipTypeName,
                  'personToPersonPersonalRelationshipTypeNameEn':
                      item.personToPersonPersonalRelationshipTypeNameEn,
                  'approved':
                      item.approved == null ? null : (item.approved! ? 1 : 0),
                  'approvedByUserId': item.approvedByUserId,
                  'approvedDatetime': item.approvedDatetime,
                  'personId': item.personId,
                  'accountUser': item.accountUser == null
                      ? null
                      : (item.accountUser! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TableParent> _tableParentInsertionAdapter;

  final DeletionAdapter<TableParent> _tableParentDeletionAdapter;

  @override
  Future<List<TableParent>> getParents() async {
    return _queryAdapter.queryList('SELECT * FROM parent_table',
        mapper: (Map<String, Object?> row) => TableParent(
            parentId: row['parentId'] as int?,
            personToPersonPersonalRelationshipTypeName:
                row['personToPersonPersonalRelationshipTypeName'] as String?,
            personToPersonPersonalRelationshipTypeNameEn:
                row['personToPersonPersonalRelationshipTypeNameEn'] as String?,
            approved:
                row['approved'] == null ? null : (row['approved'] as int) != 0,
            approvedByUserId: row['approvedByUserId'] as int?,
            approvedDatetime: row['approvedDatetime'] as String?,
            personId: row['personId'] as int?,
            accountUser: row['accountUser'] == null
                ? null
                : (row['accountUser'] as int) != 0));
  }

  @override
  Future<TableParent?> getParentById(int parentId) async {
    return _queryAdapter.query('SELECT * FROM parent_table WHERE parentId = ?1',
        mapper: (Map<String, Object?> row) => TableParent(
            parentId: row['parentId'] as int?,
            personToPersonPersonalRelationshipTypeName:
                row['personToPersonPersonalRelationshipTypeName'] as String?,
            personToPersonPersonalRelationshipTypeNameEn:
                row['personToPersonPersonalRelationshipTypeNameEn'] as String?,
            approved:
                row['approved'] == null ? null : (row['approved'] as int) != 0,
            approvedByUserId: row['approvedByUserId'] as int?,
            approvedDatetime: row['approvedDatetime'] as String?,
            personId: row['personId'] as int?,
            accountUser: row['accountUser'] == null
                ? null
                : (row['accountUser'] as int) != 0),
        arguments: [parentId]);
  }

  @override
  Future<void> insertParent(TableParent parent) async {
    await _tableParentInsertionAdapter.insert(
        parent, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteParent(TableParent parent) async {
    await _tableParentDeletionAdapter.delete(parent);
  }
}

class _$PupilDao extends PupilDao {
  _$PupilDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _tablePupilInsertionAdapter = InsertionAdapter(
            database,
            'pupil_table',
            (TablePupil item) => <String, Object?>{
                  'pupilId': item.pupilId,
                  'className': item.className,
                  'classId': item.classId,
                  'personToPersonPersonalRelationshipTypeName':
                      item.personToPersonPersonalRelationshipTypeName,
                  'personToPersonPersonalRelationshipTypeNameEn':
                      item.personToPersonPersonalRelationshipTypeNameEn,
                  'currentLastNameParent': item.currentLastNameParent,
                  'currentFirstNameParent': item.currentFirstNameParent,
                  'currentMiddleNameParent': item.currentMiddleNameParent,
                  'currentPhoneNumber1Parent': item.currentPhoneNumber1Parent,
                  'currentPhoneNumber2Parent': item.currentPhoneNumber2Parent,
                  'personId': item.personId
                }),
        _tablePupilDeletionAdapter = DeletionAdapter(
            database,
            'pupil_table',
            ['pupilId'],
            (TablePupil item) => <String, Object?>{
                  'pupilId': item.pupilId,
                  'className': item.className,
                  'classId': item.classId,
                  'personToPersonPersonalRelationshipTypeName':
                      item.personToPersonPersonalRelationshipTypeName,
                  'personToPersonPersonalRelationshipTypeNameEn':
                      item.personToPersonPersonalRelationshipTypeNameEn,
                  'currentLastNameParent': item.currentLastNameParent,
                  'currentFirstNameParent': item.currentFirstNameParent,
                  'currentMiddleNameParent': item.currentMiddleNameParent,
                  'currentPhoneNumber1Parent': item.currentPhoneNumber1Parent,
                  'currentPhoneNumber2Parent': item.currentPhoneNumber2Parent,
                  'personId': item.personId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TablePupil> _tablePupilInsertionAdapter;

  final DeletionAdapter<TablePupil> _tablePupilDeletionAdapter;

  @override
  Future<List<TablePupil>> getPupils() async {
    return _queryAdapter.queryList('SELECT * FROM pupil_table',
        mapper: (Map<String, Object?> row) => TablePupil(
            className: row['className'] as String?,
            pupilId: row['pupilId'] as int?,
            classId: row['classId'] as int?,
            personToPersonPersonalRelationshipTypeName:
                row['personToPersonPersonalRelationshipTypeName'] as String?,
            personToPersonPersonalRelationshipTypeNameEn:
                row['personToPersonPersonalRelationshipTypeNameEn'] as String?,
            currentLastNameParent: row['currentLastNameParent'] as String?,
            currentFirstNameParent: row['currentFirstNameParent'] as String?,
            currentMiddleNameParent: row['currentMiddleNameParent'] as String?,
            currentPhoneNumber1Parent:
                row['currentPhoneNumber1Parent'] as String?,
            currentPhoneNumber2Parent:
                row['currentPhoneNumber2Parent'] as String?,
            personId: row['personId'] as int?));
  }

  @override
  Future<List<TablePupil?>> getPupilById(
      int pupilId1, int pupilId2, int pupilId3) async {
    return _queryAdapter.queryList(
        'SELECT * FROM pupil_table WHERE pupilId IN ( ?1, ?2, ?3 )',
        mapper: (Map<String, Object?> row) => TablePupil(
            className: row['className'] as String?,
            pupilId: row['pupilId'] as int?,
            classId: row['classId'] as int?,
            personToPersonPersonalRelationshipTypeName:
                row['personToPersonPersonalRelationshipTypeName'] as String?,
            personToPersonPersonalRelationshipTypeNameEn:
                row['personToPersonPersonalRelationshipTypeNameEn'] as String?,
            currentLastNameParent: row['currentLastNameParent'] as String?,
            currentFirstNameParent: row['currentFirstNameParent'] as String?,
            currentMiddleNameParent: row['currentMiddleNameParent'] as String?,
            currentPhoneNumber1Parent:
                row['currentPhoneNumber1Parent'] as String?,
            currentPhoneNumber2Parent:
                row['currentPhoneNumber2Parent'] as String?,
            personId: row['personId'] as int?),
        arguments: [pupilId1, pupilId2, pupilId3]);
  }

  @override
  Future<void> insertPupil(TablePupil pupil) async {
    await _tablePupilInsertionAdapter.insert(pupil, OnConflictStrategy.replace);
  }

  @override
  Future<void> deletePupil(TablePupil pupil) async {
    await _tablePupilDeletionAdapter.delete(pupil);
  }
}
