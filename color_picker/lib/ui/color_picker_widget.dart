import 'dart:developer';
import 'dart:ui';

import 'package:color_picker/models/picker_position.dart';
import 'package:color_picker/ui/color_gradient.dart';
import 'package:color_picker/ui/color_dot_widget.dart';
import 'package:flutter/material.dart';

/// Color picker Widget
class ColorPickerWidget extends StatelessWidget {
  /// Color picker Widget constructor
  const ColorPickerWidget({
    super.key,
    required this.saturation,
    required this.lightness,
    required this.position,
    required this.onPositionChange,
  });

  ///circle saturation value
  final double saturation;

  ///circle lightness value
  final double lightness;

  ///  picker coordinates
  final PickerPosition? position;

  final void Function(PickerPosition newPosition) onPositionChange;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        log("tap");
      },
      onPanUpdate: (DragUpdateDetails details) => onPositionChange(
        (position ?? const PickerPosition.initial()).copyWith(
          x: details.localPosition.dx,
          y: details.localPosition.dy,
        ),
      ),
      onPanStart: (DragStartDetails details) => onPositionChange(
        (position ?? const PickerPosition.initial()).copyWith(
          x: details.localPosition.dx,
          y: details.localPosition.dy,
        ),
      ),
      child: Container(
        height: 20,
        width: size.width,
        // clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(color: Colors.amber),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: CustomPaint(
                painter: GradientPainter(
                  saturation: saturation,
                  lightness: lightness,
                ),
                child: SizedBox(
                  width: size.width,
                  height: size.width,
                ),
              ),
            ),
            ColorDotWidget(
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
