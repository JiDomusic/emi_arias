import 'package:emi_arias/project_detail.dart';
import 'package:flutter/material.dart';

class ProjectSection extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;

  const ProjectSection({
    super.key,
    required this.title,
    this.textStyle, // Permite pasar un estilo desde el constructor
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
    // Usamos el estilo global si no se pasa un estilo específico
    final defaultStyle = Theme.of(context).textTheme.displaySmall;

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
                fit: BoxFit.scaleDown, // Ajuste automático al contenedor
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textStyle ?? defaultStyle, // Estilo aplicado
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
