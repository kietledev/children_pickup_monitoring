import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/parents/parents_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListParentPage extends StatefulWidget {
  const ListParentPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ListParentPage> createState() => _ListParentPage();
}

class _ListParentPage extends State<ListParentPage>{
  int currentIndex = -1;
  List<ParentModel> parents = [];
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
           itemRight(context)
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
            child:BlocBuilder<ParentsBloc, ParentsState>(
                builder: (context, state) {
              if (state is FetchParentsSuccessState) {
                EasyLoading.dismiss();
                 parents = state.parents!;
                return  Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_body_a.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                        primary:false,
                        itemCount:parents.length ,
                        itemBuilder: (context,index){
                          final item = parents[index];
                          return SlideMenu(
                              child:ItemParentListView(
                                  index: index,
                                  isSelected: currentIndex == index,
                                  avatar: item.personDetail!.avatarPicture.toString(),
                                  fullName: item.getFullName(),
                                  approved: item.approved!,
                                  parent: item,
                                  onSelect: (){
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  }
                              ),
                              menuItems:<Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                    child: SizedBox(
                                      width: 26,
                                      height: 26,
                                      child: SvgPicture.asset(
                                        'assets/icons/ic_delete_circle.svg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    onTap: (){
                                      print(item.parentId);
                                    },
                                  ),
                                )
                              ]
                          );
                        }
                    ),
                  ),
                );
              } else if (state is FetchParentsFailureState) {
                EasyLoading.dismiss();
                return const SizedBox.shrink();
              } else {
                EasyLoading.show();
                return const SizedBox.shrink();
              }
            },
              buildWhen: (prevState, currState) => prevState != currState && currState is FetchParentsSuccessState
            )
        ),
      )
    );
  }
  Widget itemRight(BuildContext context){
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context,RouteConstants.addUserToParent).then((value) => context.read<ParentsBloc>().add(FetchParents(pupilId: 2, relationshipTypeId: 0)));
      },
      child: SvgPicture.asset(
        'assets/icons/ic_add_16.svg',
        height: 16,
        width: 16,
      ),
    );
  }
}