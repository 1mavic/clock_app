library color_picker;

import 'package:color_picker/models/picked_color.dart';
import 'package:color_picker/ui/ui.dart';
import 'package:flutter/material.dart';

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

  void changeColor(double? hue, double? saturation, double? lightness) {
    setState(() {
      pickedColor = pickedColor.copyWith(
        saturation: saturation,
        lightness: lightness,
        hue: hue,
      );
    });
    widget.onColorChange(pickedColor.toColor);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        ColorSlider(
          saturation: pickedColor.saturation,
          lightness: pickedColor.lightness,
          pickerColor: pickedColor.pickerColor,
          onChange: (double newHue) {
            changeColor(
              newHue,
              null,
              null,
            );
          },
        ),
        SliderWidget(
          value: pickedColor.saturation,
          onChange: (double newSaturation) {
            changeColor(
              null,
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
              null,
              newLightness,
            );
          },
        ),
      ],
    );
  }
}
