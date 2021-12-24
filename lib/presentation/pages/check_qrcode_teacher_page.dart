import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/datasources/local/app_database.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/pages/warning_page.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CheckQRCodeTeacherPage extends StatefulWidget {

  @override
  State<CheckQRCodeTeacherPage> createState() => _CheckQRCodeTeacherState();
}

class _CheckQRCodeTeacherState extends State<CheckQRCodeTeacherPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CheckQRCodeTeacherBody();

  }
}

class CheckQRCodeTeacherBody extends StatefulWidget {
  @override
  State<CheckQRCodeTeacherBody> createState() => _CheckQRCodeTeacherBody();
}

class _CheckQRCodeTeacherBody extends State<CheckQRCodeTeacherBody> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: WidgetAppBar(
      title: (AppLocalizations.of(context)!.requestPickup),
    menuItem: [],
    hideBack: true,
    actionBack: () {
    Navigator.pop(context);
    },
    ),
    body: Container()
 );
  }
}
