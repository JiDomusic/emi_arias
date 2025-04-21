import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({super.key});

  @override
  State<AdminDash> createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _tituloTextoController = TextEditingController();
  final TextEditingController _lugarTextoController = TextEditingController();
  final TextEditingController _textoLargoController = TextEditingController();
  final TextEditingController _urlLinkController = TextEditingController();

  String? _editingDocId; // ID del documento en edición

  Future<void> _agregarOActualizarTexto() async {
    if (_formKey.currentState!.validate()) {
      final data = {
        'titulo': _tituloTextoController.text,
        'lugar': _lugarTextoController.text,
        'textoLargo': _textoLargoController.text,
        'links': _urlLinkController.text.isNotEmpty ? [_urlLinkController.text] : [],
        'updatedAt': Timestamp.now(),
      };

      if (_editingDocId != null) {
        await FirebaseFirestore.instance
            .collection('blogPosts')
            .doc(_editingDocId)
            .update(data);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Texto actualizado exitosamente')),
        );
      } else {
        await FirebaseFirestore.instance.collection('blogPosts').add({
          ...data,
          'createdAt': Timestamp.now(),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Texto agregado exitosamente')),
        );
      }

      _clearForm();
    }
  }

  void _clearForm() {
    _tituloTextoController.clear();
    _lugarTextoController.clear();
    _textoLargoController.clear();
    _urlLinkController.clear();
    _editingDocId = null;
  }

  Future<void> _eliminarDocumento(String id) async {
    await FirebaseFirestore.instance.collection('blogPosts').doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Texto eliminado')),
    );
  }

  void _cargarDatosParaEditar(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    setState(() {
      _tituloTextoController.text = data['titulo'] ?? '';
      _lugarTextoController.text = data['lugar'] ?? '';
      _textoLargoController.text = data['textoLargo'] ?? '';
      _urlLinkController.text =
      data['links'] != null && data['links'].isNotEmpty ? data['links'][0] : '';
      _editingDocId = doc.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel de Administración')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Agregar o Editar Texto',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _tituloTextoController,
                    decoration: const InputDecoration(labelText: 'Título'),
                    validator: (value) => value == null || value.isEmpty ? 'Ingrese un título' : null,
                  ),
                  TextFormField(
                    controller: _lugarTextoController,
                    decoration: const InputDecoration(labelText: 'Lugar'),
                  ),
                  TextFormField(
                    controller: _textoLargoController,
                    decoration: const InputDecoration(labelText: 'Texto Largo'),
                    maxLines: 5,
                    validator: (value) => value == null || value.isEmpty ? 'Ingrese el texto' : null,
                  ),
                  TextFormField(
                    controller: _urlLinkController,
                    decoration: const InputDecoration(labelText: 'Agregar un link (opcional)'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _agregarOActualizarTexto,
                        child: Text(_editingDocId != null ? 'Actualizar Texto' : 'Publicar Texto'),
                      ),
                      const SizedBox(width: 10),
                      if (_editingDocId != null)
                        OutlinedButton(
                          onPressed: _clearForm,
                          child: const Text('Cancelar Edición'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 40),
            const Text('Textos Publicados',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('blogPosts')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final doc = docs[index];
                    final data = doc.data() as Map<String, dynamic>;
                    final titulo = data['titulo'] ?? 'Sin título';
                    final lugar = data['lugar'] ?? '';
                    final texto = data['textoLargo'] ?? '';
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(titulo),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (lugar.isNotEmpty) Text('Lugar: $lugar'),
                            if (texto.isNotEmpty) Text('Texto: $texto'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _cargarDatosParaEditar(doc),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _eliminarDocumento(doc.id),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
