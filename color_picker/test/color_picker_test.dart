import 'package:color_picker/models/picked_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Picked color from null', () {
    final pickedColor = PickedColor.fromInitial();
    test('Picked color from null must be red', () {
      expect(pickedColor.hue, 0);
    });
    test('Picked color from null must have saturation 1', () {
      expect(pickedColor.saturation, 1);
    });
    test('Picked color from null must have lightness 0.5', () {
      expect(pickedColor.lightness, 0.5);
    });
  });

  group('Picked color from white', () {
    final pickedColor = PickedColor.fromInitial(Colors.white);
    test('Picked color from white hue must be 0', () {
      expect(pickedColor.hue, 0);
    });
    test('Picked color from white must have saturation 0', () {
      expect(pickedColor.saturation, 0);
    });
    test('Picked color from null must have lightness 1', () {
      expect(pickedColor.lightness, 1);
    });
  });

  group('Picked color from blue 258BD2', () {
    final pickedColor = PickedColor.fromInitial(const Color(0xFF258BD2));
    test('Picked color from white hue must be 205', () {
      expect(pickedColor.hue, 204.6242774566474);
    });
    test('Picked color from white must have saturation 0.7004048582995951', () {
      expect(pickedColor.saturation, 0.7004048582995951);
    });
    test('Picked color from null must have lightness0.4843137254901961', () {
      expect(pickedColor.lightness, 0.4843137254901961);
    });
  });

  group('Picked color from blue 0xFF258BD2. Testing getters', () {
    final pickedColor = PickedColor.fromInitial(const Color(0xFF258BD2));
    test('Picked color return color in RGB identical to initial color', () {
      expect(pickedColor.toColor, const Color(0xFF258BD2));
    });
    test('Picked color return color in Hsl equals to HSLColor.fromAHSL', () {
      expect(
        pickedColor.hsl,
        const HSLColor.fromAHSL(
          1,
          204.6242774566474,
          0.7004048582995951,
          0.4843137254901961,
        ),
      );
    });
    test('''
Picked color return picker color value 
          in RGB equals 0xFF1400FF''', () {
      expect(pickedColor.pickerColor, const Color(0xFF1400FF));
    });
  });
}
