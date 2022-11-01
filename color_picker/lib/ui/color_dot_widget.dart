import 'package:flutter/material.dart';

/// Widget that represents current picked position
class ColorDotWidget extends StatelessWidget {
  /// constructor
  const ColorDotWidget({
    super.key,
    required this.size,
  });

  /// size of circle
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
