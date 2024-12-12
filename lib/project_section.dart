import 'package:emi_arias/project_detail.dart';
import 'package:flutter/material.dart';

/// Widget que representa una sección de proyecto. Esta sección puede ser utilizada
/// para mostrar proyectos en una lista, con un título que, al hacerle clic,
/// navega a una pantalla de detalle con más información sobre el proyecto.
class ProjectSection extends StatelessWidget {
  /// El título del proyecto que se mostrará en la sección.
  final String title;

  /// Descripción detallada del proyecto que será mostrada en la pantalla de detalles.
  final String description;

  /// Lista de URLs de las imágenes relacionadas con el proyecto.
  final List<String> images;

  /// URL del perfil de Instagram del proyecto/artista.
  final String instagramUrl;

  /// URL de más información sobre el proyecto (puede ser un sitio web, un artículo, etc.)
  final String moreInfoUrl;

  /// Estilo de texto opcional para personalizar el título.
  final TextStyle? textStyle;

  /// Constructor de la clase `ProjectSection`. Todos los parámetros son requeridos,
  /// excepto el estilo de texto, que es opcional.
  const ProjectSection({
    super.key,
    required this.title,
    required this.description,
    required this.images,
    required this.instagramUrl,
    required this.moreInfoUrl,
    this.textStyle, // Permite pasar un estilo desde el constructor
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
        const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);

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
