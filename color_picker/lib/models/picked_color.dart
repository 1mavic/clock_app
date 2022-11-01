import 'package:flutter/material.dart';

/// Picked Color model class
@immutable
class PickedColor {
  /// class constructor
  const PickedColor(
    this._saturation,
    this._lightness,
    this._hue,
  );

  /// cinsructor form initiating without start color
  const PickedColor.start()
      : _hue = 0,
        _saturation = 1,
        _lightness = 0.5;

  /// factory constructor from initial coor
  factory PickedColor.fromInitial(Color? initialColor) {
    if (initialColor == null) {
      return const PickedColor.start();
    }
    final hslColor = HSLColor.fromColor(initialColor);
    return PickedColor(
      hslColor.saturation,
      hslColor.lightness,
      hslColor.hue,
    );
  }

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

  /// get current color in RGB
  Color get toColor => HSLColor.fromAHSL(
        1,
        _hue,
        _saturation,
        _lightness,
      ).toColor();

  /// get color for picker
  Color get pickerColor => HSLColor.fromAHSL(
        1,
        _hue > 320 ? hue - 360 + 40 : hue + 40,
        1,
        0.5,
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
    double? saturation,
    double? lightness,
    double? hue,
  }) {
    return PickedColor(
      saturation ?? _saturation,
      lightness ?? _lightness,
      hue ?? _hue,
    );
  }

  @override
  String toString() {
    return '''PickedColor(_saturation: $_saturation, _lightness: $_lightness, _hue: $_hue)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PickedColor &&
        other._saturation == _saturation &&
        other._lightness == _lightness &&
        other._hue == _hue;
  }

  @override
  int get hashCode {
    return _saturation.hashCode ^ _lightness.hashCode ^ _hue.hashCode;
  }
}
