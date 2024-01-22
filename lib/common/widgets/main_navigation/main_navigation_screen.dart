import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/common/widgets/main_navigation/widgets/post_video_button.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/features/discover/discover_screen.dart';
import 'package:tictok_clone/features/inbox/inbox_screen.dart';
import 'package:tictok_clone/common/widgets/main_navigation/widgets/nav_tab.dart';
import 'package:tictok_clone/features/users/views/user_profile_screen.dart';

import 'package:tictok_clone/features/videos/views/video_recording_screen.dart';
import 'package:tictok_clone/features/videos/views/video_timeline_screen.dart';
import 'package:tictok_clone/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({super.key, required this.tab});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = ["home", "discover", "xxxx", "inbox", "profile"];
  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    context.pushNamed(VideoRecordingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      // 터치 키보드 출현(?) 따른 body값 변화 방지
      resizeToAvoidBottomInset: false,
      backgroundColor:
          _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          // bool offstage가 true이면 가려짐
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(
              username: "태호",
              tab: "",
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavTab(
                icon: FontAwesomeIcons.house,
                isSelected: _selectedIndex == 0,
                selectedIcon: FontAwesomeIcons.house,
                text: "Home",
                onTap: () => _onTap(0),
                inverted: _selectedIndex == 0,
              ),
              NavTab(
                icon: FontAwesomeIcons.compass,
                isSelected: _selectedIndex == 1,
                selectedIcon: FontAwesomeIcons.solidCompass,
                text: "Discover",
                onTap: () => _onTap(1),
                inverted: _selectedIndex == 0,
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: PostVideoButton(
                  inverted: _selectedIndex == 0,
                ),
              ),
              Gaps.h24,
              NavTab(
                icon: FontAwesomeIcons.message,
                isSelected: _selectedIndex == 3,
                selectedIcon: FontAwesomeIcons.solidMessage,
                text: "Inbox",
                onTap: () => _onTap(3),
                inverted: _selectedIndex == 0,
              ),
              NavTab(
                icon: FontAwesomeIcons.user,
                isSelected: _selectedIndex == 4,
                selectedIcon: FontAwesomeIcons.solidUser,
                text: "Profile",
                onTap: () => _onTap(4),
                inverted: _selectedIndex == 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
