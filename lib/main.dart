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
          elevation: 25, // Sombra ligera
          iconTheme: IconThemeData(color: Colors.black),
        ),
        fontFamily: 'Roboto-Light',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Roboto-Regular',
            fontSize: 24, // Tamaño de fuente ajustado
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 2.0, // Espaciado entre letras
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Roboto-Light',
            fontSize: 18,
            color: Colors.black,
            letterSpacing: 1.5, // Espaciado entre letras
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Roboto-Light',
            fontSize: 16,
            color: Colors.black,
            letterSpacing: 1.2, // Espaciado entre letras
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
          'Emiliana Arias',
          style: TextStyle(
            fontSize: 20, // Ajustado para que no sea tan grande
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 2.5, // Espaciado entre letras
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
                  title: 'La Ruta de las Campanas',
                ),
              ),
              SizedBox(height: 80),
              _WhiteBackgroundSection(
                child: ProjectSection(
                  title: 'Lutheria',
                ),
              ),
              SizedBox(height: 80),
              _WhiteBackgroundSection(
                child: ProjectSection(
                  title: 'Percusión',
                ),
              ),
              SizedBox(height: 80),
              _WhiteBackgroundSection(
                child: ProjectSection(
                  title: 'Performances',
                ),
              ),
              SizedBox(height: 80),
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
