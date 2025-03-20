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
    apiKey: 'AIzaSyBCNgSZW6BYG-PPa7SL7E4MUB8uttOQH20',
    appId: '1:350815746161:web:24941346d98f73f482c3d0',
    messagingSenderId: '350815746161',
    projectId: 'ppkd-mp',
    authDomain: 'ppkd-mp.firebaseapp.com',
    storageBucket: 'ppkd-mp.firebasestorage.app',
    measurementId: 'G-XG72TLRKC5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAE3Q3MpbAEYfbOOpmmsLSWjpBMKh-5TGc',
    appId: '1:350815746161:android:7131fa4fa87a38b882c3d0',
    messagingSenderId: '350815746161',
    projectId: 'ppkd-mp',
    storageBucket: 'ppkd-mp.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqU7XEEj-yWM6zr4FKtQuZ79aSzb8RrbA',
    appId: '1:350815746161:ios:34fba8d548629f5082c3d0',
    messagingSenderId: '350815746161',
    projectId: 'ppkd-mp',
    storageBucket: 'ppkd-mp.firebasestorage.app',
    androidClientId: '350815746161-g0mvuuqtss22u09bfi4k7cuffbpv34e7.apps.googleusercontent.com',
    iosClientId: '350815746161-c63ehftfqghgcam8dvm43ktk7v8ipv3b.apps.googleusercontent.com',
    iosBundleId: 'com.example.absenGeura',
  );
}
