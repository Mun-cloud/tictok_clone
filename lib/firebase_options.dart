// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAyzMrkYcDRZE9SpTYj3FAHymhbF0w6r9M',
    appId: '1:775448109729:web:cada8a785747fb406f06e0',
    messagingSenderId: '775448109729',
    projectId: 'muncloud-tiktok',
    authDomain: 'muncloud-tiktok.firebaseapp.com',
    storageBucket: 'muncloud-tiktok.appspot.com',
    measurementId: 'G-8S9HKFEZ3B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZ0TifCnQpBtoxML75-40lRPnKv29Z1qc',
    appId: '1:775448109729:android:91037aa6228d68af6f06e0',
    messagingSenderId: '775448109729',
    projectId: 'muncloud-tiktok',
    storageBucket: 'muncloud-tiktok.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-A14X3EWyQF6yjnkApp8qP21HRRKrNvw',
    appId: '1:775448109729:ios:84d365a2c9ed30266f06e0',
    messagingSenderId: '775448109729',
    projectId: 'muncloud-tiktok',
    storageBucket: 'muncloud-tiktok.appspot.com',
    iosBundleId: 'com.example.tictokClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-A14X3EWyQF6yjnkApp8qP21HRRKrNvw',
    appId: '1:775448109729:ios:f605449cf76e1c5d6f06e0',
    messagingSenderId: '775448109729',
    projectId: 'muncloud-tiktok',
    storageBucket: 'muncloud-tiktok.appspot.com',
    iosBundleId: 'com.example.tictokClone.RunnerTests',
  );
}
