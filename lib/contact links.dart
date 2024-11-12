import 'package:flutter/material.dart';

class ContactLinks extends StatelessWidget {
  const ContactLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.facebook),
            onPressed: () {
              // URL de Facebook de Emiliana
            },
            iconSize: 30,
            color: Colors.black,
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: const Icon(Icons.dashboard),
            onPressed: () {
              // URL de Instagram de Emiliana
            },
            iconSize: 30,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
