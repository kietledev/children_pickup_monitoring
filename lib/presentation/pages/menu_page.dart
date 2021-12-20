import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/core/widgets/appbar.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/widgets/custom_appbar.dart';
import 'package:children_pickup_monitoring/presentation/widgets/item_title_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'menu_detail_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      injector<MenuBloc>()..add(const FetchMenu(classTypeId:1,currentDate:"2021-07-26")),
      child:  Scaffold(
      appBar:  WidgetAppBar(
        title:  (AppLocalizations.of(context)!.menu),
        menuItem: [],
        hideBack:true,
        actionBack: () {
          Navigator.pop(context);
        },
      ),
        body: MenuBody(),
      ),
    );
  }
}
class MenuBody extends StatefulWidget {
  const MenuBody({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  int _currentIndex = -1;
  int isselected = 0;
  var _firstPress = true;
  int _lengthList = 1;
  int checkSelect = -1;
  List<FoodMenu> foodMenuShow = [];
  List<FoodMenu> foodMenuDay = [];
  void _onSelected(int index) {
    setState(() => _currentIndex = index);
  }
  _getFoodMenu(FoodMenu foodMenu, int index) {
    print("checkSelect++ "+checkSelect.toString());
    if(_lengthList == 1){
      return MenuDetailsPage(foodMenu: foodMenu);
    }else {
      if (checkSelect != -1) {
        if (index == checkSelect) {
          return MenuDetailsPage(foodMenu: foodMenu);
        }
      } else {
        return null;
      }
    }


  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state is FetchMenuSuccessState) {
            EasyLoading.dismiss();
            final List<FoodMenu> foodMenu = state.foodMenu!;
            foodMenuDay = [];
            for (var i in foodMenu) {
              final String day =
                Utils.formatDateTime('2021-07-28T13:58:32.828878');
                print(day);
              if (Utils.formatDateTime(i.date) == day) {
                foodMenuDay.add(i);
              }
            }
            if (_lengthList == 1) {
              foodMenuShow = foodMenuDay;
            }
            return Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isselected = 0;
                                    foodMenuShow = [];
                                    foodMenuShow = foodMenuDay;
                                    _lengthList = foodMenuShow.length;
                                  });

                                },
                                icon: (isselected == 0)
                                    ? SvgPicture.asset(
                                    'assets/icons/ic_radio_selected.svg')
                                    : SvgPicture.asset(
                                    'assets/icons/ic_radio_no_selected.svg',
                                  height: 20.h,
                                ),
                              ),
                              Text(
                                (AppLocalizations.of(context)!.today),
                                style: MenusStyle.contentStyle2,
                              ),
                            ],
                          ),
                          Row(children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isselected = 1;
                                  foodMenuShow = [];
                                  foodMenuShow = foodMenu;
                                  _lengthList = foodMenuShow.length;
                                });
                              },
                              icon: (isselected == 1)
                                  ? SvgPicture.asset(
                                  'assets/icons/ic_radio_selected.svg')
                                  : SvgPicture.asset(
                                'assets/icons/ic_radio_no_selected.svg',
                                height: 20.h,
                              ),
                            ),
                            Text(
                              (AppLocalizations.of(context)!.week),
                              style: MenusStyle.contentStyle2,
                            ),
                          ]),
                        ],
                      ),
                      Expanded(

                          child: ListView.builder(
                            itemCount: _lengthList,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                              onTap: () {
                                setState(() {

                                    if (_lengthList == 1) {
                                      _currentIndex = -1;
                                    }else {
                                      _onSelected(index);
                                      if (checkSelect != -1 &&
                                          checkSelect != index) {
                                        checkSelect = index;
                                      } else
                                      if (checkSelect == index) {
                                        checkSelect = -1;
                                      } else {
                                        checkSelect = index;
                                      }
                                    }

                                });

                              },
                              child: Column(
                              children: [
                                Container(
                                  // width: 360,
                                  height: 40,
                                  margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                                  decoration: _lengthList == 1
                                      ? const BoxDecoration()
                                      : BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xFFF3F5FF)
                                                  .withOpacity(1),
                                              spreadRadius: 3,
                                              blurRadius: 4,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                  ),
                                  child:Padding(
                                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: <Widget>[
                                          Text(    foodMenuShow.isNotEmpty
                                              ? "${ (AppLocalizations.of(context)!.date)} ${Utils.formatDateTime(foodMenuShow[index].date)}"
                                              : '',style: _lengthList == 1 ? MenusStyle.contentStyle1:MenusStyle.contentStyle),
                                          IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (_lengthList == 1) {
                                                _currentIndex = -1;
                                              }else {
                                                _onSelected(index);
                                                if (checkSelect != -1 &&
                                                    checkSelect != index) {
                                                  checkSelect = index;
                                                } else
                                                if (checkSelect == index) {
                                                  checkSelect = -1;
                                                } else {
                                                  checkSelect = index;
                                                }
                                              }
                                            });
                                          },
                                              icon: (_currentIndex == index && checkSelect == index)
                                              ? SvgPicture.asset(
                                                'assets/icons/ic_dropdown_off.svg',

                                            color: ColorConstants.brandColor,
                                          )
                                              : SvgPicture.asset(
                                                'assets/icons/ic_dropdown_on.svg',
                                            color: ColorConstants.brandColor,
                                          ),)
                                        ]),
                                  ),
                                ),
                                Center(
                                  child: _getFoodMenu(foodMenuShow[index], index),
                                ),
                              ]),
                              );
                            }
                          )),
                  ]
                  )
                  )
                        ),
            );
          } else if (state is FetchMenuFailureState) {
            EasyLoading.dismiss();
            return const SizedBox.shrink();
          } else {
            EasyLoading.show();
            return const SizedBox.shrink();
          }
        });
  }
}
