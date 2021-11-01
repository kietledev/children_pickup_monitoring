import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class CustomNumberOfPupilsPainter extends CustomPainter {
  CustomNumberOfPupilsPainter({
    required this.numberOfPupils,
    required this.absent,
    required this.allowed,
  });
  final int numberOfPupils;
  final int absent;
  final int allowed;

  final double startPoint = 1.5;
  final double sweepAngle = 6.3;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(
        Rect.fromCenter(
            center: center, width: size.width * 0.8, height: size.height * 0.8),
        -1.5,
        sweepAngle,
        false,
        getPaint(16, ColorConstants.primaryColor4));

    canvas.drawArc(
      Rect.fromCenter(
          center: center, width: size.width * 0.8, height: size.height * 0.8),
      startPoint,
      (sweepAngle / numberOfPupils) * allowed,
      false,
      getPaint(16, ColorConstants.primaryColor1),
    );

    canvas.drawArc(
      Rect.fromCenter(
          center: center, width: size.width * 0.8, height: size.height * 0.8),
      startPoint - ((sweepAngle / numberOfPupils) * absent),
      (sweepAngle / numberOfPupils) * absent,
      false,
      getPaint(16, ColorConstants.primaryColor2),
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
      ..strokeCap = StrokeCap.butt
      ..color = color
      ..strokeWidth = stroke;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
