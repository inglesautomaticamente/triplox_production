import '/backend/backend.dart';
import '/components/alterar_saldo_widget.dart';
import '/components/aulasaluno_widget.dart';
import '/components/historico_saldo_widget.dart';
import '/components/menu_desktop_widget.dart';
import '/components/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lista_usuarios_model.dart';
export 'lista_usuarios_model.dart';

// ✅ IMPORTAÇÃO DO COMPONENTE
import '/pages/agendamento/admin/lista_usuarios_search/componentes/gerar_horarios_widget.dart';

class ListaUsuariosWidget extends StatefulWidget {
  const ListaUsuariosWidget({super.key});

  static String routeName = 'ListaUsuarios';
  static String routePath = '/listaUsuarios';

  @override
  State<ListaUsuariosWidget> createState() => _ListaUsuariosWidgetState();
}

class _ListaUsuariosWidgetState extends State<ListaUsuariosWidget> {
  late ListaUsuariosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaUsuariosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListaUsuarios'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'ListaUsuarios',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      wrapWithModel(
                        model: _model.menuDesktopModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuDesktopWidget(),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      desktop: false,
                    ))
                      wrapWithModel(
                        model: _model.menuMobileModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuMobileWidget(),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 92.0, 0.0, 0.0),
                      child: Text(
                        'Lista de Usuários',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: FlutterFlowTheme.of(context).bodyMedium,
                          color: Colors.white,
                          fontSize: 46.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // ✅ AQUI FOI ADICIONADO O COMPONENTE NOVO
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: GerarHorariosWidget(),
                    ),

                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 56.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                              ))
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 560.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(60.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Flexible(child: Text('Foto', style: FlutterFlowTheme.of(context).bodyMedium)),
                                            Flexible(child: Text('Nome', style: FlutterFlowTheme.of(context).bodyMedium)),
                                            Flexible(child: Text('E-mail', style: FlutterFlowTheme.of(context).bodyMedium)),
                                            Flexible(child: Text('Telefone', style: FlutterFlowTheme.of(context).bodyMedium)),
                                            Flexible(child: Text('Saldo', style: FlutterFlowTheme.of(context).bodyMedium)),
                                          ],
                                        ),
                                      ),
                                      Divider(thickness: 2.0, color: FlutterFlowTheme.of(context).accent4),
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 0.0, 0.0),
                                          child: StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                              queryBuilder: (usersRecord) => usersRecord.orderBy('email'),
                                            ),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: CircularProgressIndicator(
                                                      valueColor: AlwaysStoppedAnimation<Color>(FlutterFlowTheme.of(context).primary),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRecord> columnUsersRecordList = snapshot.data!;
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: List.generate(columnUsersRecordList.length, (columnIndex) {
                                                    final columnUsersRecord = columnUsersRecordList[columnIndex];
                                                    return Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Flexible(
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(8.0),
                                                              child: Image.network(
                                                                valueOrDefault<String>(
                                                                  columnUsersRecord.photoUrl,
                                                                  'https://firebasestorage.googleapis.com/v0/b/triplo-ingles.appspot.com/o/depositphotos_406450006-stock-illustration-user-icon-vector-people-icon.jpg?alt=media&token=e9d08984-b082-4343-9cd2-34e43551b453&_gl=1*j936mt*_ga*MTUwMjU3NDM0Ni4xNjk1NDAyODIx*_ga_CW55HF8NVT*MTY5Njg3NTA3OS4zLjEuMTY5Njg3NTA5Mi40Ny4wLjA.',
                                                                ),
                                                                width: 50.0,
                                                                height: 50.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Text(columnUsersRecord.displayName, style: FlutterFlowTheme.of(context).bodyMedium),
                                                          ),
                                                          Flexible(
                                                            child: Text(columnUsersRecord.email, style: FlutterFlowTheme.of(context).bodyMedium),
                                                          ),
                                                          Flexible(
                                                            child: Text(columnUsersRecord.phoneNumber, style: FlutterFlowTheme.of(context).bodyMedium),
                                                          ),
                                                          Flexible(
                                                            child: Text(columnUsersRecord.saldo.toString(), style: FlutterFlowTheme.of(context).bodyMedium),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (responsiveVisibility(context: context, desktop: false))
                                Text('Por favor, acesse pelo computador.', style: FlutterFlowTheme.of(context).bodyMedium),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
