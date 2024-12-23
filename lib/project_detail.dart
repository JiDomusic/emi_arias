import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetail extends StatelessWidget {
  final String title;
  final String description;
  final String image; // Cambiado a una sola imagen
  final String instagramUrl;
  final String moreInfoUrl;
  final List<String> videoLinks;

  const ProjectDetail({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.instagramUrl,
    required this.moreInfoUrl,
    this.videoLinks = const [],
    required List<String> images,
  });

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
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image), // Mostrar una sola imagen
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
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
                    // Enlaces para "La Ruta de Las Campanas"
                    if (title.trim().toLowerCase() ==
                        'la ruta de las campanas'.toLowerCase()) ...[
                      GestureDetector(
                        onTap: () => _openUrl(
                            'https://emr-rosario.gob.ar/page/libros/id/41444/title/La-ruta-de-las-campanas'),
                        child: const Text(
                          'https://emr-rosario.gob.ar/page/libros/id/41444/title/La-ruta-de-las-campanas',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: videoLinks.map((url) {
                          return GestureDetector(
                            onTap: () => _openUrl(url),
                            child: Text(
                              url,
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                    const SizedBox(height: 30),
                    // Enlaces para "Performances"
                    if (title.trim().toLowerCase() == 'performances' &&
                        videoLinks.isNotEmpty) ...[
                      const Text(
                        '',
                        style: TextStyle(
                          fontFamily: 'BigShouldersInlineText-ExtraBold',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: videoLinks.map((url) {
                          return GestureDetector(
                            onTap: () => _openUrl(url),
                            child: Text(
                              url,
                              style: const TextStyle(
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
