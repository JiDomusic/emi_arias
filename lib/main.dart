import 'package:emi_arias/contactlinks.dart';
import 'package:emi_arias/project_section.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart'; // Importamos just_audio

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
          elevation: 40,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        fontFamily: 'SquadaOne-Regular',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'SquadaOne-Regular',
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 2,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'SquadaOne-Regular',
            fontSize: 30,
            color: Colors.black,
            letterSpacing: 2,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'SquadaOne-Regular',
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AudioPlayer _audioPlayer; // Instancia de AudioPlayer

  @override
  void initState() {
    super.initState();
    _initializeAudio(); // Inicializamos el reproductor
  }

  Future<void> _initializeAudio() async {
    _audioPlayer = AudioPlayer();
    try {
      await _audioPlayer
          .setAsset('assets/audio/audiocampana.mp3'); // Ruta del audio
      await _audioPlayer.play(); // Reproducir automáticamente
    } catch (e) {
      debugPrint('Error reproduciendo audio: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Liberar recursos al cerrar
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'emiliana arias',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            letterSpacing: 6,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 180.0, horizontal: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _WhiteBackgroundSection(
                child: ProjectSection(
                  title: 'la ruta de las campanas',
                  textStyle: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    letterSpacing: 0,
                  ),
                  description:
                      'La Ruta de Las Campanas nació en el año 2018 como proyecto de relevamiento de campanarios de la ciudad de Rosario. Con el tiempo fue adquiriendo otras dimendiones. En 2023 presenté el proyecto de ordenanza "La Ruta de Las Campanas" al Honorable Consejo de la Ciudad y al año siguente publiqué el libro "La Ruta de Las Campanas".',
                  images: [
                    'assets/images/libro1.jpg',
                    'assets/images/libro2.jpg',
                    'assets/images/libro2.jpg',
                    'assets/images/libro2.jpg',
                    'assets/images/libro2.jpg',
                  ],
                  instagramUrl:
                      'https://www.instagram.com/larutadelascampanas/?hl=es',
                  moreInfoUrl:
                      'https://emr-rosario.gob.ar/page/libros/id/41444/title/La-ruta-de-las-campanas',
                ),
              ),
              SizedBox(height: 35),
              _WhiteBackgroundSection(
                child: ProjectSection(
                  title: 'lutheria',
                  textStyle: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    letterSpacing: 0,
                  ),
                  description:
                      'Yunque es un proyecto de luthería experimental, un laboratorio de objetos sonoros donde errores y aciertos marcan el ritmo.',
                  images: [
                    'assets/images/yunque2.jpg',
                    'assets/images/libro1.jpg',
                    'assets/images/libro2.jpg',
                    'assets/images/yunque1.jpg',
                    'assets/images/libro1.jpg',
                    'assets/images/libro2.jpg'
                  ],
                  instagramUrl:
                      'https://www.instagram.com/yunque_instrumentos/?hl=es-la',
                  moreInfoUrl: '',
                ),
              ),
              SizedBox(height: 35),
              _WhiteBackgroundSection(
                child: ProjectSection(
                  title: 'percusión',
                  textStyle: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    letterSpacing: 0,
                  ),
                  description:
                      'Toco batería de manera autodidacta desde los 14 años. Con el tiempo mi curiosidad por los sonidos me llevó a experimentar con todo tipo de elementos dando como resultado sets percusivos de investigación experimental. El ritmo me resulta un lenguaje natural y muchas veces se representa en mi con la imagen de un engranaje.',
                  images: [
                    'assets/images/rosario1.jpg',
                    'assets/images/libro1.jpg',
                    'assets/images/libro2.jpg',
                    'assets/images/rosario1.jpg',
                    'assets/images/libro1.jpg',
                    'assets/images/libro2.jpg',
                  ],
                  instagramUrl: '',
                  moreInfoUrl: 'https://emilianaarias.bandcamp.com/',
                ),
              ),
              SizedBox(height: 35),
              _WhiteBackgroundSection(
                child: ProjectSection(
                  title: 'performances',
                  textStyle: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    letterSpacing: 0,
                  ),
                  description: 'Performances. Cine. Teatro',
                  images: [
                    'assets/images/yunque1.jpg',
                    'assets/images/libro1.jpg',
                    'assets/images/libro2.jpg',
                    'assets/images/libro1.jpg',
                    'assets/images/libro2.jpg',
                  ],
                  instagramUrl: '',
                  moreInfoUrl:
                      'https://lalulula.tv/documental-2/sueltos-documental-2/guo-cheng-crater/',
                ),
              ),
              SizedBox(height: 100),
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
      color: Colors.transparent,
      child: child,
    );
  }
}
