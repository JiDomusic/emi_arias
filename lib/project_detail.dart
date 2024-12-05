import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetail extends StatelessWidget {
  const ProjectDetail({super.key, required String title});

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
        title: const Text(
          "La Ruta de las Campanas",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Roboto-Light',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        flexibleSpace: Positioned.fill(
          child: Image.asset(
            'assets/images/fondovintage.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/fondovintage.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Contenedores de fotos a la izquierda
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(8, (index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Imagen ${index + 1}',
                            style: const TextStyle(color: Colors.black45),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 20),
                // Texto a la derecha
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Este proyecto busca destacar la historia y recorrido cultural de las campanas. Aquí puedes explorar más información sobre su legado.",
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Iconos en la parte inferior
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => _openUrl(
                      'https://www.instagram.com/larutadelascampanas/?hl=es'),
                  child: const Icon(
                    FontAwesomeIcons.instagram,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _openUrl(
                      'https://emr-rosario.gob.ar/page/libros/id/41444/title/La-ruta-de-las-campanas'),
                  child: const Text('Más Info'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
