import 'package:emi_arias/project_detail.dart';
import 'package:flutter/material.dart';

class ProjectSection extends StatelessWidget {
  /// El título del proyecto que se mostrará en la sección.
  final String title;
  final String description;
  final List<String> images;
  final String image;
  final String instagramUrl;
  final String moreInfoUrl;
  final List<String> videoLinks;
  final TextStyle? textStyle;

  const ProjectSection({
    super.key,
    required this.title,
    required this.description,
    required this.images,
    required this.image,
    required this.instagramUrl,
    required this.moreInfoUrl,
    this.videoLinks = const [], // Valor predeterminado: lista vacía.
    this.textStyle,
  });

  /// Método para navegar a la pantalla de detalles del proyecto.
  /// Esta pantalla muestra información detallada sobre el proyecto, incluidas
  /// imágenes, descripción, enlaces a redes sociales y más información.
  void navigateToProjectDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetail(
          title: title,
          description: description,
          images: images,
          instagramUrl: instagramUrl,
          moreInfoUrl: moreInfoUrl,
          videoLinks: videoLinks, image: '', // Pasamos los enlaces de video.
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determina el estilo de texto que se debe usar. Si no se proporciona un estilo,
    // se usa el estilo predeterminado del tema con un peso de fuente en negrita.
    final TextStyle effectiveStyle = textStyle ??
        Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.bold) ??
        const TextStyle(fontSize: 26, fontWeight: FontWeight.w500);

    // Construye el widget que representa la sección del proyecto.
    return GestureDetector(
      onTap: () => navigateToProjectDetail(
          context), // Navega al detalle al tocar el widget.
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Text(
            title, // Muestra el título del proyecto en el centro.
            textAlign: TextAlign.center, // Alinea el texto al centro.
            style: effectiveStyle, // Aplica el estilo de texto determinado.
          ),
        ),
      ),
    );
  }
}
