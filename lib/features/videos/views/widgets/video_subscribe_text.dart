import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tictok_clone/constants/sizes.dart';

class VideoSubscribeText extends StatefulWidget {
  final String subscribe;
  const VideoSubscribeText({
    super.key,
    required this.subscribe,
  });

  @override
  State<VideoSubscribeText> createState() => _VideoSubscribeTextState();
}

class _VideoSubscribeTextState extends State<VideoSubscribeText> {
  bool isSeeMore = false;

  void _onSeeTap() {
    setState(() {
      isSeeMore = !isSeeMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: isSeeMore ? 5 : 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: const TextStyle(
          fontSize: Sizes.size16,
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: widget.subscribe
                .substring(0, isSeeMore ? widget.subscribe.length : 30),
          ),
          TextSpan(
              text: isSeeMore ? "...See less" : "...See more",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = _onSeeTap)
        ],
      ),
    );
  }
}
