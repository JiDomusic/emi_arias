import 'package:emi_arias/project_detail.dart';
import 'package:flutter/material.dart';

class ProjectSection extends StatelessWidget {
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
    this.videoLinks = const [],
    this.textStyle,
  });

  /// Método para navegar

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
          videoLinks: videoLinks,
          image: '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveStyle = textStyle ??
        Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.bold) ??
        const TextStyle(fontSize: 25, fontWeight: FontWeight.w500);

    // Construye el widget

    return GestureDetector(
      onTap: () => navigateToProjectDetail(context), // Navega a
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center, // Alinea el texto al centro.
            style: effectiveStyle,
          ),
        ),
      ),
    );
  }
}
