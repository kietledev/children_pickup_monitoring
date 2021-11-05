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


class ListParentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
        create: (context) => injector<ParentsBloc>(),
        child:BodyListParentPage()
    );
  }
}
class BodyListParentPage extends StatefulWidget {
  const BodyListParentPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyListParentPage> createState() => _BodyListParentPage();
}

class _BodyListParentPage extends State<BodyListParentPage>{
  int currentIndex = -1;
  List<ParentModel> parents = [];
  int pupilId = -1;
  @override
  void initState() {
    initBloc();
    super.initState();
  }
  initBloc() async{
    pupilId = await getPupilID();
    BlocProvider.of<ParentsBloc>(context).add(FetchParents(pupilId: pupilId, relationshipTypeId: 0));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: WidgetAppBar(
        title: "Danh sách liên quan",
        hideBack: true,
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
        child: BlocConsumer<ParentsBloc, ParentsState>(
          listener: (context, state) {
            if (state is FetchParentsSuccessState) {
              EasyLoading.dismiss();
              parents = state.parents!;
            } else if(state is DeleteParentSuccessState){
              WidgetsBinding.instance!.addPostFrameCallback((_) => CustomWidgetsSnackBar.buildSuccessSnackbar(context, "Xóa thành công"));
              getPupilID().then((value) => context.read<ParentsBloc>().add(FetchParents(pupilId: value, relationshipTypeId: 0)));
            }
            else if (state is FetchParentsFailureState) {
              EasyLoading.dismiss();
            } else {
              EasyLoading.show();
            }
          },
          buildWhen: (prevState, currState) {
            return currState is ParentsState && currState.parents != null ||
                currState is FetchParentsSuccessState;
          },
          builder: (context,state){
            return  ScrollConfiguration(
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
                                getUser().then((value) => deleteParent(item.parentId!, value!.userId,context, 1));
                              },
                            ),
                          )
                        ]
                    );
                  }
              ),
            );
          },
        ),
      )
    );
  }
  Future deleteParent(int parentID,int userID,BuildContext context,int roleId) async {
    final Map<String, dynamic> body = <String, dynamic>{
      "parentId": parentID,
      "userId": userID
    };
    BlocProvider.of<ParentsBloc>(context).add(DeleteParentEvent(roleId:roleId,body: body,parentId: parentID ));
  }
  Widget itemRight(BuildContext context){
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context,RouteConstants.addUserToParent).then((value) => getPupilID().then((value) => context.read<ParentsBloc>().add(FetchParents(pupilId: value, relationshipTypeId: 0))));
      },
      child: SvgPicture.asset(
        'assets/icons/ic_add_16.svg',
        height: 16,
        width: 16,
      ),
    );
  }
}