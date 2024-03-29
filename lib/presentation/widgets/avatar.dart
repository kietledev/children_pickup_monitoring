import 'dart:convert';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Avatar extends StatelessWidget{
  final bool enabled;
  final String avatar;
  VoidCallback? callback;
  final String? avatarNull ;
  Avatar({
    required this.avatar,
    required this.enabled,
    this.callback,
    this.avatarNull
   });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return enabled
        ? Center(
            child: InkWell(
              child: Stack(
                children: [
                  Container(
                    height: 112,
                    width: 112,
                    margin: EdgeInsets.fromLTRB(0, 34, 0, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/img_border_avatar.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: CircleAvatar(
                          backgroundImage: avatar != ""
                              ? MemoryImage(base64Decode(avatar))
                              : AssetImage(avatarNull!)
                                  as ImageProvider),
                    ),
                  ),
                  Positioned(
                      right: -0,
                      top: 35,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: ColorConstants.neutralColor6),
                        child: Container(
                          width: 24,
                          height: 24,
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: SvgPicture.asset(
                            'assets/icons/ic_edit.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ))
                ],
              ),
              onTap: callback
            ),
          )
        : Center(
            child: Stack(
              children: [
                Container(
                    height: 112,
                    width: 112,
                    margin: EdgeInsets.fromLTRB(0, 34, 0, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/img_border_avatar.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: CircleAvatar(
                          backgroundImage: avatar != ""
                              ? MemoryImage(base64Decode(avatar))
                              : AssetImage(avatarNull!) as ImageProvider),
                    )),
              ],
            ),
          );
  }
}