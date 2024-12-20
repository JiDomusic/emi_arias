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
        fontFamily: 'Exo2-SemiBold.ttf',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Exo2-SemiBold.ttf',
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 2,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Exo2-SemiBold.ttf',
            fontSize: 30,
            color: Colors.black,
            letterSpacing: 2,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Exo2-SemiBold.ttf',
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
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    _audioPlayer = AudioPlayer();
    try {
      await _audioPlayer.setAsset('assets/audio/audiocampana.mp3');
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('Error reproduciendo audio: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _WhiteBackgroundSection(
                  child: ProjectSection(
                    title: 'la ruta de las campanas',
                    textStyle: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    description:
                        'La Ruta de Las Campanas nació en el año 2018 como proyecto de relevamiento de campanarios de la ciudad de Rosario. Con el tiempo fue adquiriendo otras dimendiones. En 2023 presenté el proyecto de ordenanza "La Ruta de Las Campanas" al Honorable Consejo de la Ciudad y al año siguente publiqué el libro "La Ruta de Las Campanas"',
                    images: [
                      'assets/images/libro1.jpg',
                      'assets/images/libro2.jpg',
                    ],
                    instagramUrl:
                        'https://www.instagram.com/larutadelascampanas/?hl=es',
                    moreInfoUrl:
                        'https://emr-rosario.gob.ar/page/libros/id/41444',
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: _WhiteBackgroundSection(
                  child: ProjectSection(
                    title: 'lutheria',
                    textStyle: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    description:
                        'Yunque es un proyecto de luthería experimental, un laboratorio de objetos sonoros donde errores y aciertos marcan el ritmo.',
                    images: [
                      'assets/images/yunque2.jpg',
                      'assets/images/libro1.jpg',
                    ],
                    instagramUrl:
                        'https://www.instagram.com/yunque_instrumentos/?hl=es-la',
                    moreInfoUrl: '',
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: _WhiteBackgroundSection(
                  child: ProjectSection(
                    title: 'percusión',
                    textStyle: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    description:
                        'Toco batería de manera autodidacta desde los 14 años. Con el tiempo mi curiosidad por los sonidos me llevó a experimentar con todo tipo de elementos dando como resultado sets percusivos de investigación experimental. El ritmo me resulta un lenguaje natural y muchas veces se representa en mi con la imagen de un engranaje.',
                    images: [
                      'assets/images/rosario1.jpg',
                      'assets/images/libro1.jpg',
                    ],
                    moreInfoUrl: 'https://emilianaarias.bandcamp.com/',
                    instagramUrl: '',
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: _WhiteBackgroundSection(
                  child: ProjectSection(
                    title: 'performances',
                    textStyle: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    description: 'Performances. Cine. Teatro',
                    images: [
                      'assets/images/yunque1.jpg',
                      'assets/images/libro1.jpg',
                    ],
                    videoLinks: [
                      'https://www.youtube.com/watch?v=pHp21XGGwDQ',
                      'https://www.youtube.com/watch?v=aDqcvvFo3lk',
                      'https://www.youtube.com/watch?v=3nhdI1zKXvQ',
                    ],
                    instagramUrl: '',
                    moreInfoUrl: '',
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const _WhiteBackgroundSection(child: ContactLinks()),
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
