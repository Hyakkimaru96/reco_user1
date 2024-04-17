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
    apiKey: 'AIzaSyDeF_xg3hpuAis-UM0yiW25n3bgU_sIgWs',
    appId: '1:151401187120:web:d046a47fd060dc259aaaf5',
    messagingSenderId: '151401187120',
    projectId: 'junkee-c5bb1',
    authDomain: 'junkee-c5bb1.firebaseapp.com',
    storageBucket: 'junkee-c5bb1.appspot.com',
    measurementId: 'G-KWFEZTTKDB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4YsWjKgCzsKqPblTqYEW6-egLjugw6YI',
    appId: '1:151401187120:android:6b14c7cba69bf8679aaaf5',
    messagingSenderId: '151401187120',
    projectId: 'junkee-c5bb1',
    storageBucket: 'junkee-c5bb1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCDW-p8WUar8FRN45KCYPxtV2wM6jjSSE',
    appId: '1:151401187120:ios:7bb07957d735b41a9aaaf5',
    messagingSenderId: '151401187120',
    projectId: 'junkee-c5bb1',
    storageBucket: 'junkee-c5bb1.appspot.com',
    iosBundleId: 'com.example.junkee',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCDW-p8WUar8FRN45KCYPxtV2wM6jjSSE',
    appId: '1:151401187120:ios:7bb07957d735b41a9aaaf5',
    messagingSenderId: '151401187120',
    projectId: 'junkee-c5bb1',
    storageBucket: 'junkee-c5bb1.appspot.com',
    iosBundleId: 'com.example.junkee',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDeF_xg3hpuAis-UM0yiW25n3bgU_sIgWs',
    appId: '1:151401187120:web:39b4cc0ad73c587b9aaaf5',
    messagingSenderId: '151401187120',
    projectId: 'junkee-c5bb1',
    authDomain: 'junkee-c5bb1.firebaseapp.com',
    storageBucket: 'junkee-c5bb1.appspot.com',
    measurementId: 'G-L20KD9SMY4',
  );
}
