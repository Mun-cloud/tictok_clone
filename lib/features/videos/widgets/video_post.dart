import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/videos/widgets/video_button.dart';
import 'package:tictok_clone/features/videos/widgets/video_comments.dart';
import 'package:tictok_clone/generated/l10n.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'video_subscribe_text.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;
  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _videoPlayerController;
  bool _isPause = false;
  final Duration _animationDuration = const Duration(milliseconds: 200);
  late final AnimationController _animationController;

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    _videoPlayerController =
        VideoPlayerController.asset("assets/videos/video2.mp4");
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    if (kIsWeb) {
      _videoPlayerController.setVolume(0);
    }
    _videoPlayerController.addListener(_onVideoChange);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_isPause &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (!mounted) return;
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPause = !_isPause;
    });
  }

  void _onCommentTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => const VideoComments(),
    );
    _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    // VisibilityDetector : 화면 표시 여부에 콜백 실행
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) => Transform.scale(
                    scale: _animationController.value,
                    child: child,
                  ),
                  child: AnimatedOpacity(
                    opacity: _isPause ? 1 : 0,
                    duration: _animationDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@Taeho",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                VideoSubscribeText(
                  subscribe:
                      "This is my house in tailand!!! This is my house in tailand!!! This is my house in tailand!!! This is my house in tailand!!! This is my house in tailand!!! This is my house in tailand!!! This is my house in tailand!!! This is my house in tailand!!! ",
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              right: 10,
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    radius: 25,
                    foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/85348363?v=4"),
                  ),
                  Gaps.v24,
                  VideoButton(
                      icon: FontAwesomeIcons.solidHeart,
                      text: S.of(context).likeCount(5498424416854)),
                  Gaps.v24,
                  GestureDetector(
                    onTap: () => _onCommentTap(context),
                    child: VideoButton(
                        icon: FontAwesomeIcons.solidComment,
                        text: S.of(context).commentCount(64546456)),
                  ),
                  Gaps.v24,
                  const VideoButton(
                      icon: FontAwesomeIcons.share, text: "Share"),
                ],
              ))
        ],
      ),
    );
  }
}
