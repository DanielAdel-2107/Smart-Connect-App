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
    apiKey: 'AIzaSyDomtPnyDqhtJT6zmlfu4nAT1ROEXmKYZA',
    appId: '1:631187201830:web:dcec7669174e16bf772be7',
    messagingSenderId: '631187201830',
    projectId: 'smart-connect-2ccaa',
    authDomain: 'smart-connect-2ccaa.firebaseapp.com',
    storageBucket: 'smart-connect-2ccaa.firebasestorage.app',
    measurementId: 'G-0T0NCQXRYH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJ3c-w9p25zGgnn_4KLegFdMLRWYR_WPU',
    appId: '1:631187201830:android:281f2b7c71f0e1f0772be7',
    messagingSenderId: '631187201830',
    projectId: 'smart-connect-2ccaa',
    storageBucket: 'smart-connect-2ccaa.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFUxMFIpNNNEWbvaSXotH4Xo5Okm5hC1U',
    appId: '1:631187201830:ios:c8f0604bac710ead772be7',
    messagingSenderId: '631187201830',
    projectId: 'smart-connect-2ccaa',
    storageBucket: 'smart-connect-2ccaa.firebasestorage.app',
    iosBundleId: 'com.example.smartConnect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFUxMFIpNNNEWbvaSXotH4Xo5Okm5hC1U',
    appId: '1:631187201830:ios:c8f0604bac710ead772be7',
    messagingSenderId: '631187201830',
    projectId: 'smart-connect-2ccaa',
    storageBucket: 'smart-connect-2ccaa.firebasestorage.app',
    iosBundleId: 'com.example.smartConnect',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDomtPnyDqhtJT6zmlfu4nAT1ROEXmKYZA',
    appId: '1:631187201830:web:540a41673d4e8525772be7',
    messagingSenderId: '631187201830',
    projectId: 'smart-connect-2ccaa',
    authDomain: 'smart-connect-2ccaa.firebaseapp.com',
    storageBucket: 'smart-connect-2ccaa.firebasestorage.app',
    measurementId: 'G-XF41HWWCND',
  );
}
