import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLinks extends StatelessWidget {
  const ContactLinks({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Convertimos la URL en un objeto Uri
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Botón de Facebook
          IconButton(
            icon: const Icon(FontAwesomeIcons.facebook),
            onPressed: () {
              _launchURL('https://www.facebook.com/emiliana.arias.1');
            },
            iconSize: 30,
            color: Colors.black,
          ),
          const SizedBox(width: 20),
          // Botón de Instagram
          IconButton(
            icon: const Icon(FontAwesomeIcons.instagram),
            onPressed: () {
              _launchURL('https://www.instagram.com/___emi___a_');
            },
            iconSize: 30,
            color: Colors.black,
          ),
          const SizedBox(width: 20),
          // Botón de Bandcamp
          IconButton(
            icon: const Icon(FontAwesomeIcons.bandcamp),
            onPressed: () {
              _launchURL('https://emilianaarias.bandcamp.com/');
            },
            iconSize: 30,
            color: Colors.black,
          ),
          const SizedBox(width: 20),
          // Botón de SoundCloud
          IconButton(
            icon: const Icon(FontAwesomeIcons.soundcloud),
            onPressed: () {
              _launchURL('https://soundcloud.com/emiliana-arias');
            },
            iconSize: 30,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
