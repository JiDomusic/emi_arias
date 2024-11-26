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
      title: 'Emiliana Arias',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'DMSerifText',
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
        elevation: 3,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectSection(
              title: 'La Ruta de las Campanas',
              image: 'assets/images/yunque1.jpg',
              images: [
                'assets/images/yunque1.jpg',
                'assets/images/yunque2.jpg',
              ],
              description: '',
            ),
            ProjectSection(
              title: 'Lutheria',
              image: 'assets/images/libro1.jpg',
              images: [
                'assets/images/libro1.jpg',
                'assets/images/libro2.jpg',
              ],
              description: '',
            ),
            ProjectSection(
              title: 'Percusión',
              image: 'assets/images/rosario1.jpg',
              images: [
                'assets/images/rosario1.jpg',
                'assets/images/rosario2.jpg',
              ],
              description: '',
            ),
            ProjectSection(
              title: 'Performances',
              image: 'assets/images/rosario1.jpg',
              images: [
                'assets/images/rosario1.jpg',
                'assets/images/rosario2.jpg',
              ],
              description: '',
            ),
            const ContactLinks(),
          ],
        ),
      ),
    );
  }
}
