import 'package:color_picker/models/picker_position.dart';
import 'package:flutter/material.dart';

/// Picked Color model class
@immutable
class PickedColor {
  /// class constructor
  const PickedColor(
    this._position,
    this._saturation,
    this._lightness,
    this._hue,
  );

  /// cinsructor form initiating without start color
  const PickedColor.start()
      : _position = null,
        _hue = 0,
        _saturation = 1,
        _lightness = 0.5;

  /// factory constructor from initial coor
  factory PickedColor.fromInitial(Color? initialColor) {
    if (initialColor == null) {
      return const PickedColor.start();
    }
    final hslColor = HSLColor.fromColor(initialColor);
    return PickedColor(
      PickerPosition(x: 0, y: 0),
      hslColor.hue,
      hslColor.saturation,
      hslColor.lightness,
    );
  }

  /// coordinates of picked color
  final PickerPosition? _position;

  /// current saturation value
  final double _saturation;

  /// current lightness value
  final double _lightness;

  /// current hue value
  final double _hue;

  /// get saturation value
  double get saturation => _saturation;

  /// get lightness value
  double get lightness => _lightness;

  /// get hue value
  double get hue => _hue;

  /// get hue value
  PickerPosition? get position => _position;

  /// get current color in RGB
  Color get rgb => HSLColor.fromAHSL(
        1,
        _hue,
        _saturation,
        _lightness,
      ).toColor();

  /// get current color in HSL
  HSLColor get hsl => HSLColor.fromAHSL(
        1,
        _hue,
        _saturation,
        _lightness,
      );

  /// copy with
  PickedColor copyWith({
    PickerPosition? position,
    double? saturation,
    double? lightness,
    double? hue,
  }) {
    return PickedColor(
      position ?? _position,
      saturation ?? _saturation,
      lightness ?? _lightness,
      hue ?? _hue,
    );
  }

  @override
  String toString() {
    return 'PickedColor(_position: $_position, _saturation: $_saturation, _lightness: $_lightness, _hue: $_hue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PickedColor &&
        other._position == _position &&
        other._saturation == _saturation &&
        other._lightness == _lightness &&
        other._hue == _hue;
  }

  @override
  int get hashCode {
    return _position.hashCode ^
        _saturation.hashCode ^
        _lightness.hashCode ^
        _hue.hashCode;
  }
}
