import 'package:carousel_slider/carousel_slider.dart';
import 'package:emi_arias/projetdetailpage.dart';
import 'package:flutter/material.dart';

class ProjectSection extends StatelessWidget {
  final String title;
  final List<String> images;
  final String description;

  const ProjectSection({
    super.key,
    required this.title,
    required this.images,
    required this.description,
  });

  void navigateToProjectDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetailPage(
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
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () => navigateToProjectDetail(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'DMSerifText', // Cambiado a DM Serif Text
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'DMSerifText', // Cambiado a DM Serif Text
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
                height: 200,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                enlargeCenterPage: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
