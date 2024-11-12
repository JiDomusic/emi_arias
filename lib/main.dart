import 'package:flutter/material.dart';

import 'contact links.dart';
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
        scaffoldBackgroundColor: Colors.grey,
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
            fontSize: 32,
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
              images: [
                'assets/yunque1.jpg',
                'assets/yunque2.jpg',
                'assets/yunque3.jpg'
              ],
              description: 'Descripción del proyecto Yunque Instrumentos...',
            ),
            ProjectSection(
              title: 'Libro (sin nombre aún)',
              images: [
                'assets/libro1.jpg',
                'assets/libro2.jpg',
                'assets/libro3.jpg'
              ],
              description: 'Descripción del libro de Emiliana...',
            ),
            ProjectSection(
              title: 'Baterista en Rosario',
              images: [
                'assets/rosario1.jpg',
                'assets/rosario2.jpg',
                'assets/rosario3.jpg'
              ],
              description:
                  'Emiliana fue baterista de muchas formaciones en Rosario...',
            ),
            ContactLinks(),
          ],
        ),
      ),
    );
  }
}
