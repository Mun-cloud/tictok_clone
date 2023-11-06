import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/utils.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIcon,
    required this.inverted,
  });

  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: inverted || isDark ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            opacity: isSelected || isDark ? 1 : 0.6,
            duration: const Duration(milliseconds: 100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelected ? selectedIcon : icon,
                  color: inverted || isDark ? Colors.white : Colors.black,
                ),
                Gaps.v5,
                Text(
                  text,
                  style: TextStyle(
                    color: inverted || isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
