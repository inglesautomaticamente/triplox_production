import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchUsuariosWidget extends StatefulWidget {
  @override
  _SearchUsuariosWidgetState createState() => _SearchUsuariosWidgetState();
}

class _SearchUsuariosWidgetState extends State<SearchUsuariosWidget> {
  String searchQuery = '';
  List<Map<String, dynamic>> usuarios = [];
  List<Map<String, dynamic>> filteredUsuarios = [];

  @override
  void initState() {
    super.initState();
    fetchUsuarios();
  }

  Future<void> fetchUsuarios() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();
    usuarios = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    setState(() {
      filteredUsuarios = usuarios;
    });
  }

  void filterSearch(String query) {
    List<Map<String, dynamic>> filtered = usuarios.where((usuario) {
      String email = usuario['email']?.toLowerCase() ?? '';
      return email.contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchQuery = query;
      filteredUsuarios = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Usuário por E-mail'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: filterSearch,
              decoration: InputDecoration(
                labelText: 'Digite o e-mail',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsuarios.length,
              itemBuilder: (context, index) {
                final usuario = filteredUsuarios[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(usuario['photoUrl'] ?? 'https://cdn-icons-png.flaticon.com/512/847/847969.png'),
                  ),
                  title: Text(usuario['display_name'] ?? 'Sem Nome'),
                  subtitle: Text(usuario['email'] ?? 'Sem E-mail'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
