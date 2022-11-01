import 'package:flutter/material.dart';

@immutable

/// class with coordinates of picker
class PickerPosition {
  /// constructor
  const PickerPosition({
    required this.x,
    required this.y,
  });

  /// constructor with start coordinates
  const PickerPosition.initial()
      : x = 0,
        y = 0;

  /// x coordinate
  final double x;

  /// y coordinate
  final double y;

  /// copy with method
  PickerPosition copyWith({
    double? x,
    double? y,
  }) {
    return PickerPosition(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  @override
  String toString() => 'PickerPosition(x: $x, y: $y)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PickerPosition && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
