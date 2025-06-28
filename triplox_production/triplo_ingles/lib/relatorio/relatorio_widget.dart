import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'relatorio_model.dart';
export 'relatorio_model.dart';

class RelatorioWidget extends StatefulWidget {
  const RelatorioWidget({super.key});

  static String routeName = 'Relatorio';
  static String routePath = '/relatorio';

  @override
  State<RelatorioWidget> createState() => _RelatorioWidgetState();
}

class _RelatorioWidgetState extends State<RelatorioWidget> {
  late RelatorioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RelatorioModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Relatorio'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('RELATORIO_PAGE_Relatorio_ON_INIT_STATE');
      logFirebaseEvent('Relatorio_firestore_query');
      _model.outUsers = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'pais',
          isNotEqualTo: 'xxxxxx',
        ),
      );
    });

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
        title: 'Relatorio',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
            ),
          ),
        ));
  }
}
