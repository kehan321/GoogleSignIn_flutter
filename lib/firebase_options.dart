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
    apiKey: 'AIzaSyBGUrWedmmVSqwf1PfITzU1RhfpfqaapuI',
    appId: '1:1073928596627:web:5539a8ec7720c1455f3166',
    messagingSenderId: '1073928596627',
    projectId: 'acha-thek-hai',
    authDomain: 'acha-thek-hai.firebaseapp.com',
    storageBucket: 'acha-thek-hai.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeVrp7xcPqISJNYLq3l_NPWPXtJk0ZqAI',
    appId: '1:1073928596627:android:343c99234cc900865f3166',
    messagingSenderId: '1073928596627',
    projectId: 'acha-thek-hai',
    storageBucket: 'acha-thek-hai.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC38cboUTo76RrHu-Uw6pGzeoTODWiqF3Y',
    appId: '1:1073928596627:ios:6a56d4124d48bce35f3166',
    messagingSenderId: '1073928596627',
    projectId: 'acha-thek-hai',
    storageBucket: 'acha-thek-hai.appspot.com',
    androidClientId: '1073928596627-ik5sun18h0jc2r9fht5glq1qiqb1eqsi.apps.googleusercontent.com',
    iosClientId: '1073928596627-8fn6s1lsdi92fqp3lj3bihicstoes1p4.apps.googleusercontent.com',
    iosBundleId: 'com.example.social',
  );

}