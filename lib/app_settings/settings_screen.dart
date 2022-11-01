import 'package:color_picker/color_picker.dart';
import 'package:flutter/cupertino.dart';

/// Application settings screen
class SettingsScreen extends StatelessWidget {
  /// settings screen constructor
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Settings"),
      ),
      child: Center(
        child: PickerWidget(
          onColorChange: (_) {},
          startingColor: null,
        ),
      ),
    );
  }
}
