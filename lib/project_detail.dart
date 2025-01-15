import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetail extends StatefulWidget {
  final String title;
  final String description;
  final String moreInfoUrl;
  final List<String> videoLinks;

  const ProjectDetail({
    super.key,
    required this.title,
    required this.description,
    required this.moreInfoUrl,
    this.videoLinks = const [],
    required List<String> images,
    required String image,
    required String instagramUrl,
  });

  String? get instagramUrl => null;

  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  final Map<String, bool> _hoveringLinks = {};

  void _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  String getImageForTitle() {
    switch (widget.title.toLowerCase()) {
      case 'la ruta de las campanas':
        return 'assets/images/nuevacampanas.jpg';
      case 'luthería':
        return 'assets/images/cuadriculalutheria.jpg';
      case 'percusión':
        return 'assets/images/cuadriculapercusion2.jpg';
      case 'performances':
        return 'assets/images/cuadriculaperformances2.jpg';
      default:
        return 'assets/images/cuadriculalutheria.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 700;

    String imagePath = getImageForTitle();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'BigShouldersInlineText-ExtraBold',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: isSmallScreen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildImage(imagePath, isSmallScreen),
                          const SizedBox(height: 11),
                          _buildDescription(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildImage(imagePath, isSmallScreen),
                          const SizedBox(width: 20),
                          Expanded(child: _buildDescription()),
                        ],
                      ),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildImage(String imagePath, bool isSmallScreen) {
    return Container(
      width: isSmallScreen ? double.infinity : 400,
      height: isSmallScreen ? 250 : 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildDescription() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.description,
            style: const TextStyle(
              fontFamily: 'BigShouldersInlineText-ExtraBold',
              fontSize: 14.2,
              color: Colors.black87,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 3),
          if (widget.videoLinks.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.videoLinks.map((url) {
                return MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      _hoveringLinks[url] = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _hoveringLinks[url] = false;
                    });
                  },
                  child: GestureDetector(
                    onTap: () => _openUrl(url),
                    child: Text(
                      url,
                      style: TextStyle(
                        color: _hoveringLinks[url] ?? false
                            ? Colors.blueGrey
                            : Colors.blueAccent,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
