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
  final VoidCallback? onTap; // <-- parámetro onTap agregado

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
    this.onTap, required String projectId, // <-- lo incluimos en el constructor
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = textStyle ??
        const TextStyle(fontSize: 35, fontWeight: FontWeight.w500);

    return GestureDetector(
      onTap: onTap ?? () => _navigateToDetail(context), // <-- usa onTap si está definido, si no, navega por defecto
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Center(
          child: Text(
            title,
            style: effectiveStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context) {
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
          image: image,
        ),
      ),
    );
  }
}
