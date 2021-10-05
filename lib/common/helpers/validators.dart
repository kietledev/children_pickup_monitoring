import 'package:children_pickup_monitoring/common/constants/text_constants.dart';

class Validators {
  Validators._();

  static String userValidator(String value) {
    if (value.isEmpty) {
      return ErrorConstants.nullUsername;
    } else if (value.length < 10) {
      return ErrorConstants.shortUsername;
    } else {
      return '';
    }
  }

  static String passValidator(String value) {
    if (value.isEmpty) {
      return ErrorConstants.nullPassword;
    } else if (value.length < 8) {
      return ErrorConstants.shortPassword;
    } else {
      return '';
    }
  }
}
