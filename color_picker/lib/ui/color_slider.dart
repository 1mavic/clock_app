import 'package:color_picker/ui/ui.dart';
import 'package:flutter/material.dart';

/// Slider Widget to display gradient line and pick hue value
class ColorSlider extends StatefulWidget {
  /// constructor
  const ColorSlider({
    super.key,
    required this.saturation,
    required this.lightness,
    required this.onChange,
    required this.pickerColor,
  });

  /// color saturation value
  final double saturation;

  /// callback to trigger on value change
  final void Function(double) onChange;

  /// color lightness value
  final double lightness;

  /// slider picker color
  final Color pickerColor;
  @override
  State<ColorSlider> createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {
  late double sliderValue;

  @override
  void initState() {
    sliderValue = 180;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: GradientPainter(
              saturation: widget.saturation,
              lightness: widget.lightness,
            ),
            child: SizedBox(
              height: 20,
              width: width - 40,
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 1,
              overlayColor: Colors.transparent,
              activeTrackColor: Colors.transparent,
              inactiveTrackColor: Colors.transparent,
              thumbShape: _CustomThumb(
                10,
                widget.pickerColor,
              ),
            ),
            child: Slider(
              value: sliderValue,
              divisions: 360,
              max: 360,
              onChanged: (double newVal) {
                setState(() {
                  sliderValue = newVal;
                });
              },
              onChangeEnd: (value) {
                widget.onChange(value);
              },
            ),
            // ),
          ),
        ],
      ),
    );
  }
}

class _CustomThumb extends SliderComponentShape {
  _CustomThumb(this.height, this.color);
  final Color color;
  final double height;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.square(height);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final rect = Rect.fromPoints(
      Offset(
        center.dx + 3,
        center.dy + 10,
      ),
      Offset(
        center.dx - 3,
        center.dy - 10,
      ),
    );

    final fillPaint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawRect(rect, fillPaint);
  }
}
