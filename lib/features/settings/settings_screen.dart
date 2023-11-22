import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(children: [
        Switch.adaptive(
            value: _notifications, onChanged: _onNotificationsChanged),
        CupertinoSwitch(
            value: _notifications, onChanged: _onNotificationsChanged),
        Switch(value: _notifications, onChanged: _onNotificationsChanged),
        SwitchListTile(
          value: _notifications,
          onChanged: _onNotificationsChanged,
          title: const Text("Enable notification"),
        ),
        Checkbox(
          value: _notifications,
          onChanged: _onNotificationsChanged,
        ),
        CheckboxListTile(
          value: _notifications,
          onChanged: _onNotificationsChanged,
          title: const Text("Enable notifications"),
          activeColor: Colors.black,
        ),
        ListTile(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1980),
              lastDate: DateTime(2030),
            );
            if (kDebugMode) {
              print(date);
            }
            if (!mounted) return;
            final time = await showTimePicker(
                context: context, initialTime: TimeOfDay.now());
            if (kDebugMode) {
              print(time);
            }
            if (!mounted) return; // await문 안에서 context를 사용할 땐 마운트 여부를 확인해줘야 함.
            final booking = await showDateRangePicker(
              context: context,
              firstDate: DateTime(1980),
              lastDate: DateTime(2030),
              builder: (context, child) {
                return Theme(
                  data: ThemeData(
                    appBarTheme: const AppBarTheme(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (kDebugMode) {
              print(booking);
            }
          },
          title: const Text("What is your birthday?"),
        ),
        ListTile(
          title: const Text(
            "Log out (Android / Ios)",
          ),
          textColor: Colors.red,
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                title: const Text('Are you sure?'),
                message: const Text("Please dont go"),
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () => Navigator.of(context).pop(),
                    isDefaultAction: true,
                    child: const Text("Not log out"),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () => Navigator.of(context).pop(),
                    isDestructiveAction: true,
                    child: const Text("Yes please"),
                  ),
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}
