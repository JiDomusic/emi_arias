import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProjectDetail extends StatelessWidget {
  final String title;
  final List<String> images; // Lista de imágenes para el carrusel
  final String description;

  const ProjectDetail({
    super.key,
    required this.title,
    required this.images,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 8.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'DMSerifText',
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16.0),
            CarouselSlider(
              items: images
                  .map((image) => Image.asset(
                        image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 500,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 6),
                enlargeCenterPage: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
