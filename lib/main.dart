import 'package:emi_arias/project_section.dart';
import 'package:flutter/material.dart';

import 'contactlinks.dart';

void main() {
  runApp(const EmilianaAriasApp());
}

class EmilianaAriasApp extends StatelessWidget {
  const EmilianaAriasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emiliana Arias',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 4, // Eliminar sombra para el fondo con imagen
          iconTheme: IconThemeData(color: Colors.black),
        ),
        fontFamily: 'Roboto-bold',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Roboto-bold',
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 2.5,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Roboto-Light',
            fontSize: 56,
            color: Colors.black,
            letterSpacing: 1.5,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Roboto-Light',
            fontSize: 50,
            color: Colors.black,
            letterSpacing: 1.2,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EMILIANA ARIAS',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 5.5,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Positioned.fill(
          child: Image.asset(
            'assets/images/fondovintage.jpg',
            fit: BoxFit.cover, // La imagen cubre todo el espacio
          ),
        ),
      ),
      body: Stack(
        children: [
          // Fondo de imagen
          Positioned.fill(
            child: Image.asset(
              'assets/images/fondovintage.jpg',
              fit:
                  BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
            ),
          ),
          // Contenido principal
          const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _WhiteBackgroundSection(
                    child: ProjectSection(
                      title: 'LA RUTA DE LAS CAMPANAS',
                      textStyle: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  _WhiteBackgroundSection(
                    child: ProjectSection(
                      title: 'LUTHERIA',
                      textStyle: TextStyle(
                        fontSize: 58,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: 28.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  _WhiteBackgroundSection(
                    child: ProjectSection(
                      title: 'PERCUCIÓN',
                      textStyle: TextStyle(
                        fontSize: 49,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: 23.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  _WhiteBackgroundSection(
                    child: ProjectSection(
                      title: 'PERFORMANCES',
                      textStyle: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: 14.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  _WhiteBackgroundSection(
                    child: ContactLinks(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WhiteBackgroundSection extends StatelessWidget {
  final Widget child;

  const _WhiteBackgroundSection({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: child,
    );
  }
}
