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
          iconTheme: IconThemeData(color: Colors.black38),
        ),
        fontFamily: 'BigShouldersInlineText-ExtraBold',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'BigShouldersInlineText-ExtraBold',
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 2,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'BigShouldersInlineText-ExtraBold',
            fontSize: 80,
            color: Colors.black,
            letterSpacing: 2,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'BigShouldersInlineText-ExtraBold',
            fontSize: 80,
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
            fontWeight: FontWeight.w500,
            color: Colors.black,
            letterSpacing: 6,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 120, horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: _WhiteBackgroundSection(
                      child: ProjectSection(
                        title: 'la ruta de las campanas',
                        textStyle: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        description:
                            'La Ruta de Las Campanas nació en el año 2018 como proyecto de relevamiento de campanarios de la ciudad de Rosario. Con el tiempo fue adquiriendo otras dimendiones. En 2023 presenté el proyecto de ordenanza "La Ruta de Las Campanas" al Honorable Consejo de la Ciudad y al año siguente publiqué el libro "La Ruta de Las Campanas".',
                        image: 'assets/images/libro1.jpg',
                        instagramUrl:
                            'https://www.instagram.com/larutadelascampanas/?hl=es',
                        moreInfoUrl:
                            'https://emr-rosario.gob.ar/page/libros/id/41444',
                        images: [],
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Expanded(
                    child: _WhiteBackgroundSection(
                      child: ProjectSection(
                        title: 'lutheria',
                        textStyle: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        description:
                            'Yunque es un proyecto de luthería experimental, un laboratorio de objetos sonoros donde errores y aciertos marcan el ritmo.',
                        image: 'assets/images/cuadriculaluteria.jpg',
                        instagramUrl:
                            'https://www.instagram.com/yunque_instrumentos/?hl=es-la',
                        moreInfoUrl: '',
                        images: ['assets/images/cuadriculaluteria.jpg'],
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Expanded(
                    child: _WhiteBackgroundSection(
                      child: ProjectSection(
                        title: 'percusión',
                        textStyle: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        description:
                            'Toco batería de manera autodidacta desde los 14 años. Con el tiempo mi curiosidad por los sonidos me llevó a experimentar con todo tipo de elementos dando como resultado sets percusivos de investigación experimental. El ritmo me resulta un lenguaje natural y muchas veces se representa en mí con la imagen de un engranaje.',
                        image: 'assets/images/rosario1.jpg',
                        instagramUrl: '',
                        moreInfoUrl: 'https://emilianaarias.bandcamp.com/',
                        images: [],
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Expanded(
                    child: _WhiteBackgroundSection(
                      child: ProjectSection(
                        title: 'performances',
                        textStyle: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        description: 'Performances. Cine. Teatro.',
                        image: 'assets/images/percusio.jpg',
                        videoLinks: [
                          'https://www.youtube.com/watch?v=pHp21XGGwDQ',
                          'https://www.youtube.com/watch?v=aDqcvvFo3lk',
                          'https://www.youtube.com/watch?v=3nhdI1zKXvQ',
                        ],
                        instagramUrl: '',
                        moreInfoUrl: '',
                        images: [],
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  _WhiteBackgroundSection(child: ContactLinks()),
                ],
              ),
            ),
          ),
          // Imágenes decorativas
          Positioned(
            top: 2,
            left: 20,
            child: _DecorativeImage(
              imagePath: 'assets/images/decor1.png',
              audioPlayer: _audioPlayer,
            ),
          ),
          Positioned(
            top: 2,
            right: 20,
            child: _DecorativeImage(
              imagePath: 'assets/images/decor2.png',
              audioPlayer: _audioPlayer,
            ),
          ),
          Positioned(
            bottom: 15,
            left: 20,
            child: _DecorativeImage(
              imagePath: 'assets/images/decor3.png',
              audioPlayer: _audioPlayer,
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: _DecorativeImage(
              imagePath: 'assets/images/decor4.png',
              audioPlayer: _audioPlayer,
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorativeImage extends StatefulWidget {
  final String imagePath;
  final AudioPlayer audioPlayer;

  const _DecorativeImage({
    required this.imagePath,
    required this.audioPlayer,
  });

  @override
  State<_DecorativeImage> createState() => _DecorativeImageState();
}

class _DecorativeImageState extends State<_DecorativeImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _controller.forward(); // Escalar la imagen
      },
      onExit: (_) {
        _controller.reverse(); // Volver al tamaño original
      },
      child: GestureDetector(
        onTap: () async {
          await widget.audioPlayer.seek(Duration.zero);
          await widget.audioPlayer.play();
        },
        child: ScaleTransition(
          scale: _controller,
          child: Image.asset(
            widget.imagePath,
            width: 10,
            height: 10,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
