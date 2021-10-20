import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/achievement/achievement_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          injector<AchievementBloc>()..add(const FetchAchievements(pupilId: 4)),
      child: const Scaffold(
        appBar: CustomAppBar(
          title: TitlesConstants.achievements,
        ),
        body: AchievementsBody(),
      ),
    );
  }
}

class AchievementsBody extends StatelessWidget {
  const AchievementsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = -1;
    return BlocBuilder<AchievementBloc, AchievementState>(
        builder: (context, state) {
      if (state is FetchAchievementSuccessState) {
        EasyLoading.dismiss();
        final List<Achievement> achievement = state.achievements!;
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_body_a.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: ListView.builder(
              primary: false,
              itemCount: achievement.length,
              itemBuilder: (context, index) {
                final item = achievement[index];

                return ItemAchievementListView(
                  item: item,
                  index: index,
                  currentIndex: currentIndex,
                  callback: () {
                    currentIndex = index;
                    print(currentIndex);
                  },
                );

                // return ItemPersonListView(
                //   index: index,
                //   isSelected: currentIndex == index,
                //   avatar: item.avatarPicture!,
                //   fullName: item.getFullName(),
                //   onSelect: () {
                //     setState(() {
                //       currentIndex = index;
                //     });
                //     Navigator.pushNamed(context, RouteConstants.teacherDetails,
                //         arguments: item);
                //   },
                // );
              },
            ),
          ),
        );
      } else if (state is FetcAchievementFailureState) {
        EasyLoading.dismiss();
        return const SizedBox.shrink();
      } else {
        EasyLoading.show();
        return const SizedBox.shrink();
      }
    });
  }
}

class ItemAchievementListView extends StatefulWidget {
  const ItemAchievementListView({
    Key? key,
    required this.item,
    required this.index,
    required this.currentIndex,
    required this.callback,
  }) : super(key: key);

  final Achievement item;
  final int index;
  final int currentIndex;
  final VoidCallback callback;

  @override
  State<ItemAchievementListView> createState() =>
      _ItemAchievementListViewState();
}

class _ItemAchievementListViewState extends State<ItemAchievementListView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callback;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          children: [
            const SizedBox(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 32,
                backgroundImage: AssetImage("assets/images/img_avatar.png"),
              ),
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.item.achievementBriefDescription!,
                    style: Utils.initTextStyle(
                        color: ColorConstants.neutralColor1,
                        weight: FontWeight.w600)),
                Text(widget.item.createdDatetime!,
                    style: Utils.initTextStyle(
                        color: ColorConstants.neutralColor1,
                        weight: FontWeight.w600)),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/ic_arrow_right.svg',
              color: ColorConstants.neutralColor1,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
