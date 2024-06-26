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
    apiKey: 'AIzaSyB9cOFAt0cCwoLGZNPMaeB8Ey_pQTusLRw',
    appId: '1:120657316939:web:6d49c759fe2726cb7f11ce',
    messagingSenderId: '120657316939',
    projectId: 'sanaa-fi',
    authDomain: 'sanaa-fi.firebaseapp.com',
    databaseURL: 'https://sanaa-fi-default-rtdb.firebaseio.com',
    storageBucket: 'sanaa-fi.appspot.com',
    measurementId: 'G-XHMH5M7TRW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7tSpjNkiVjFa-9Jtz8XYYoTBAXj15sns',
    appId: '1:120657316939:android:018bf1499ac902427f11ce',
    messagingSenderId: '120657316939',
    projectId: 'sanaa-fi',
    databaseURL: 'https://sanaa-fi-default-rtdb.firebaseio.com',
    storageBucket: 'sanaa-fi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjxXyjJBLbYkTT_lgTGa5Is8FFb8S5Y1A',
    appId: '1:120657316939:ios:14a559329337499d7f11ce',
    messagingSenderId: '120657316939',
    projectId: 'sanaa-fi',
    databaseURL: 'https://sanaa-fi-default-rtdb.firebaseio.com',
    storageBucket: 'sanaa-fi.appspot.com',
    iosBundleId: 'com.sanaa.i',
  );
}
