import 'package:cloud_firestore/cloud_firestore.dart';

class BlogPost {
  final String id;
  final String nombreTitulo;
  final String titulo;
  final String textoLargo;
  final String lugar;
  final Timestamp createdAt;

  BlogPost({
    required this.id,
    required this.nombreTitulo,
    required this.titulo,
    required this.textoLargo,
    required this.lugar,
    required this.createdAt,
  });

  // Convertir el objeto BlogPost en un mapa para Firestore
  Map<String, dynamic> toMap() {
    return {
      'nombreTitulo': nombreTitulo,
      'titulo': titulo,
      'textoLargo': textoLargo,
      'lugar': lugar,
      'createdAt': createdAt,
    };
  }

  // Crear un BlogPost a partir de un mapa (usado para Firestore)
  factory BlogPost.fromMap(Map<String, dynamic> map, String id) {
    return BlogPost(
      id: id,
      nombreTitulo: map['nombreTitulo'] ?? '',
      titulo: map['titulo'] ?? '',
      textoLargo: map['textoLargo'] ?? '',
      lugar: map['lugar'] ?? '',
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }
}

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Función para agregar un nuevo BlogPost
  Future<void> addBlogPost(BlogPost blogPost) async {
    try {
      // Agregamos un nuevo blog post en la colección 'blogPosts'
      await _db.collection('blogPosts').add(blogPost.toMap());
    } catch (e) {
      print('Error al agregar el BlogPost: $e');
      throw e;
    }
  }

  // Función para actualizar un BlogPost
  Future<void> updateBlogPost(BlogPost blogPost) async {
    try {
      // Actualizamos en la colección 'blogPosts'
      await _db.collection('blogPosts').doc(blogPost.id).update(blogPost.toMap());
    } catch (e) {
      print('Error al actualizar el BlogPost: $e');
      throw e;
    }
  }

  // Función para eliminar un BlogPost
  Future<void> deleteBlogPost(String id) async {
    try {
      // Eliminamos de la colección 'blogPosts'
      await _db.collection('blogPosts').doc(id).delete();
    } catch (e) {
      print('Error al eliminar el BlogPost: $e');
      throw e;
    }
  }

  // Función para obtener los BlogPosts
  Stream<QuerySnapshot> getBlogPosts() {
    return _db.collection('blogPosts').orderBy('createdAt', descending: true).snapshots();
  }

  // Función para obtener un BlogPost específico por ID
  Future<BlogPost> getBlogPostById(String id) async {
    try {
      DocumentSnapshot snapshot = await _db.collection('blogPosts').doc(id).get();
      if (snapshot.exists) {
        return BlogPost.fromMap(snapshot.data() as Map<String, dynamic>, id);
      } else {
        throw Exception('BlogPost no encontrado');
      }
    } catch (e) {
      print('Error al obtener el BlogPost: $e');
      throw e;
    }
  }

  // Función para obtener un proyecto específico por ID
  Future<Map<String, dynamic>?> getProject(String projectId) async {
    try {
      // Obtenemos el proyecto desde la colección 'projects' usando el ID del proyecto
      DocumentSnapshot snapshot = await _db.collection('projects').doc(projectId).get();

      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        print("Proyecto no encontrado");
        return null;
      }
    } catch (e) {
      print("Error al obtener el proyecto: $e");
      throw e;
    }
  }
}
