// firebase_options.dart

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // Puedes expandir para Android e iOS si es necesario.
    // Por ahora, devolvemos la configuración para la plataforma web.
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyA1QLPTaWr-sAntW54EbCy3RquT_dwL8cg",
    authDomain: "emiarias-8d598.firebaseapp.com",
    projectId: "emiarias-8d598",
    storageBucket: "emiarias-8d598.firebasestorage.app",
    messagingSenderId: "764447049123",
    appId: "1:764447049123:web:3aba0216dacca892340616",
  );
}
