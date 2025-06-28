import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/components/menu_desktop_widget.dart';
import '/components/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/agendamento/admin/lista_usuarios_search/componentes/gerar_horarios_widget.dart';

class ListaUsuariosWidget extends StatefulWidget {
  const ListaUsuariosWidget({super.key});

  static String routeName = 'ListaUsuarios';
  static String routePath = '/listaUsuarios';

  @override
  State<ListaUsuariosWidget> createState() => _ListaUsuariosWidgetState();
}

class _ListaUsuariosWidgetState extends State<ListaUsuariosWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Menu Responsivo
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ))
                MenuDesktopWidget(),
              if (responsiveVisibility(context: context, desktop: false))
                MenuMobileWidget(),

              // Título
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Lista de Usuários',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: FlutterFlowTheme.of(context).bodyMedium,
                        color: Colors.white,
                        fontSize: 36.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),

              // Campo de busca (você pode colocar o widget aqui se quiser buscar por nome)

              // Tabela
              Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord.orderBy('email'),
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.all(30),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        List<UsersRecord> usersList = snapshot.data!;
                        return DataTable(
                          headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey[900]!),
                          dataRowColor: MaterialStateColor.resolveWith((states) => Colors.black),
                          headingTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          dataTextStyle: TextStyle(color: Colors.white),
                          columnSpacing: 40,
                          columns: [
                            DataColumn(label: Text('Foto')),
                            DataColumn(label: Text('Nome')),
                            DataColumn(label: Text('E-mail')),
                            DataColumn(label: Text('Telefone')),
                            DataColumn(label: Text('Saldo')),
                          ],
                          rows: usersList.map((user) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(user.photoUrl.isNotEmpty
                                        ? user.photoUrl
                                        : 'https://firebasestorage.googleapis.com/v0/b/triplo-ingles.appspot.com/o/depositphotos_406450006-stock-illustration-user-icon-vector-people-icon.jpg?alt=media&token=e9d08984-b082-4343-9cd2-34e43551b453&_gl=1*j936mt*_ga*MTUwMjU3NDM0Ni4xNjk1NDAyODIx*_ga_CW55HF8NVT*MTY5Njg3NTA3OS4zLjEuMTY5Njg3NTA5Mi40Ny4wLjA.'),
                                    radius: 20,
                                  ),
                                ),
                                DataCell(Text(user.displayName)),
                                DataCell(Text(user.email)),
                                DataCell(Text(user.phoneNumber)),
                                DataCell(Text(user.saldo.toString())),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
