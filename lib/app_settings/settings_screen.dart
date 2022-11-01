import 'package:clock_app/localization/strings_collection.dart';
import 'package:color_picker/color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Application settings screen
class SettingsScreen extends StatefulWidget {
  /// settings screen constructor
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: color,
      navigationBar: const CupertinoNavigationBar(
        middle: Text(AppTexts.settings),
      ),
      child: Center(
        child: PickerWidget(
          onColorChange: (Color newColor) {
            setState(() {
              color = newColor;
            });
          },
          startingColor: color,
        ),
      ),
    );
  }
}
