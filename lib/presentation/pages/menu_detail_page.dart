import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/constants/text_constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MenuDetailsPage extends StatefulWidget {
  final FoodMenu foodMenu;

  const MenuDetailsPage({Key? key,required this.foodMenu}) : super(key: key);
  @override
  _MenuDetailsPageState createState() => _MenuDetailsPageState();
}

class _MenuDetailsPageState extends State<MenuDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.foodMenu.foodTypes!.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.foodMenu.foodTypes![index].foodTypeName,
                          style: EditProfileStyle.titleStyleEditTrue,
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 3, 12, 6),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.foodMenu.foodTypes![index].foods.length,
                        itemBuilder: (BuildContext context, int index1) {
                          return InkWell(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child:   CustomTextFieldMenu(
                                  value: widget.foodMenu.foodTypes![index].foods[index1].briefDescription!, style: EditProfileStyle.contentStyle, numOfLine: 1),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 6)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
