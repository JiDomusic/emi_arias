import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  final String title;
  final List<String> images;
  final String description;

  const ProjectDetailPage({
    super.key,
    required this.title,
    required this.images,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
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
                fontFamily: 'DancingScript',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'DancingScript',
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
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
