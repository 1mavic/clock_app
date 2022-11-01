library color_picker;

import 'dart:developer';

import 'package:color_picker/models/picked_color.dart';
import 'package:color_picker/ui/ui.dart';
import 'package:flutter/material.dart';

import 'models/picker_position.dart';

/// Color Picker Widget. Shows color gradient circle with saturation
///  and lightness sliders. In callback returns picked Color.
class PickerWidget extends StatefulWidget {
  /// Color widget consructor
  const PickerWidget({
    super.key,
    required this.onColorChange,
    this.startingColor,
  });

  /// return picked color
  final void Function(Color) onColorChange;

  /// initial color value. nullable.
  final Color? startingColor;
  @override
  State<PickerWidget> createState() => _PickerWidgetState();
}

class _PickerWidgetState extends State<PickerWidget> {
  late PickedColor pickedColor;
  @override
  void initState() {
    pickedColor = PickedColor.fromInitial(widget.startingColor);
    super.initState();
  }

  void changeColor(double? saturation, double? lightness) {
    setState(() {
      pickedColor = pickedColor.copyWith(
        saturation: saturation,
        lightness: lightness,
        hue: 0,
      );
    });
    log(pickedColor.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ColorPickerWidget(
          saturation: pickedColor.saturation,
          lightness: pickedColor.lightness,
          position: pickedColor.position,
          onPositionChange: (PickerPosition newPosition) {
            setState(() {
              pickedColor = pickedColor.copyWith(position: newPosition);
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        SliderWidget(
          value: pickedColor.saturation,
          onChange: (double newSaturation) {
            changeColor(
              newSaturation,
              null,
            );
          },
        ),
        SliderWidget(
          value: pickedColor.lightness,
          onChange: (double newLightness) {
            changeColor(
              null,
              newLightness,
            );
          },
        ),
      ],
    );
  }
}
