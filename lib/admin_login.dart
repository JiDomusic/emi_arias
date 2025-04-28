import 'package:emi_arias/AdminDash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _error = "";

  void _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminDash()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _error = e.message ?? "Error al iniciar sesión";
      });
    } catch (e) {
      setState(() {
        _error = "Ocurrió un error inesperado";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Admin'),
        toolbarHeight: 60,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double fontSize = width < 400 ? 16 : width < 800 ? 22 : 28;

          final customTextStyle = TextStyle(
            fontSize: fontSize,
            fontFamily: 'TuFuentePersonalizada',
          );

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _emailController,
                          style: customTextStyle,
                          decoration: const InputDecoration(labelText: 'Correo'),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _passwordController,
                          style: customTextStyle,
                          decoration: const InputDecoration(labelText: 'Contraseña'),
                          obscureText: true,
                        ),
                        if (_error.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              _error,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          ),
                          child: const Text('Ingresar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
