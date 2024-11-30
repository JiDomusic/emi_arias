import 'package:flutter/material.dart';

class ProjectDetail extends StatelessWidget {
  final String title;

  const ProjectDetail({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Roboto-Light',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Icon(
                Icons.home, // Ícono actual (puedes reemplazarlo con una imagen)
                size: 28,
                color: Colors.black,
              ),
            ),
          ),
        ],
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
                fontFamily: 'Roboto-Medium',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Aquí va el contenido del proyecto seleccionado. '
              'Puedes personalizar este texto según lo que necesites mostrar '
              'para cada proyecto.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto-Medium',
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
