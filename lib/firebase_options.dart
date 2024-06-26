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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyA6NvHe3xBykLnQ0xG3_7M8s_BTEGoxbgI',
    appId: '1:708613117421:web:0babf9e9a4c74affb543e4',
    messagingSenderId: '708613117421',
    projectId: 'datasync-63fc7',
    authDomain: 'datasync-63fc7.firebaseapp.com',
    storageBucket: 'datasync-63fc7.appspot.com',
    measurementId: 'G-GNSZXH7C72',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEPwuxe24_H1SrTt5udoeSIJkTXtXjpCs',
    appId: '1:708613117421:android:acffa7459fdd6435b543e4',
    messagingSenderId: '708613117421',
    projectId: 'datasync-63fc7',
    storageBucket: 'datasync-63fc7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2mNzCQmWVcszq7V9lEub4A54BJnvchjU',
    appId: '1:708613117421:ios:1acb1743f264ed67b543e4',
    messagingSenderId: '708613117421',
    projectId: 'datasync-63fc7',
    storageBucket: 'datasync-63fc7.appspot.com',
    iosBundleId: 'com.example.ehrMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2mNzCQmWVcszq7V9lEub4A54BJnvchjU',
    appId: '1:708613117421:ios:1acb1743f264ed67b543e4',
    messagingSenderId: '708613117421',
    projectId: 'datasync-63fc7',
    storageBucket: 'datasync-63fc7.appspot.com',
    iosBundleId: 'com.example.ehrMobile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA6NvHe3xBykLnQ0xG3_7M8s_BTEGoxbgI',
    appId: '1:708613117421:web:ba292bf71e75200fb543e4',
    messagingSenderId: '708613117421',
    projectId: 'datasync-63fc7',
    authDomain: 'datasync-63fc7.firebaseapp.com',
    storageBucket: 'datasync-63fc7.appspot.com',
    measurementId: 'G-10GP1PMSTH',
  );
}
