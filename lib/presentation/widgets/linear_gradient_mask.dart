import 'package:flutter/material.dart';

class LinearGradientMask extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final Widget child;
  const LinearGradientMask ({ Key? key , required this.child,
      required this.firstColor,
      required this.secondColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          radius: 3,
          colors: [firstColor, secondColor],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
