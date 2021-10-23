import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.totalMinus,
    required this.currentMinus,
  });
  late int totalMinus;
  late int currentMinus;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    // print('object, $currentMinus');

    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        1,
        3,
        false,
        getPaint(2, ColorConstants.neutralColor4));

    canvas.drawArc(
        Rect.fromCenter(
            center: center,
            width: size.width * 0.83,
            height: size.height * 0.83),
        -1.5,
        6.1,
        false,
        getPaint(4, ColorConstants.neutralColor2));

    canvas.drawArc(
      Rect.fromCenter(center: center, width: 80, height: 80),
      -1.5,
      (totalMinus - currentMinus) > 0
          ? (6.3 / totalMinus) * (totalMinus - currentMinus)
          : 0,
      false,
      getPaint(4, ColorConstants.brandColor),
    );

    canvas.saveLayer(
      Rect.fromCenter(center: center, width: size.width, height: size.height),
      Paint(),
    );
    canvas.restore();
  }

  Paint getPaint(double stroke, Color color) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = color
      ..strokeWidth = stroke;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
