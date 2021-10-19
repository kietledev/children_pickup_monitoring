import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.value,
    required this.style,
    this.numOfLine = 1,
  }) : super(key: key);
  final String value;
  final TextStyle style;
  final int numOfLine;
  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      margin: const EdgeInsets.only(top: 6, bottom: 24),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        initialValue: value,
        style: style,
        maxLines: numOfLine,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0),
              borderRadius: BorderRadius.circular(6.0),
            ),
            filled: true,
            fillColor: Colors.white),
        enabled: false,
      ),
    );
  }
}
