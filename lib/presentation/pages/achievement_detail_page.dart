import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/constants/text_constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AchievementDetailsPage extends StatelessWidget {
  const AchievementDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final achievement = ModalRoute.of(context)!.settings.arguments as Achievement;

    return Scaffold(
    appBar:  WidgetAppBar(
      hideBack: true,
    title: (AppLocalizations.of(context)!.detail),
    menuItem: [],

    actionBack: () {
    Navigator.pop(context);
    },
    ),
      body: AchievementDetailsBody(
        achievement: achievement,
      ),
    );
  }
}

class AchievementDetailsBody extends StatelessWidget {
  AchievementDetailsBody({
    Key? key,
    required this.achievement,
  }) : super(key: key);
  final Achievement achievement;

  final TextStyle titleStyle = Utils.setStyle(
      size: 14, color: ColorConstants.neutralColor2, weight: FontWeight.w600);
  final TextStyle valueStyle =
  Utils.setStyle(color: ColorConstants.neutralColor1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_body_a.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),

          child: SizedBox(
            width: double.infinity,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
              value: achievement.achievementBriefDescription!, style: valueStyle, numOfLine: 4),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage("assets/images/img_avatar.png")),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.redAccent,
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage("assets/images/img_avatar_null.png")),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.redAccent,
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage("assets/images/img_avatar.png")),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.redAccent,
                    ),
                  ),
                  ]),
        ]),

          ),
        ),
      ),
    );
  }
}
