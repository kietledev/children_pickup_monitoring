import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class GeneratedQRCodePage extends StatelessWidget {
  const GeneratedQRCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      injector<PupilByParentBloc>()..add(const FetchPupilByParent(parentId: 2)),
      child:  Scaffold(
        appBar:  WidgetAppBar(
          title: TitlesConstants.generated_qr,
          menuItem: [],
          actionBack: () {
            Navigator.pop(context);
          },
        ),

        body: GeneratedQRCodeBody(),
      ),
    );
  }
}

class GeneratedQRCodeBody extends StatefulWidget {
  const GeneratedQRCodeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<GeneratedQRCodeBody> createState() => _GeneratedQRCodeBodyState();
}

class _GeneratedQRCodeBodyState extends State<GeneratedQRCodeBody> {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PupilByParentBloc, PupilByParentState>(builder: (context, state) {
      if (state is FetchPupilByParentSuccessState) {
        EasyLoading.dismiss();
        final List<Pupil> pupils = state.pupils!;
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_body_a.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 0) ,
            child: Text(pupils[0].className!),
          ),
        );
      } else if (state is FetchTeachersFailureState) {
        EasyLoading.dismiss();
        return const SizedBox.shrink();
      } else {
        EasyLoading.show();
        return const SizedBox.shrink();
      }
    });
  }
}
