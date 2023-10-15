import 'package:flutter/cupertino.dart';
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
            print(date);
            final time = await showTimePicker(
                context: context, initialTime: TimeOfDay.now());
            print(time);
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
            print(booking);
          },
          title: const Text("What is your birthday?"),
        ),
        ListTile(
          title: const Text(
            "Log out",
          ),
          textColor: Colors.red,
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Please dont go'),
                actions: [
                  CupertinoDialogAction(
                    // 한 페이지가 제일 앞단에 라우팅 된 상태로 Navigator.of(context).pop()함
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("No"),
                  ),
                  CupertinoDialogAction(
                    onPressed: () => Navigator.of(context).pop(),
                    isDestructiveAction: true,
                    child: const Text("Yes"),
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
