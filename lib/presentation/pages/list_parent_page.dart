import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/parents/parents_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListParentPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
        title: "Danh sách liên quan",
        actionBack: (){
          Navigator.pop(context);
        },
        menuItem: [
           itemRight()
        ],
      ),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_body_a.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: BlocProvider(
          create: (context) => injector<ParentsBloc>()..add(FetchParents(pupilId: 2, relationshipTypeId: 0)),
          child:BlocBuilder<ParentsBloc, ParentsState>(builder: (context, state) {
            if (state is FetchParentsSuccessState) {
              EasyLoading.dismiss();
              final List<ParentModel> parents = state.parents!;
              return Container();
            } else if (state is FetchParentsFailureState) {
              EasyLoading.dismiss();
              return const SizedBox.shrink();
            } else {
              EasyLoading.show();
              return const SizedBox.shrink();
            }
          })
        ),
      ) ,
    );
  }
  Widget itemRight(){
    return TextButton(
      onPressed: () {
       // Navigator.pushNamed(context, SearchParentScreen.routeName);
      },
      child: SvgPicture.asset(
        'assets/icons/ic_add_16.svg',
        height: 16,
        width: 16,
      ),
    );
  }
}