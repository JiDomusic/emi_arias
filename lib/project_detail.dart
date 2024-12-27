import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetail extends StatefulWidget {
  final String title;
  final String description;
  final String moreInfoUrl;
  final List<String> videoLinks;

  const ProjectDetail({
    super.key,
    required this.title,
    required this.description,
    required this.moreInfoUrl,
    this.videoLinks = const [],
    required List<String> images,
    required String image,
    required String instagramUrl,
  });

  String? get instagramUrl => null;

  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  // Variable para controlar el estado de los enlaces
  final Map<String, bool> _hoveringLinks = {};

  void _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  //  el título
  String getImageForTitle() {
    switch (widget.title.toLowerCase()) {
      case 'la ruta de las campanas':
        return 'assets/images/nuevacampanas.jpg';
      case 'lutheria':
        return 'assets/images/cuadriculaluteria2.jpg';
      case 'percusion':
        return 'assets/images/cuadriculapercusion2.jpg';
      case 'performances':
        return 'assets/images/cuadriculaperformances2.jpg';
      default:
        return 'assets/images/cuadriculapercusion2.jpg'; // Imagen por defecto
    }
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = getImageForTitle();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'BigShouldersInlineText-ExtraBold',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20.0), // Padding general
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmallScreen = constraints.maxWidth < 700; // móvil

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isSmallScreen
                      ? double.infinity
                      : 1200, // Limitamos el ancho máximo
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen
                    Container(
                      width: isSmallScreen ? 300 : 600, //en móvil
                      height: isSmallScreen ? 150 : 400, // pantallas pequeñas
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 70),
                    // Descripción
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.description,
                              style: const TextStyle(
                                fontFamily: 'BigShouldersInlineText-ExtraBold',
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 20),
                            if (widget.videoLinks.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: widget.videoLinks.map((url) {
                                  return MouseRegion(
                                    onEnter: (_) {
                                      setState(() {
                                        _hoveringLinks[url] = true;
                                      });
                                    },
                                    onExit: (_) {
                                      setState(() {
                                        _hoveringLinks[url] = false;
                                      });
                                    },
                                    child: GestureDetector(
                                      onTap: () => _openUrl(url),
                                      child: Text(
                                        url,
                                        style: TextStyle(
                                          color: _hoveringLinks[url] ?? false
                                              ? Colors.blueGrey
                                              : Colors.blueAccent,
                                          fontSize: 18,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // No mostramos el icono de Instagram aquí
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emiliana Arias'),
        actions: [
          GestureDetector(
            onTap: () {
              _openInstagramUrl();
            },
            child: const Icon(
              FontAwesomeIcons.instagram,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Contenido principal de la app',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  void _openInstagramUrl() async {
    const String instagramUrl = 'https://www.instagram.com/emilianaarias';
    final Uri uri = Uri.parse(instagramUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir $instagramUrl';
    }
  }
}
