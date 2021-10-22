import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/pupil.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ClassDetailsPage extends StatelessWidget {
  const ClassDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<PupilsBloc>()..add(const FetchPupils(classId: 1)),
      child: const Scaffold(
        appBar: CustomAppBar(title: TitlesConstants.classDetails),
        body: ClassDetailsBody(),
      ),
    );
  }
}

class ClassDetailsBody extends StatefulWidget {
  const ClassDetailsBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ClassDetailsBody> createState() => _ClassDetailsBodyState();
}

class _ClassDetailsBodyState extends State<ClassDetailsBody> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PupilsBloc, PupilsState>(builder: (context, state) {
      if (state is FetchPupilsSuccessState) {
        EasyLoading.dismiss();
        final List<Pupil> pupils = state.pupils!;

        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_body_a.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),
                Text(
                  StringConstatns.numberOfPupils + '11/12',
                  style:
                      Utils.setStyle(color: ColorConstants.neutralColor1),
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: pupils.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = pupils[index];

                    return ItemPersonListView(
                      index: index,
                      isSelected: currentIndex == index,
                      avatar: item.avatarPicture!,
                      fullName: item.getFullName(),
                      onSelect: () {
                        setState(() {
                          currentIndex = index;
                        });
                        Navigator.pushNamed(
                            context, RouteConstants.pupilDetails,
                            arguments: item);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      } else if (state is FetchPupilsFailureState) {
        EasyLoading.dismiss();
        UiHelper.showMyDialog(
          context: context,
          content: state.msg ?? "This is something wrong",
        );
        return const SizedBox.shrink();
      } else {
        EasyLoading.show();
        return const SizedBox.shrink();
      }
    });
  }
}
