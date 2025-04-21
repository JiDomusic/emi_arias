import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Iniciar sesión con correo y contraseña
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // Verificar si el usuario tiene permisos de administrador
      if (result.user != null && _isAdmin(result.user!)) {
        print("¡Acceso autorizado! El usuario es administrador.");
        return result;
      } else {
        // El usuario no es administrador, cerrar sesión
        if (kDebugMode) {
          print("El usuario no tiene permisos de administrador.");
        }
        await _auth.signOut(); // Cerrar sesión si no es administrador
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Obtener el usuario actual
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Función para verificar si el usuario es administrador
  bool _isAdmin(User user) {
    // Verificar si el correo del usuario coincide con uno de los administradores
    return user.email == "larutadelascampanas@gmail.com" ||
        user.email == "dominguezmariajimena@gmail.com";
  }

  // Comprobar si el usuario está autenticado y es administrador
  bool isAuthenticated() {
    User? user = _auth.currentUser;
    return user != null && _isAdmin(user);
  }
}