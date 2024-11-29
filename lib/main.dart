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
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 50, // Sombra ligera
          iconTheme: IconThemeData(color: Colors.black),
        ),
        fontFamily: 'Roboto-Light',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Roboto-Regular',
            fontSize: 30, // Tamaño reducido
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 2.5, // Espaciado entre letras
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Roboto-Light',
            fontSize: 35, // Tamaño ajustado
            color: Colors.black,
            letterSpacing: 1.5,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Roboto-Light',
            fontSize: 12, // Tamaño ajustado
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
            fontSize: 30, // Ajustado para que no sea tan grande
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 5.5, // Espaciado entre letras
          ),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _WhiteBackgroundSection(
                child: ProjectSection(
                  title: 'LA RUTA DE LAS CAMPANAS',
                  textStyle: TextStyle(
                    fontSize: 34, // Tamaño reducido
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: 1.1, // Espaciado entre letras
                  ),
                ),
              ),
              SizedBox(height: 50),
              _WhiteBackgroundSection(
                child: ProjectSection(
                  title: 'LUTHERIA',
                  textStyle: TextStyle(
                    fontSize: 58, // Tamaño reducido
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: 28.0, // Espaciado entre letras
                  ),
                ),
              ),
              SizedBox(height: 50),
              _WhiteBackgroundSection(
                child: ProjectSection(
                  title: 'PERCUCIÓN',
                  textStyle: TextStyle(
                    fontSize: 49, // Tamaño reducido
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: 23.0, // Espaciado entre letras
                  ),
                ),
              ),
              SizedBox(height: 50),
              _WhiteBackgroundSection(
                child: ProjectSection(
                  title: 'PERFORMANCES',
                  textStyle: TextStyle(
                    fontSize: 39, // Tamaño reducido
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: 14.0, // Espaciado entre letras
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
    );
  }
}

class _WhiteBackgroundSection extends StatelessWidget {
  final Widget child;

  const _WhiteBackgroundSection({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }
}
