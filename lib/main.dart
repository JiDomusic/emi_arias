import 'package:emi_arias/contactlinks.dart';
import 'package:emi_arias/project_section.dart';
import 'package:flutter/material.dart';

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
                      description: 'LA RUTA DE LAS CAMPANAS...',
                      images: [
                        'assets/images/libro1.jpg',
                        'assets/images/libro2.jpg'
                      ],
                      instagramUrl:
                          'https://www.instagram.com/larutadelascampanas/?hl=es',
                      moreInfoUrl:
                          'https://www.instagram.com/larutadelascampanas/?hl=es',
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
                      description: 'Instrumentos...',
                      images: ['assets/images/yunque1.jpg'],
                      instagramUrl:
                          'https://www.instagram.com/yunque_instrumentos/?hl=es-la',
                      moreInfoUrl: '',
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
                      description: 'Percusión...',
                      images: ['assets/images/rosario1.jpg'],
                      instagramUrl: '',
                      moreInfoUrl: 'https://emilianaarias.bandcamp.com/',
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
                      description: 'Performances...',
                      images: [],
                      instagramUrl: '',
                      moreInfoUrl:
                          'https://lalulula.tv/documental-2/sueltos-documental-2/guo-cheng-crater/',
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
