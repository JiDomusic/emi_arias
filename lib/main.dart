import 'package:flutter/material.dart';

import 'contactlinks.dart';
import 'project_section.dart';

void main() {
  runApp(const EmilianaAriasApp());
}

class EmilianaAriasApp extends StatelessWidget {
  const EmilianaAriasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMILIANA  ARIAS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily:
            'DMSerifText', // Aplica la fuente personalizada a toda la aplicación
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontFamily: 'DMSerifText',
              fontSize: 52,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          bodyLarge: TextStyle(
              fontFamily: 'DMSerifText', fontSize: 18, color: Colors.black),
          bodyMedium: TextStyle(
              fontFamily: 'DMSerifText', fontSize: 16, color: Colors.black),
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
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectSection(
              title: 'Yunque Instrumentos',
              image: 'assets/images/yunque1.jpg', // Imagen fija
              description: 'Descripción del proyecto Yunque Instrumentos...',
              images: [],
            ),
            ProjectSection(
              title: 'Libro (sin nombre aún)',
              image: 'assets/images/libro1.jpg', // Imagen fija
              description: 'Descripción del libro de Emiliana...', images: [],
            ),
            ProjectSection(
              title: 'Percucionista',
              image: 'assets/images/rosario1.jpg', // Imagen fija
              description: 'Percucionista de muchas formaciones en Rosario...',
              images: [],
            ),
            ContactLinks(),
          ],
        ),
      ),
    );
  }
}
