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
            fontSize: 52,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Roboto-Light',
            fontSize: 18,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Roboto-Light',
            fontSize: 16,
            color: Colors.black,
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
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  title: 'Percución',
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

  const _WhiteBackgroundSection({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }
}
