
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;

  AnimatedToggle({
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
  });

  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 6, 0, 24),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              var index = 0;
              if (!initialPosition) {
                index = 1;
              }
              widget.onToggleCallback(index);
              setState(() {});
            },
            child: Container(
              height: 40,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.91),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        widget.values[0],
                        style: TextStyle(
                          fontFamily: FontsConstants.notoSans,
                          fontSize: 14,
                          color: const Color(0xAA000000),
                        ),
                      ),
                    ),
                    width:  MediaQuery. of(context). size. width / 2 - 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12,horizontal: 5),
                    width: 1,
                    color: Colors.white,
                  ),
                  Container(
                    width:  MediaQuery. of(context). size. width / 2 - 30,
                    child: Center(
                      child: Text(
                        widget.values[1],
                        style: TextStyle(
                          fontFamily: FontsConstants.notoSans,
                          fontSize: 14,
                          color: const Color(0xAA000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment:
            initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
              width: MediaQuery. of(context). size. width / 2 - 40,
              height: 36,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.91),
                ),
              ),
              child: Text(
                initialPosition ? widget.values[0] : widget.values[1],
                style: TextStyle(
                  fontFamily: FontsConstants.notoSans,
                  fontSize: 14,
                  color: widget.textColor,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
