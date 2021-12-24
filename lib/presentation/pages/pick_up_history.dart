import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/widgets.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/presentation/blocs/notification/notification_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/item_pick_up_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PickUpHistory extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  BlocProvider(
      create: (context) => injector<NotificationBloc>(),
      child: Scaffold(
        appBar: WidgetAppBar(
          title: (AppLocalizations.of(context)!.childPickupHistory),
          hideBack: true,
          actionBack: (){
            Navigator.pop(context);
          },
        ),
        body: BodyPickUpHistory(),
      )
    );
  }
}

class BodyPickUpHistory extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BodyPickUpHistory();
}

class _BodyPickUpHistory extends State<BodyPickUpHistory>{
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/bg_body_a.png'),
        fit: BoxFit.fill,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Column(
          children: [
            SizedBox(height: 24,),
            textFieldSearch(),
            SizedBox(height: 12,),
            Expanded(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index){
                      return  ItemPickUpHistory(
                          index: index,
                          isSelected: false,
                          onSelect: (){
                            Navigator.pushNamed(context, RouteConstants.pickUpHistoryDetail);
                          }
                          );
                    }
                ))
          ],
        ),
      ),
    ),
  );
  }
  Widget textFieldSearch(){
    return Container(
      height: 36,
      decoration: BoxDecoration(
          color: ColorConstants.neutralColor4,
          borderRadius:
          BorderRadius.all(Radius.circular(10))),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: searchController,
        //onChanged: onSearchTextChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstants.neutralColor4,
          contentPadding: EdgeInsets.symmetric(horizontal: 6),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstants.neutralColor4, width: 2),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstants.neutralColor4, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstants.neutralColor4, width: 2),
          ),
          hintText: "Search",
          hintStyle: TextStyle(color: ColorConstants.neutralColor2,fontFamily: FontsConstants.notoSans,fontSize: 16),
          prefixIcon:Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: SvgPicture.asset(
              'assets/icons/ic_search.svg',
              height: 16,
              width: 16,
            ),
          ),
        ),
      ),
    );
  }

}