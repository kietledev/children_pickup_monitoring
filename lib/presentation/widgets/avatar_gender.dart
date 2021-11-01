import 'dart:convert';
import 'dart:typed_data';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarGender extends StatelessWidget{
  final String avatar;
  final int genderId ;
  VoidCallback? callback;
  final String? avatarMaleNull ;
  final String? avatarFemaleNull ;
  AvatarGender({
    required this.genderId,
    required this.avatar,
    this.callback,
    this.avatarMaleNull,
    this.avatarFemaleNull
  });
  @override
  Widget build(BuildContext context) {
    Uint8List? bytesImage;
    if(avatar == ""){
      bytesImage = null;
    }else{
      bytesImage = base64.decode('${avatar}');
    }
    // TODO: implement build
    return
        Center(
      child: InkWell(
          child: Stack(
            children: [
              Container(
                height: 112,
                width: 112,
                margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_border_avatar.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: avatar == '' ?
                  CircleAvatar(
                      backgroundImage: genderId == 1
                          ? AssetImage(avatarMaleNull!)
                          : AssetImage(avatarFemaleNull!)
                      as ImageProvider):
                  CircleAvatar(  backgroundImage: MemoryImage(bytesImage!)),

                ),
              ),

            ],
          ),

      ),
    );

  }
}