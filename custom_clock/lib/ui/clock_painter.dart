import 'dart:math';

import 'package:custom_clock/models/clock_model.dart';
import 'package:flutter/material.dart';

/// Clock painter
class ClockPainter extends CustomPainter {
  /// Clock painter constructor
  const ClockPainter({
    required this.backGroundColor,
    required this.currentTime,
  });

  /// Backgroung color for clock
  final Color backGroundColor;

  /// Current time to paint
  final MyClocks currentTime;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 7.0;
    final width = size.width;
    final height = size.height;
    final rect = Rect.fromCenter(
      center: Offset(width / 2, height / 2),
      width: width,
      height: height,
    );
    final backGroundPaint = Paint()..color = backGroundColor;
    final timePainter = Paint()
      // ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    const start = -pi / 2;
    final hoursEnd = pi / 6 * currentTime.hours;
    final minutesEnd = pi / 30 * currentTime.minutes;
    final secondsEnd = pi / 30 * currentTime.seconds;

    canvas
      ..drawCircle(
        rect.center,
        width / 2,
        backGroundPaint,
      )
      ..drawArc(
        rect.deflate(strokeWidth / 2),
        start,
        hoursEnd,
        false,
        timePainter..color = Colors.red,
      )
      ..drawArc(
        rect.deflate(strokeWidth * 1.5),
        start,
        minutesEnd,
        false,
        timePainter..color = Colors.green,
      )
      ..drawArc(
        rect.deflate(strokeWidth * 2.5),
        start,
        secondsEnd,
        false,
        timePainter..color = Colors.amber,
      );
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => oldDelegate != this;

  @override
  bool shouldRebuildSemantics(ClockPainter oldDelegate) => false;
}
