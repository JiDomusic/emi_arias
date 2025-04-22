import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:just_audio/just_audio.dart';
import 'firebase_options.dart';
import 'package:emi_arias/project_section.dart';
import 'package:emi_arias/contactlinks.dart';
import 'package:emi_arias/texts_page.dart';
import 'package:emi_arias/admin_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EmilianaAriasApp());
}

class EmilianaAriasApp extends StatelessWidget {
  const EmilianaAriasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emiliana Arias',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'BigShouldersInlineText-ExtraBold',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 20,
          iconTheme: IconThemeData(color: Colors.black38),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 2,
          ),
          bodyLarge: TextStyle(
            fontSize: 38,
            color: Colors.black,
            letterSpacing: 1.5,
          ),
        ),
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/textos': (context) => const TextsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AdminLoginPage()),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 700;
          return Stack(
            children: [
              const _MainContent(),
              _DecorativeOverlay(isVisible: isWide),
            ],
          );
        },
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Column(
        children: [
          _buildSection(const ProjectSection(
            title: 'la ruta de las campanas',
            description:
            'La Ruta de Las Campanas nació en el año 2018 como proyecto de relevamiento de campanarios de la ciudad de Rosario. Con el tiempo fue adquiriendo otras dimendiones. En 2023 presenté el proyecto de ordenanza "La Ruta de Las Campanas" al Honorable Consejo de la Ciudad y al año siguente publiqué el libro "La Ruta de Las Campanas"',
            image: 'assets/images/campanas.jpg',
            instagramUrl: 'https://www.instagram.com/larutadelascampanas/',
            moreInfoUrl: 'https://emr-rosario.gob.ar/page/libros/id/41444',
            videoLinks: [
              'https://emr-rosario.gob.ar/page/libros/id/41444/title/La-ruta-de-las-campanas',
              'https://docs.google.com/document/d/18hlsSTpLyC0vUf_ZH7hD4WTWk1FuJpto/',
            ],
            images: ['assets/images/cuadriculacampanas.webp'],
            projectId: '',
          )),
          _buildSection(const ProjectSection(
            title: 'luthería',
            description:
            'Yunque es un proyecto de luthería experimental, un laboratorio de objetos sonoros donde errores y aciertos marcan el ritmo.',
            image: 'assets/images/lutheria.jpg',
            instagramUrl: 'https://www.instagram.com/yunque_instrumentos/',
            videoLinks: ['https://www.instagram.com/yunque_instrumentos/'],
            images: ['assets/images/cuadriculalutheria.jpg'],
            moreInfoUrl: '',
            projectId: '',
          )),
          _buildSection(const ProjectSection(
            title: 'percusión',
            description: 'Álbumes de estudio en colaboración',
            image: 'assets/images/perusio3.jpg',
            moreInfoUrl: 'https://emilianaarias.bandcamp.com/',
            videoLinks: ['https://emilianaarias.bandcamp.com/'],
            images: ['assets/images/cuadriculapercusion2.jpg'],
            instagramUrl: '',
            projectId: '',
          )),
          _buildSection(const ProjectSection(
            title: 'performances',
            description: 'Performances. Cine. Teatro.',
            image: 'assets/images/cuadriculaperformances.jpg',
            videoLinks: [
              'https://www.youtube.com/watch?v=Xl0KKn8DRcY',
              'https://ladistanciaanimal-blog.tumblr.com/',
              'https://www.facebook.com/profile.php?id=100065022993837',
              'https://www.youtube.com/watch?v=WXxp-qm5RTE',
              'https://perfoping.blogspot.com/',
              'https://www.facebook.com/watch/?v=1041454055879071',
            ],
            images: ['assets/images/cuadriculaperformances2.jpg'],
            instagramUrl: '',
            moreInfoUrl: '',
            projectId: '',
          )),
          _buildSection(ProjectSection(
            title: 'Últimas novedades Blog Noticias',
            description: 'Artículos, reflexiones y enlaces a obras escritas.',
            image: '',
            videoLinks: const [],
            images: const [''],
            instagramUrl: '',
            moreInfoUrl: '',
            onTap: () {
              Navigator.pushNamed(context, '/textos');
            },
            projectId: '',
          )),
          _buildSection(const ContactLinks()),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

Widget _buildSection(Widget child) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    child: _WhiteBackgroundSection(child: child),
  );
}

class _WhiteBackgroundSection extends StatelessWidget {
  final Widget child;
  const _WhiteBackgroundSection({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: child,
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

class _DecorativeImageState extends State<_DecorativeImage> {
  final _player = AudioPlayer();
  bool _hovering = false;

  Future<void> _playSound() async {
    try {
      await _player.setAsset(widget.audioPath);
      await _player.play();
    } catch (e) {
      debugPrint('Error al reproducir sonido: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _hovering = true);
        _playSound();
      },
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedOpacity(
        opacity: _hovering ? 1.0 : 0.7,
        duration: const Duration(milliseconds: 300),
        child: AnimatedScale(
          scale: _hovering ? 1.4 : 1.7,
          duration: const Duration(milliseconds: 100),
          curve: Curves.linear,
          child: SizedBox(
            width: 95,
            height: 95,
            child: Image.asset(widget.imagePath, fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}

class _DecorativeOverlay extends StatelessWidget {
  final bool isVisible;
  const _DecorativeOverlay({required this.isVisible});

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink(); // Mejor performance
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 800),
      child: IgnorePointer(
        ignoring: !isVisible,
        child: const Stack(
          children: [
            Positioned(
              top: 40,
              left: 520,
              child: _DecorativeImage(
                imagePath: 'assets/images/campanas.jpg',
                audioPath: 'assets/audio/campana2.mp3',
              ),
            ),
            Positioned(
              top: 150,
              right: 500,
              child: _DecorativeImage(
                imagePath: 'assets/images/lutheria.jpg',
                audioPath: 'assets/audio/lutheria2.mp3',
              ),
            ),
            Positioned(
              bottom: 500,
              left: 600,
              child: _DecorativeImage(
                imagePath: 'assets/images/perusio3.jpg',
                audioPath: 'assets/audio/percusion2.mp3',
              ),
            ),
            Positioned(
              bottom: 350,
              right: 660,
              child: _DecorativeImage(
                imagePath: 'assets/images/zoomorfopreformance.jpg',
                audioPath: 'assets/audio/performance2.mp3',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
