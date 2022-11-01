import 'package:clock_app/app_settings/app_settings.dart';
import 'package:clock_app/config/theme/app_theme.dart';
import 'package:custom_clock/custom_clock.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

/// MyApp
class MyApp extends StatelessWidget {
  /// MyApp constructor
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: ClockAppTheme.defaultTheme,
      home: const MainScreen(),
    );
  }
}

/// Main screen class
class MainScreen extends StatefulWidget {
  /// Main screen class constructor
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(5),
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute<dynamic>(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
          child: const Icon(
            CupertinoIcons.settings,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            ClockWidget(),
          ],
        ),
      ),
    );
  }
}
