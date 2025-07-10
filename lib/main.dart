import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tictok_clone/generated/l10n.dart';
import 'package:tictok_clone/screens/sign_up/sign_up_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
        primaryColor: const Color(
          0xFFE9435A,
        ),
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
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

