import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/features/authentication/repos/authentication-repo.dart';
import 'package:tictok_clone/features/videos/view_models/palyback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          // ChangeNotifier를 AnimatedBuilder로 구독하지 않으면 초기값만 호출되고 변경사항에 따른 rebuild가 일어나지 않는다.
          // 또한 이 방식을 쓰면 필요한 부분만` rebuild가 일어난다. inheritWidget을 쓰면 전체 앱을 다시 rebuild하게된다.
          SwitchListTile.adaptive(
            value: ref.watch(playbackConfigProvider).muted,
            onChanged: (value) => {
              ref.read(playbackConfigProvider.notifier).setMuted(value),
            },
            title: const Text("Mute video"),
            subtitle: const Text("Videos will be muted by default."),
          ),
          SwitchListTile.adaptive(
            value: ref.watch(playbackConfigProvider).autoplay,
            onChanged: (value) => {
              ref.read(playbackConfigProvider.notifier).setAutopaly(value),
            },
            title: const Text("Autoplay"),
            subtitle: const Text("Videos will start playing automatically."),
          ),
          Switch.adaptive(
            value: false,
            onChanged: (value) {},
          ),
          CupertinoSwitch(
            value: false,
            onChanged: (value) {},
          ),
          Switch(
            value: false,
            onChanged: (value) {},
          ),
          SwitchListTile(
            value: false,
            onChanged: (value) {},
            title: const Text("Enable notification"),
          ),
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
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
              final time = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());
              if (kDebugMode) {
                print(time);
              }
              // if (!mounted) {
              //return; // await문 안에서 context를 사용할 땐 마운트 여부를 확인해줘야 함.
              //}
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
              showCupertinoDialog(
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
                      onPressed: () {
                        ref.read(authRepo).signOut();
                        context.go('/');
                      },
                      isDestructiveAction: true,
                      child: const Text("Yes please"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
