import '/auth/firebase_auth/auth_util.dart';
import '/components/menu_desktop_widget.dart';
import '/components/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/agendamento/admin/lista_usuarios_search/componentes/gerar_horarios_widget.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'agenda_nova_model.dart';
export 'agenda_nova_model.dart';

class AgendaNovaWidget extends StatefulWidget {
  const AgendaNovaWidget({
    super.key,
    required this.professor,
  });

  final DocumentReference? professor;

  static String routeName = 'AgendaNova';
  static String routePath = '/agendamento';

  @override
  State<AgendaNovaWidget> createState() => _AgendaNovaWidgetState();
}

class _AgendaNovaWidgetState extends State<AgendaNovaWidget> {
  late AgendaNovaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendaNovaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AgendaNova'});
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
      title: 'AgendaNova',
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
                      'Agenda do Professor',
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: GerarHorariosWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
