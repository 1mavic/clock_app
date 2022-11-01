import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Slider widget for changing saturation and lightness values
class SliderWidget extends StatefulWidget {
  /// Slider widget constuctor
  const SliderWidget({
    super.key,
    required this.value,
    required this.onChange,
  });

  /// value of slider
  final double value;

  /// callback to trigger on value change
  final void Function(double) onChange;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late double sliderValue;
  @override
  void initState() {
    sliderValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 1,
        // thumbShape: CustomThumb(
        //     12,
        //     widget.theme == ColorTheme.dark
        //         ? Colors.yellow
        //         : AppColors.blackBasic),
        // activeTrackColor: widget.theme == ColorTheme.dark
        //     ? Colors.yellow
        //     : AppColors.blackBasic,
        // inactiveTrackColor: widget.theme == ColorTheme.dark
        //     ? AppColors.grayD20.withOpacity(0.3)
        //     : AppColors.grayL60.withOpacity(0.3),
        // tickMarkShape: SliderTickMarkShape.noTickMark,
        // overlayColor: widget.theme == ColorTheme.dark
        //     ? Colors.yellow.withOpacity(0.2)
        //     : AppColors.blackBasic.withOpacity(0.2),
      ),
      child: CupertinoSlider(
        value: sliderValue,
        divisions: 100,

        // onChangeEnd: (double value) => widget.onChange(value / 100),
        onChanged: (double newVal) {
          setState(() {
            sliderValue = newVal;
            log(sliderValue.toString());
          });
        },
        onChangeEnd: (value) {
          widget.onChange(value);
        },
      ),
      // ),
    );
  }
}
