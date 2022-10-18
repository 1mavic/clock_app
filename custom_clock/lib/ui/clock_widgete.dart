import 'dart:async';

import 'package:custom_clock/models/clock_model.dart';
import 'package:custom_clock/ui/clock_painter.dart';
import 'package:flutter/material.dart';

/// Clock widget
class ClockWidget extends StatefulWidget {
  /// clock widget constructor
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late Stream<MyClocks> timeStream;

  @override
  void initState() {
    super.initState();
    timeStream = Stream<MyClocks>.periodic(
      const Duration(seconds: 1),
      (_) => MyClocks(
        DateTime.now().hour,
        DateTime.now().minute,
        DateTime.now().second,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final clockSize = MediaQuery.of(context).size.width - 40;
    return SizedBox.square(
      dimension: clockSize,
      child: StreamBuilder<MyClocks>(
        stream: timeStream,
        builder: (BuildContext context, AsyncSnapshot<MyClocks> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return const SizedBox.shrink();
          }
          final data = snapshot.data;
          if (data == null) {
            return const SizedBox.shrink();
          }
          return CustomPaint(
            painter: ClockPainter(
              backGroundColor: Theme.of(context).colorScheme.secondary,
              currentTime: data,
            ),
          );
        },
      ),
    );
  }
}
