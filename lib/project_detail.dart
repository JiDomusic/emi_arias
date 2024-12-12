import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetail extends StatelessWidget {
  final String title;
  final String description;
  final List<String> images;
  final String instagramUrl;
  final String moreInfoUrl;

  const ProjectDetail({
    super.key,
    required this.title,
    required this.description,
    required this.images,
    required this.instagramUrl,
    required this.moreInfoUrl,
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
            fontFamily: 'SquadaOne-Regular',
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
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: images.map((image) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    height: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 70),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(35.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'SquadaOne-Regular',
                    fontSize: 22,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _openUrl(instagramUrl),
              child: const Icon(
                FontAwesomeIcons.instagram,
                size: 55,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () => _openUrl(moreInfoUrl),
              child: Image.asset(
                'assets/icons/book.png',
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
