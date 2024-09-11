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
    apiKey: 'AIzaSyBhmCOgKMvJVI2EwTAdKSwy-KFSzbecMfE',
    appId: '1:1020246417236:web:18f57d1b0b42ed2ffeb2c1',
    messagingSenderId: '1020246417236',
    projectId: 'e-medicine-8ee78',
    authDomain: 'e-medicine-8ee78.firebaseapp.com',
    storageBucket: 'e-medicine-8ee78.appspot.com',
    measurementId: 'G-EZ77SKL0H0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGBSwk8bcQzawh6f4ugJpGfUTU7RrWldc',
    appId: '1:1020246417236:android:182eca5996fab1e1feb2c1',
    messagingSenderId: '1020246417236',
    projectId: 'e-medicine-8ee78',
    storageBucket: 'e-medicine-8ee78.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcGM57ajqJBYfE2u6a396TSgTniKpH6Qs',
    appId: '1:1020246417236:ios:e49306357fde5352feb2c1',
    messagingSenderId: '1020246417236',
    projectId: 'e-medicine-8ee78',
    storageBucket: 'e-medicine-8ee78.appspot.com',
    iosBundleId: 'com.example.eMedicine',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcGM57ajqJBYfE2u6a396TSgTniKpH6Qs',
    appId: '1:1020246417236:ios:e49306357fde5352feb2c1',
    messagingSenderId: '1020246417236',
    projectId: 'e-medicine-8ee78',
    storageBucket: 'e-medicine-8ee78.appspot.com',
    iosBundleId: 'com.example.eMedicine',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBhmCOgKMvJVI2EwTAdKSwy-KFSzbecMfE',
    appId: '1:1020246417236:web:39341116457fcf86feb2c1',
    messagingSenderId: '1020246417236',
    projectId: 'e-medicine-8ee78',
    authDomain: 'e-medicine-8ee78.firebaseapp.com',
    storageBucket: 'e-medicine-8ee78.appspot.com',
    measurementId: 'G-DLMC09P0K5',
  );
}
