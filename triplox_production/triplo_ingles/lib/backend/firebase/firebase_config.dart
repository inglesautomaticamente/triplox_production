import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCgRpU7UhKVq7jsFs4RKRpMDQQf3OpavlI",
            authDomain: "triplo-ingles.firebaseapp.com",
            projectId: "triplo-ingles",
            storageBucket: "triplo-ingles.appspot.com",
            messagingSenderId: "645449668332",
            appId: "1:645449668332:web:e420c1122759ec073477c9",
            measurementId: "G-NYDH43SJP3"));
  } else {
    await Firebase.initializeApp();
  }
}
