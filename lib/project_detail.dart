import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectDetail extends StatefulWidget {
  final String title;
  final String description;
  final String moreInfoUrl;
  final List<String> videoLinks;
  final List<String> images;
  final String image;
  final String? instagramUrl;

  const ProjectDetail({
    super.key,
    required this.title,
    required this.description,
    required this.moreInfoUrl,
    required this.videoLinks,
    required this.images,
    required this.image,
    this.instagramUrl,
  });

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  final Map<String, bool> _hoveringLinks = {};
  late Stream<QuerySnapshot> _projectStream;

  @override
  void initState() {
    super.initState();
    _projectStream = FirebaseFirestore.instance
        .collection('projects')
        .where('title', isEqualTo: widget.title)
        .snapshots();
  }

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
      case 'textos':
        return 'assets/images/textos.jpg';
      default:
        return widget.images.isNotEmpty
            ? widget.images.first
            : 'assets/images/cuadriculalutheria.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: StreamBuilder<QuerySnapshot>(
          stream: _projectStream,
          builder: (context, snapshot) {
            String title = widget.title;
            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              var data = snapshot.data!.docs.first.data() as Map<String, dynamic>;
              title = data['title'] ?? widget.title;
            }
            return Text(
              title,
              style: const TextStyle(
                fontSize: 36,
                fontFamily: 'BigShouldersInlineText-ExtraBold',
                color: Colors.black,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _projectStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildContent(
              context,
              widget.description,
              widget.videoLinks,
              getImageForTitle(),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return _buildContent(
              context,
              widget.description,
              widget.videoLinks,
              getImageForTitle(),
            );
          }

          var data = snapshot.data!.docs.first.data() as Map<String, dynamic>;
          final String title = data['title'] ?? widget.title;
          final String description = data['description'] ?? widget.description;
          final List<String> videoLinks = List<String>.from(data['videoLinks'] ?? widget.videoLinks);
          final List<String> images = List<String>.from(data['images'] ?? widget.images);
          final String imagePath = images.isNotEmpty ? images.first : getImageForTitle();

          return _buildContent(context, description, videoLinks, imagePath);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, String description, List<String> videoLinks, String imagePath) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 19 / 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Text(
                description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'BigShouldersInlineText-ExtraBold',
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 20),
              if (videoLinks.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: videoLinks.map((url) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: MouseRegion(
                        onEnter: (_) => setState(() => _hoveringLinks[url] = true),
                        onExit: (_) => setState(() => _hoveringLinks[url] = false),
                        child: GestureDetector(
                          onTap: () => _openUrl(url),
                          child: Text(
                            url,
                            style: TextStyle(
                              fontSize: 16,
                              color: _hoveringLinks[url] == true
                                  ? Colors.deepPurple
                                  : Colors.blueAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

