import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/authentication/sign_up_screen.dart';
import 'package:tictok_clone/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 각 위젯들(회전 등)을 확실히 초기화 시켜줌

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    S.load(const Locale("ko"));
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'TikTok Clone',
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          primaryColor: const Color(0xFFE9435A),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFE9435A),
          ),
          textTheme: Typography.blackMountainView,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
          ),
          tabBarTheme: TabBarTheme(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
          ),
          listTileTheme: const ListTileThemeData(iconColor: Colors.black)),
      darkTheme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade700,
        ),
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFE9435A),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          surfaceTintColor: Colors.grey.shade900,
          actionsIconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey.shade100,
        ),
      ),
      home: const SignUpScreen(),
    );
  }
}

// class MainNavigationScreen extends StatelessWidget {
//   const MainNavigationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SizedBox(
//         width: size.width / 2,
//         child: LayoutBuilder(
//           builder: (context, constraints) => Container(
//             width: constraints.maxWidth,
//             height: constraints.maxHeight,
//             color: Colors.teal,
//             child: Center(
//               child: Text(
//                 "${size.width} ${constraints.maxWidth}",
//                 style: const TextStyle(color: Colors.white, fontSize: 98),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
