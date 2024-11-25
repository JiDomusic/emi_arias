import 'package:emi_arias/project_detail.dart';
import 'package:flutter/material.dart';

class ProjectSection extends StatelessWidget {
  final String title;
  final String image; // Imagen fija
  final List<String> images; // Lista de imágenes para el carrusel
  final String description;

  const ProjectSection({
    super.key,
    required this.title,
    required this.image,
    required this.images,
    required this.description,
  });

  void navigateToProjectDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetail(
          title: title,
          images: images,
          description: description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () => navigateToProjectDetail(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'DMSerifText',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16.0),
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(height: 16.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'DMSerifText',
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
