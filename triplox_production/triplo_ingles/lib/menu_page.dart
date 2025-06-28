import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                context.pushNamed('home');
              },
            ),
            ListTile(
              title: Text('Cadastro Professor'),
              onTap: () {
                context.pushNamed('CadastroProfessor');
              },
            ),
            ListTile(
              title: Text('Agendamentos'),
              onTap: () {
                context.pushNamed('agendamentos');
              },
            ),
            ListTile(
              title: Text('Confirma Aula'),
              onTap: () {
                context.pushNamed('confimaula');
              },
            ),
            ListTile(
              title: Text('Histórico de Aulas'),
              onTap: () {
                context.pushNamed('histaulas');
              },
            ),
            ListTile(
              title: Text('Lista de Logs'),
              onTap: () {
                context.pushNamed('ListaLogs');
              },
            ),
            ListTile(
              title: Text('Lista de Usuários'),
              onTap: () {
                context.pushNamed('ListaUsuarios');
              },
            ),
            ListTile(
              title: Text('Perfil'),
              onTap: () {
                context.pushNamed('perfil');
              },
            ),
            ListTile(
              title: Text('Planos'),
              onTap: () {
                context.pushNamed('Planos');
              },
            ),
            ListTile(
              title: Text('Pré-Compra'),
              onTap: () {
                context.pushNamed('Precompra');
              },
            ),
            ListTile(
              title: Text('Transferir'),
              onTap: () {
                context.pushNamed('Transferir');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('home');
                },
                child: Text('Ir para Home'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('CadastroProfessor');
                },
                child: Text('Ir para Cadastro Professor'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('agendamentos');
                },
                child: Text('Ir para Agendamentos'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('confimaula');
                },
                child: Text('Ir para Confirma Aula'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('histaulas');
                },
                child: Text('Ir para Histórico de Aulas'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('ListaLogs');
                },
                child: Text('Ir para Lista de Logs'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('ListaUsuarios');
                },
                child: Text('Ir para Lista de Usuários'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('perfil');
                },
                child: Text('Ir para Perfil'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('Planos');
                },
                child: Text('Ir para Planos'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('Precompra');
                },
                child: Text('Ir para Pré-Compra'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed('Transferir');
                },
                child: Text('Ir para Transferir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
