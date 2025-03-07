// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBkVLqCvUx80yNUXS5xlq1OtsqxoCPpk9k',
    appId: '1:109246255843:web:2b538cd3872a92974febd6',
    messagingSenderId: '109246255843',
    projectId: 'chat-9c814',
    authDomain: 'chat-9c814.firebaseapp.com',
    storageBucket: 'chat-9c814.firebasestorage.app',
    measurementId: 'G-15QFCFHP0J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhCT6KJjRRnUt3DP6olXqlevhg9cSQG0Q',
    appId: '1:109246255843:android:011f05d295c564aa4febd6',
    messagingSenderId: '109246255843',
    projectId: 'chat-9c814',
    storageBucket: 'chat-9c814.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0ponsZndP58utHe_Eik1_XlB_yII_-cc',
    appId: '1:109246255843:ios:4968d9d00076ecda4febd6',
    messagingSenderId: '109246255843',
    projectId: 'chat-9c814',
    storageBucket: 'chat-9c814.firebasestorage.app',
    iosBundleId: 'com.example.chatApp1',
  );
}
