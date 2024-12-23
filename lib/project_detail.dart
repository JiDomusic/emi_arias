import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetail extends StatelessWidget {
  final String title;
  final String description;
  final List<String> images;
  final String instagramUrl;
  final String moreInfoUrl;
  final List<String> videoLinks;

  const ProjectDetail({
    super.key,
    required this.title,
    required this.description,
    required this.images,
    required this.instagramUrl,
    required this.moreInfoUrl,
    this.videoLinks = const [],
  });

  // Método para abrir un enlace
  void _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'BigShouldersInlineText-ExtraBold',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
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
        padding: const EdgeInsets.all(50.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: images.map((image) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.none,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 100),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  children: [
                    // Descripción del proyecto
                    Text(
                      description,
                      style: const TextStyle(
                        fontFamily: 'BigShouldersInlineText-ExtraBold',
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 50),
                    // Mostrar los enlaces solo si es "La Ruta de las Campanas"
                    if (title.trim().toLowerCase() ==
                        'la ruta de las campanas'.toLowerCase())
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => _openUrl(
                                'https://emr-rosario.gob.ar/page/libros/id/41444/title/La-ruta-de-las-campanas'),
                            child: Text(
                              'https://emr-rosario.gob.ar/page/libros/id/41444/title/La-ruta-de-las-campanas',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () => _openUrl(moreInfoUrl),
                            child: Text(
                              moreInfoUrl,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 30),
                    // Aquí agregamos el enlace de Bandcamp solo si el título es "Percusión"
                    if (title.trim().toLowerCase() == 'percusión' &&
                        moreInfoUrl.isNotEmpty)
                      GestureDetector(
                        onTap: () =>
                            _openUrl(moreInfoUrl), // Abrimos moreInfoUrl
                        child: Text(
                          'Más información sobre Percusión',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    const SizedBox(height: 30),
                    // Aquí agregamos los tres enlaces de YouTube (si es necesario)
                    if (videoLinks.isNotEmpty) ...[
                      const Text(
                        'Enlaces a YouTube:',
                        style: TextStyle(
                          fontFamily: 'BigShouldersInlineText-ExtraBold',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: videoLinks.map((url) {
                          return GestureDetector(
                            onTap: () => _openUrl(url),
                            child: Text(
                              url,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _openUrl(instagramUrl),
              child: const Icon(
                FontAwesomeIcons.instagram,
                size: 45,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
