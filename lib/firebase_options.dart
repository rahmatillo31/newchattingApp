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
    apiKey: 'AIzaSyAnijLQxPo9CNGpok1hr8jrDbmY5YkLR8c',
    appId: '1:974586442677:web:261892be883f002ee41ffc',
    messagingSenderId: '974586442677',
    projectId: 'chatting-zone-78576',
    authDomain: 'chatting-zone-78576.firebaseapp.com',
    storageBucket: 'chatting-zone-78576.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwhr1kX81UACnpOyhYZN21_pBqxGeiAVo',
    appId: '1:974586442677:android:9cc00f2e53840f67e41ffc',
    messagingSenderId: '974586442677',
    projectId: 'chatting-zone-78576',
    storageBucket: 'chatting-zone-78576.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHfTKefLNS_ge6R9gkdUFOnAI1ZF3dnlM',
    appId: '1:974586442677:ios:ebbb519d3dadd7c4e41ffc',
    messagingSenderId: '974586442677',
    projectId: 'chatting-zone-78576',
    storageBucket: 'chatting-zone-78576.appspot.com',
    iosClientId: '974586442677-5b0s1u4hjak8ejb6g2m6nju5v5l5k45k.apps.googleusercontent.com',
    iosBundleId: 'com.example.chattingZone',
  );
}