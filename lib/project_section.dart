import 'package:emi_arias/project_detail.dart';
import 'package:flutter/material.dart';

class ProjectSection extends StatelessWidget {
  final String title;
  final String image; // Imagen fija
  final String description;

  // Aquí tienes la lista de todas las imágenes dentro de la carpeta assets/images
  List<String> images = [
    'assets/images/libro2.jpg',
    'assets/images/yunque1.jpg',
    'assets/images.libro.jpg', // Puedes agregar más imágenes aquí
    'assets/images.rosario1.jpg',
    'assets/images.yunque2.jpg',

    // Agrega más imágenes según lo necesario
  ];

  ProjectSection({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required List<String> images,
  });

  void navigateToProjectDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetail(
          title: title,
          images: images, // Se pasa la lista de imágenes
          // description: description,
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
              height: 0,
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
