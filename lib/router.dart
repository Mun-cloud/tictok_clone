import 'package:go_router/go_router.dart';
import 'package:tictok_clone/features/videos/video_recording_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const VideoRecordingScreen(),
    ),

    // GoRoute(
    //   path: LoginScreen.routeName,
    //   builder: (context, state) => const LoginScreen(),
    // ),
    // GoRoute(
    //   path: UsernameScreen.routeName,
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       child: const UsernameScreen(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: ScaleTransition(scale: animation, child: child),
    //         );
    //       },
    //     );
    //   },
    // ),

    // GoRoute(
    //   path: '/users/:username',
    //   builder: (context, state) {
    //     final username = state.params["username"];
    //     final tab = state.queryParams["show"];
    //     return UserProfileScreen(username: username!, tab: tab!);
    //   },
    // )
  ],
);
