import 'package:emi_arias/contactlinks.dart';
import 'package:emi_arias/project_section.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

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
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 20,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'emiliana arias',
          style: TextStyle(
            fontSize: 27,
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
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: _WhiteBackgroundSection(
                      child: ProjectSection(
                        title: 'la ruta de las campanas',
                        textStyle: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        description:
                            'La Ruta de Las Campanas nació en el año 2018 como proyecto de relevamiento de campanarios de la ciudad de Rosario. Con el tiempo fue adquiriendo otras dimendiones. En 2023 presenté el proyecto de ordenanza "La Ruta de Las Campanas" al Honorable Consejo de la Ciudad y al año siguente publiqué el libro "La Ruta de Las Campanas".',
                        image: 'assets/images/campanas.jpg',
                        instagramUrl:
                            'https://www.instagram.com/larutadelascampanas/?hl=es',
                        moreInfoUrl:
                            'https://emr-rosario.gob.ar/page/libros/id/41444',
                        videoLinks: [
                          'https://emr-rosario.gob.ar/page/libros/id/41444/title/La-ruta-de-las-campanas',
                          'https://docs.google.com/document/d/18hlsSTpLyC0vUf_ZH7hD4WTWk1FuJpto/edit?usp=sharing&ouid=105108450464616346072&rtpof=true&sd=true',
                        ],
                        images: ['assets/images/cuadriculacampanas.webp'],
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Flexible(
                    child: _WhiteBackgroundSection(
                      child: ProjectSection(
                        title: 'luthería',
                        textStyle: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        description:
                            'Yunque es un proyecto de luthería experimental, un laboratorio de objetos sonoros donde errores y aciertos marcan el ritmo.',
                        image: 'assets/images/lutheria.jpg',
                        instagramUrl:
                            'https://www.instagram.com/yunque_instrumentos/?hl=es-la',
                        moreInfoUrl: '',
                        images: ['assets/images/cuadriculalutheria.jpg'],
                        videoLinks: [
                          'https://www.instagram.com/yunque_instrumentos/?hl=es-la'
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Flexible(
                    child: _WhiteBackgroundSection(
                      child: ProjectSection(
                        title: 'percusión',
                        textStyle: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        description: 'Albumes de estudio en colaboración',
                        image: 'assets/images/perusio3.jpg',
                        instagramUrl: '',
                        moreInfoUrl: 'https://emilianaarias.bandcamp.com/',
                        videoLinks: ['https://emilianaarias.bandcamp.com/'],
                        images: ['assets/images/cuadriculapercusion2.jpg'],
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Flexible(
                    child: _WhiteBackgroundSection(
                      child: ProjectSection(
                        title: 'performances',
                        textStyle: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        description: 'Performances. Cine. Teatro.',
                        image: 'assets/images/cuadriculaperformances.jpg',
                        videoLinks: [
                          'https://www.youtube.com/watch?v=Xl0KKn8DRcY',
                          'https://ladistanciaanimal-blog.tumblr.com/post/126622302700/una-obra-de-danza-de-virginia-tuttolomondo-y-diego',
                          'https://www.facebook.com/profile.php?id=100065022993837',
                          'https://www.youtube.com/watch?v=WXxp-qm5RTE',
                          'https://perfoping.blogspot.com/',
                          'https://www.facebook.com/watch/?v=1041454055879071',
                        ],
                        instagramUrl: '',
                        moreInfoUrl: '',
                        images: [
                          'assets/images/cuadriculaperformances2.jpg',
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  _WhiteBackgroundSection(child: ContactLinks()),
                ],
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: MediaQuery.of(context).size.width / 2.1 - 270,
            child: const _DecorativeImage(
              imagePath: 'assets/images/campanas.jpg',
              audioPath: 'assets/audio/campana2.mp3',
            ),
          ),
          Positioned(
            top: 150,
            right: MediaQuery.of(context).size.width / 2.3 - 190,
            child: const _DecorativeImage(
              imagePath: 'assets/images/lutheria.jpg',
              audioPath: 'assets/audio/lutheria2.mp3',
            ),
          ),
          Positioned(
            bottom: 220,
            left: MediaQuery.of(context).size.width / 2 - 250,
            child: const _DecorativeImage(
              imagePath: 'assets/images/perusio3.jpg',
              audioPath: 'assets/audio/percusion2.mp3',
            ),
          ),
          Positioned(
            bottom: 80,
            right: MediaQuery.of(context).size.width / 1.8 - 352,
            child: const _DecorativeImage(
              imagePath: 'assets/images/zoomorfopreformance.jpg',
              audioPath: 'assets/audio/performance2.mp3',
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorativeImage extends StatefulWidget {
  final String imagePath;
  final String audioPath;

  const _DecorativeImage({
    required this.imagePath,
    required this.audioPath,
  });

  @override
  State<_DecorativeImage> createState() => _DecorativeImageState();
}

class _DecorativeImageState extends State<_DecorativeImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
    );
    _requestAudioPermission();
  }

  Future<void> _requestAudioPermission() async {
    if (await Permission.microphone.isDenied) {
      await Permission.microphone.request();
    }
  }

  Future<void> _playAudio() async {
    try {
      await _audioPlayer.setAsset(widget.audioPath);
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('Error al cargar el audio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _audioPlayer.seek(Duration.zero);
        await _audioPlayer.play();
      },
      child: MouseRegion(
        onEnter: (_) {
          _controller.forward();
          _playAudio();
        },
        onExit: (_) {
          _controller.reverse();
        },
        child: ScaleTransition(
          scale: _controller,
          child: Image.asset(
            opacity: AlwaysStoppedAnimation<double>(
                (MediaQuery.of(context).size.width > 750) ? 1.0 : 0.0),
            widget.imagePath,
            width: MediaQuery.of(context).size.width * 0.10,
            height: MediaQuery.of(context).size.height * 0.10,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
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
