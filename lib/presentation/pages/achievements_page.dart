import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/achievement/achievement_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/item_title_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          injector<AchievementBloc>()..add(const FetchAchievements(pupilId: 4)),
      child: Scaffold(
        appBar:  WidgetAppBar(
          title: (AppLocalizations.of(context)!.achievements),
          menuItem: [],
          hideBack:true,
          actionBack: () {
            Navigator.pop(context);
          },
        ),
        body: const AchievementsBody(),
      ),
    );
  }
}
class AchievementsBody extends StatefulWidget {
  const AchievementsBody({
    Key? key,
  }) : super(key: key);

  @override
  State<AchievementsBody> createState() => _AchievementsBodyState();
}

class _AchievementsBodyState extends State<AchievementsBody> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AchievementBloc, AchievementState>(
        builder: (context, state) {
      if (state is FetchAchievementSuccessState) {
        EasyLoading.dismiss();
        final List<Achievement> achievement = state.achievements!;
        return Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_body_a.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: achievement.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = achievement[index];
                  return ItemTitleDateListView(
                    index: index,
                    isSelected: currentIndex == index,
                    image: "assets/images/img_avatar.png",
                    date: item.createdDatetime!,
                    title: item.achievementBriefDescription!,
                    onSelect: () {
                      setState(() {
                        currentIndex = index;
                      });
                      Navigator.pushNamed(context, RouteConstants.achievementDetail,
                          arguments: item);
                    },
                  );
                },
              ),
            ),
          ),
        );
      } else if (state is FetchAchievementFailureState) {
        EasyLoading.dismiss();
        return const SizedBox.shrink();
      } else {
        EasyLoading.show();
        return const SizedBox.shrink();
      }
    });
  }
}

