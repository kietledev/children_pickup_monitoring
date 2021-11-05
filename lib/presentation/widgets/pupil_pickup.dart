import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/common/helpers/my_behavior.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class PupilPickUp extends StatefulWidget {
  final int parentID;
   PupilPickUp({
    Key? key,
     required this.parentID,

  }) : super(key: key);

  @override

  _PupilPickUpState createState() => _PupilPickUpState();
}

class _PupilPickUpState extends State<PupilPickUp> {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => injector<PupilByParentBloc>()..add(FetchPupilByParent(parentId:widget.parentID)),
      child:  Scaffold(
        body: PupilPickUpBody(parentID: widget.parentID,),
      ),
    );
  }
}
class PupilPickUpBody extends StatelessWidget {
  PupilPickUpBody({
    Key? key, required this.parentID
  }) : super(key: key);
  final int parentID;

  //pupil pickup
  List<PupilCheck> _pupilsCheckbox = [];
  List<Pupil> _pupils = [];
  List<PupilCheck> _pupilsPickUp = [];
  List<int?> _pupilIDs = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PupilByParentBloc, PupilByParentState>(

        builder: (context, state) {
          if (state is FetchPupilByParentFailureState) {
            return Text("khong co dl");
          } else if (state is FetchPupilByParentSuccessState) {
            _pupilsCheckbox = [];
            print("_pupils length ==>>  " + _pupils.length.toString());
            _pupils = state.pupils!;
            print("_pupils length ==>>  " + _pupils.length.toString());
            for (Pupil pupil in _pupils) {
              _pupilsCheckbox.add(new PupilCheck(isCheck: false, pupil: pupil));
            }
            print("_pupilsCheckbox ==>>     " + _pupilsCheckbox[0].pupil!
                .personToPersonPersonalRelationshipTypeName!);
            return SizedBox(
                height: 60 * _pupilsCheckbox.length.toDouble(),
                child: ListView(

                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _pupilsCheckbox.map((PupilCheck pupil) {
                    return new ItemPupilCheckBox(
                      pupil: pupil,
                    );
                  }).toList(),
                ));
          } else {
            print("LỖI");
            return const SizedBox.shrink();
          }
        });
  }
}
