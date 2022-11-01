import 'package:flutter/material.dart';

/// Painter for gradient circle
class GradientPainter extends CustomPainter {
  ///Painter constructor
  GradientPainter({
    required this.saturation,
    required this.lightness,
  });

  ///circle saturation value
  final double saturation;

  ///circle lightness value
  final double lightness;

  @override
  void paint(Canvas canvas, Size size) {
    //List of colors for gradient
    final colors = List.generate(
      360,
      (index) => HSLColor.fromAHSL(
        1,
        index.toDouble(),
        saturation,
        lightness,
      ).toColor(),
    );

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, 10),
      width: size.width,
      height: 20,
    );
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.bevel
      ..shader = LinearGradient(
        colors: [
          ...colors,
        ],
      ).createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(GradientPainter oldDelegate) =>
      oldDelegate.lightness != lightness ||
      oldDelegate.saturation != saturation;

  @override
  bool shouldRebuildSemantics(GradientPainter oldDelegate) => false;
}
