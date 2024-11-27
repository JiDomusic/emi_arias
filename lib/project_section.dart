import 'package:flutter/material.dart';

import 'project_detail.dart';

class ProjectSection extends StatelessWidget {
  final String title;

  const ProjectSection({
    super.key,
    required this.title,
  });

  void navigateToProjectDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetail(title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToProjectDetail(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit
                    .fill, // Estira el texto para ocupar el ancho disponible
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Roboto-Light',
                    fontSize:
                        20, // Tamaño base del texto (puede ajustarse automáticamente)
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
