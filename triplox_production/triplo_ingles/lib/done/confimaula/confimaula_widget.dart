import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/menu_desktop_widget.dart';
import '/components/menu_mobile_widget.dart';
import '/components/nenhuma_nova_aula_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'confimaula_model.dart';
export 'confimaula_model.dart';

class ConfimaulaWidget extends StatefulWidget {
  const ConfimaulaWidget({super.key});

  static String routeName = 'confimaula';
  static String routePath = '/confimaula';

  @override
  State<ConfimaulaWidget> createState() => _ConfimaulaWidgetState();
}

class _ConfimaulaWidgetState extends State<ConfimaulaWidget> {
  late ConfimaulaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfimaulaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'confimaula'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONFIMAULA_PAGE_confimaula_ON_INIT_STATE');
      if (valueOrDefault<bool>(currentUserDocument?.professor, false) == true) {
        logFirebaseEvent('confimaula_set_dark_mode_settings');
        setDarkModeSetting(context, ThemeMode.dark);
        return;
      } else {
        logFirebaseEvent('confimaula_navigate_to');

        context.pushNamed(
          HomeWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );

        logFirebaseEvent('confimaula_set_dark_mode_settings');
        setDarkModeSetting(context, ThemeMode.dark);
        return;
      }
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
        title: 'Confirmar Aula',
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
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF0D3A91), Color(0xFF2660C5)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(-1.0, -0.34),
                          end: AlignmentDirectional(1.0, 0.34),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  50.0, 30.0, 50.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Você tem uma nova aula agendada!',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.sora(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFD9D9D9),
                                              fontSize: 26.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 22.0),
                                        child: Text(
                                          'Por favor, informe se confirma ou recusa essa aula!',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.sora(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFFD9D9D9),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) =>
                                          StreamBuilder<List<AulasRecord>>(
                                        stream: queryAulasRecord(
                                          queryBuilder: (aulasRecord) =>
                                              aulasRecord
                                                  .where(
                                                    'professor',
                                                    isEqualTo:
                                                        currentUserDocument
                                                            ?.professores,
                                                  )
                                                  .where(
                                                    'verificada',
                                                    isEqualTo: false,
                                                  )
                                                  .where(
                                                    'cancelar',
                                                    isEqualTo: false,
                                                  )
                                                  .orderBy('data'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<AulasRecord>
                                              listViewAulasRecordList =
                                              snapshot.data!;
                                          if (listViewAulasRecordList.isEmpty) {
                                            return NenhumaNovaAulaWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewAulasRecordList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewAulasRecord =
                                                  listViewAulasRecordList[
                                                      listViewIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 224.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Nome Aluno:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  listViewAulasRecord
                                                                      .nomeAluno,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      6.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Data:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                    "d/M/y",
                                                                    listViewAulasRecord
                                                                        .data!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      6.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Hora:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  listViewAulasRecord
                                                                      .horario,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      6.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Observação:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      listViewAulasRecord
                                                                          .observacao,
                                                                      'Nenhuma',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      6.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Telefone:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      listViewAulasRecord
                                                                          .telefoneAluno,
                                                                      'Nenhuma',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      24.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'CONFIMAULA_PAGE_RECUSAR_BTN_ON_TAP');
                                                                  if (getCurrentTimestamp <=
                                                                      functions.subtrairHoras(
                                                                          listViewAulasRecord
                                                                              .data!)) {
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');
                                                                    _model.alunoDados =
                                                                        await UsersRecord.getDocumentOnce(
                                                                            listViewAulasRecord.aluno!);
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');
                                                                    _model.apiResultihqCopy =
                                                                        await NotificaesGroup
                                                                            .notifyAulasStatusCall
                                                                            .call(
                                                                      typeNotify:
                                                                          'aula_cancelada',
                                                                      telAluno:
                                                                          listViewAulasRecord
                                                                              .telefoneAluno,
                                                                      telProf:
                                                                          listViewAulasRecord
                                                                              .telProfessor,
                                                                      dataAula:
                                                                          '${dateTimeFormat(
                                                                        "d/M",
                                                                        listViewAulasRecord
                                                                            .data,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )} ${listViewAulasRecord.horario}',
                                                                    );

                                                                    if ((_model
                                                                            .apiResultihqCopy
                                                                            ?.succeeded ??
                                                                        true)) {}
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    await listViewAulasRecord
                                                                        .reference
                                                                        .update(
                                                                            createAulasRecordData(
                                                                      cancelar:
                                                                          true,
                                                                      verificada:
                                                                          true,
                                                                      canceladoEm:
                                                                          getCurrentTimestamp,
                                                                    ));
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    var logsRecordReference1 =
                                                                        LogsRecord
                                                                            .collection
                                                                            .doc();
                                                                    await logsRecordReference1
                                                                        .set(
                                                                            createLogsRecordData(
                                                                      dateTime:
                                                                          getCurrentTimestamp,
                                                                      user: listViewAulasRecord
                                                                          .aluno,
                                                                      emailUser: _model
                                                                          .alunoDados
                                                                          ?.email,
                                                                      describe:
                                                                          'Professor recusou a aula do aluno definido em User',
                                                                      where:
                                                                          'Professor-confirmaula',
                                                                      saldoAnterior: _model
                                                                          .alunoDados
                                                                          ?.saldo,
                                                                      saldoAgora:
                                                                          _model.alunoDados!.saldo +
                                                                              1,
                                                                      professorId:
                                                                          currentUserDocument
                                                                              ?.professores,
                                                                      aulaRef:
                                                                          listViewAulasRecord
                                                                              .reference,
                                                                    ));
                                                                    _model.log1 =
                                                                        LogsRecord.getDocumentFromData(
                                                                            createLogsRecordData(
                                                                              dateTime: getCurrentTimestamp,
                                                                              user: listViewAulasRecord.aluno,
                                                                              emailUser: _model.alunoDados?.email,
                                                                              describe: 'Professor recusou a aula do aluno definido em User',
                                                                              where: 'Professor-confirmaula',
                                                                              saldoAnterior: _model.alunoDados?.saldo,
                                                                              saldoAgora: _model.alunoDados!.saldo + 1,
                                                                              professorId: currentUserDocument?.professores,
                                                                              aulaRef: listViewAulasRecord.reference,
                                                                            ),
                                                                            logsRecordReference1);
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    await listViewAulasRecord
                                                                        .aluno!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'saldo':
                                                                              FieldValue.increment(1),
                                                                          'Logs':
                                                                              FieldValue.arrayUnion([
                                                                            _model.log1?.reference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'Button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Agendamento cancelado',
                                                                          style:
                                                                              GoogleFonts.roboto(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            Color(0xFFDA2A0B),
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');
                                                                    _model.alunoDados2 =
                                                                        await UsersRecord.getDocumentOnce(
                                                                            listViewAulasRecord.aluno!);
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');
                                                                    _model.apiResultihqCopy1 =
                                                                        await NotificaesGroup
                                                                            .notifyAulasStatusCall
                                                                            .call(
                                                                      typeNotify:
                                                                          'aula_cancelada',
                                                                      telAluno:
                                                                          listViewAulasRecord
                                                                              .telefoneAluno,
                                                                      telProf:
                                                                          listViewAulasRecord
                                                                              .telProfessor,
                                                                      dataAula:
                                                                          '${dateTimeFormat(
                                                                        "d/M",
                                                                        listViewAulasRecord
                                                                            .data,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )} ${listViewAulasRecord.horario}',
                                                                    );

                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    await listViewAulasRecord
                                                                        .reference
                                                                        .update(
                                                                            createAulasRecordData(
                                                                      cancelar:
                                                                          true,
                                                                      verificada:
                                                                          true,
                                                                      canceladoEm:
                                                                          getCurrentTimestamp,
                                                                    ));
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    var logsRecordReference2 =
                                                                        LogsRecord
                                                                            .collection
                                                                            .doc();
                                                                    await logsRecordReference2
                                                                        .set(
                                                                            createLogsRecordData(
                                                                      dateTime:
                                                                          getCurrentTimestamp,
                                                                      user: listViewAulasRecord
                                                                          .aluno,
                                                                      emailUser: _model
                                                                          .alunoDados2
                                                                          ?.email,
                                                                      describe:
                                                                          'Professor recusou a aula do aluno definido em User',
                                                                      where:
                                                                          'Professor-confirmaula',
                                                                      saldoAnterior: _model
                                                                          .alunoDados2
                                                                          ?.saldo,
                                                                      saldoAgora:
                                                                          _model.alunoDados2!.saldo +
                                                                              1,
                                                                      professorId:
                                                                          currentUserDocument
                                                                              ?.professores,
                                                                      aulaRef:
                                                                          listViewAulasRecord
                                                                              .reference,
                                                                    ));
                                                                    _model.log2 =
                                                                        LogsRecord.getDocumentFromData(
                                                                            createLogsRecordData(
                                                                              dateTime: getCurrentTimestamp,
                                                                              user: listViewAulasRecord.aluno,
                                                                              emailUser: _model.alunoDados2?.email,
                                                                              describe: 'Professor recusou a aula do aluno definido em User',
                                                                              where: 'Professor-confirmaula',
                                                                              saldoAnterior: _model.alunoDados2?.saldo,
                                                                              saldoAgora: _model.alunoDados2!.saldo + 1,
                                                                              professorId: currentUserDocument?.professores,
                                                                              aulaRef: listViewAulasRecord.reference,
                                                                            ),
                                                                            logsRecordReference2);
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    await listViewAulasRecord
                                                                        .aluno!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'saldo':
                                                                              FieldValue.increment(1),
                                                                          'Logs':
                                                                              FieldValue.arrayUnion([
                                                                            _model.log2?.reference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'Button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Agendamento cancelado',
                                                                          style:
                                                                              GoogleFonts.roboto(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            Color(0xFFDA2A0B),
                                                                      ),
                                                                    );
                                                                  }

                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');
                                                                  unawaited(
                                                                    () async {
                                                                      _model.apiResult77l =
                                                                          await DeletaAgendamentoCall
                                                                              .call(
                                                                        idAula: listViewAulasRecord
                                                                            .reference
                                                                            .id,
                                                                      );
                                                                    }(),
                                                                  );

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text: 'Recusar',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFFCA3235),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .titleSmall,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'CONFIMAULA_PAGE_ACEITAR_BTN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');
                                                                  _model.apiResultb7q =
                                                                      await NotificaesGroup
                                                                          .notifyAulasStatusCall
                                                                          .call(
                                                                    typeNotify:
                                                                        'aula_confirmada',
                                                                    telAluno:
                                                                        listViewAulasRecord
                                                                            .telefoneAluno,
                                                                    telProf:
                                                                        listViewAulasRecord
                                                                            .telProfessor,
                                                                    dataAula:
                                                                        '${valueOrDefault<String>(
                                                                      dateTimeFormat(
                                                                        "d/M",
                                                                        listViewAulasRecord
                                                                            .data,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      '00',
                                                                    )} ${listViewAulasRecord.horario}',
                                                                  );

                                                                  if ((_model
                                                                          .apiResultb7q
                                                                          ?.succeeded ??
                                                                      true)) {}
                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');

                                                                  await listViewAulasRecord
                                                                      .reference
                                                                      .update(
                                                                          createAulasRecordData(
                                                                    verificada:
                                                                        true,
                                                                    finalizada:
                                                                        false,
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text: 'Aceitar',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFF2BBC55),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .titleSmall,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 24.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
