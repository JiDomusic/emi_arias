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
            fontSize: 25,
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
                'assets/images/yunque1.jpg',
                'assets/images/yunque2.jpg',
                'assets/images/yunque3.jpg'
              ],
              description: 'Descripción del proyecto Yunque Instrumentos...',
            ),
            ProjectSection(
              title: 'Libro (sin nombre aún)',
              images: [
                'assets/images/libro1.jpg',
                'assets/images/libro2.jpg',
                'assets/images/libro3.jpg'
              ],
              description: 'Descripción del libro de Emiliana...',
            ),
            ProjectSection(
              title: 'Baterista en Rosario',
              images: [
                'assets/images/rosario1.jpg',
                'assets/images/rosario2.jpg',
                'assets/images/rosario3.jpg'
              ],
              description: 'Percucionista de muchas formaciones en Rosario...',
            ),
            ContactLinks(),
          ],
        ),
      ),
    );
  }
}
