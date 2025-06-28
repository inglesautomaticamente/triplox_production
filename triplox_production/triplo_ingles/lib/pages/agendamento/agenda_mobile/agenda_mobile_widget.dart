import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/agendamento/observacao_agenda_nova/observacao_agenda_nova_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'agenda_mobile_model.dart';
export 'agenda_mobile_model.dart';

class AgendaMobileWidget extends StatefulWidget {
  const AgendaMobileWidget({
    super.key,
    required this.professor,
  });

  final DocumentReference? professor;

  static String routeName = 'agendaMobile';
  static String routePath = '/agendamentoMobile';

  @override
  State<AgendaMobileWidget> createState() => _AgendaMobileWidgetState();
}

class _AgendaMobileWidgetState extends State<AgendaMobileWidget>
    with TickerProviderStateMixin {
  late AgendaMobileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendaMobileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'agendaMobile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('AGENDA_MOBILE_agendaMobile_ON_INIT_STATE');
      logFirebaseEvent('agendaMobile_update_page_state');
      _model.diaDaSemana =
          functions.diadaSemana(_model.calenderMobileSelectedDay!.start);
      _model.daraOkPage =
          functions.dATAcorrigida(_model.calenderMobileSelectedDay!.start);
      safeSetState(() {});
      logFirebaseEvent('agendaMobile_backend_call');
      _model.outHoraiosPageLoad = await BuscaHorariosDisponiveisCall.call(
        data: _model.calenderMobileSelectedDay?.start.toString(),
        professorId: widget.professor?.id,
        diaSemana: _model.diaDaSemana,
      );

      if ((_model.outHoraiosPageLoad?.statusCode ?? 200) == 200) {
        logFirebaseEvent('agendaMobile_update_app_state');
        FFAppState().HorariosDisponiveisParaAgendar =
            BuscaHorariosDisponiveisCall.listHorarios(
          (_model.outHoraiosPageLoad?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().HoraiosStatus = 'have';
        FFAppState().update(() {});
      } else if ((_model.outHoraiosPageLoad?.statusCode ?? 200) == 201) {
        logFirebaseEvent('agendaMobile_update_app_state');
        FFAppState().HorariosDisponiveisParaAgendar = [];
        FFAppState().HoraiosStatus = 'empty';
        FFAppState().update(() {});
      }
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: -1.0,
          ),
        ],
      ),
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
    context.watch<FFAppState>();

    return StreamBuilder<ProfessoresRecord>(
      stream: ProfessoresRecord.getDocument(widget.professor!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final agendaMobileProfessoresRecord = snapshot.data!;

        return Title(
            title: 'Selecionar Data Mobile',
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
                  child: StreamBuilder<List<RemoverHorariosRecord>>(
                    stream: queryRemoverHorariosRecord(
                      parent: agendaMobileProfessoresRecord.reference,
                      queryBuilder: (removerHorariosRecord) =>
                          removerHorariosRecord.where(
                        'data',
                        isEqualTo: _model.calenderMobileSelectedDay?.start,
                      ),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<RemoverHorariosRecord>
                          containerRemoverHorariosRecordList = snapshot.data!;
                      final containerRemoverHorariosRecord =
                          containerRemoverHorariosRecordList.isNotEmpty
                              ? containerRemoverHorariosRecordList.first
                              : null;

                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.167,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: StreamBuilder<List<FuncionamentoRecord>>(
                          stream: queryFuncionamentoRecord(
                            parent: agendaMobileProfessoresRecord.reference,
                            queryBuilder: (funcionamentoRecord) =>
                                funcionamentoRecord.where(
                              'dia',
                              isEqualTo: _model.diaDaSemana,
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<FuncionamentoRecord>
                                columnFuncionamentoRecordList = snapshot.data!;
                            final columnFuncionamentoRecord =
                                columnFuncionamentoRecordList.isNotEmpty
                                    ? columnFuncionamentoRecordList.first
                                    : null;

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.menuMobileModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MenuMobileWidget(),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  50.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Detalhes \ndas aulas:',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  25.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 309.0,
                                                        height: 39.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF101010),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                agendaMobileProfessoresRecord
                                                                    .photoUrl,
                                                                width: 30.0,
                                                                height: 30.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Text(
                                                              agendaMobileProfessoresRecord
                                                                  .displayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  9.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 309.0,
                                                        height: 39.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF101010),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              FFIcons.krelgio,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .botao,
                                                              size: 18.0,
                                                            ),
                                                            Text(
                                                              'Aulas com 40 minutos de duração ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  9.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 309.0,
                                                        height: 39.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF101010),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              FFIcons.kzoom,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .botao,
                                                              size: 18.0,
                                                            ),
                                                            Text(
                                                              'Aulas realizadas via Aplicativo Zoom',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  25.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'Dicas para um ',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  'melhor\ndesempenho ',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .fundo2,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  'nas aulas:',
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  9.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Separe um lugar somente para a aula;\nLivre-se de distrações durante a aula;\nTem dúvidas? Pergunte!',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  39.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Container(
                                                        width: 142.0,
                                                        height: 39.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .botao,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Escolha a data',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .fundo,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 454.0,
                                                      height: 389.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF101010),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child:
                                                          FlutterFlowCalendar(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .fundo2,
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        weekFormat: false,
                                                        weekStartsMonday: false,
                                                        initialDate:
                                                            getCurrentTimestamp,
                                                        rowHeight: 64.0,
                                                        onChange: (DateTimeRange?
                                                            newSelectedDate) async {
                                                          if (_model
                                                                  .calenderMobileSelectedDay ==
                                                              newSelectedDate) {
                                                            return;
                                                          }
                                                          _model.calenderMobileSelectedDay =
                                                              newSelectedDate;
                                                          logFirebaseEvent(
                                                              'AGENDA_MOBILE_calenderMobile_ON_DATE_SEL');
                                                          if (functions.dataPassada(
                                                                  getCurrentTimestamp,
                                                                  _model
                                                                      .calenderMobileSelectedDay!
                                                                      .start) ==
                                                              true) {
                                                            logFirebaseEvent(
                                                                'calenderMobile_update_page_state');
                                                            _model.dataPassada =
                                                                false;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'calenderMobile_update_app_state');
                                                            FFAppState()
                                                                    .HoraiosStatus =
                                                                'loading';
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'calenderMobile_backend_call');
                                                            _model.outHoraiosSelectCalendar =
                                                                await BuscaHorariosDisponiveisCall
                                                                    .call(
                                                              data: _model
                                                                  .calenderMobileSelectedDay
                                                                  ?.start
                                                                  .toString(),
                                                              professorId:
                                                                  agendaMobileProfessoresRecord
                                                                      .reference
                                                                      .id,
                                                              diaSemana: _model
                                                                  .diaDaSemana,
                                                            );

                                                            if ((_model.outHoraiosSelectCalendar
                                                                        ?.statusCode ??
                                                                    200) ==
                                                                200) {
                                                              logFirebaseEvent(
                                                                  'calenderMobile_update_app_state');
                                                              FFAppState()
                                                                      .HorariosDisponiveisParaAgendar =
                                                                  BuscaHorariosDisponiveisCall
                                                                          .listHorarios(
                                                                (_model.outHoraiosSelectCalendar
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              FFAppState()
                                                                      .HoraiosStatus =
                                                                  'have';
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                            } else if ((_model
                                                                        .outHoraiosSelectCalendar
                                                                        ?.statusCode ??
                                                                    200) ==
                                                                201) {
                                                              logFirebaseEvent(
                                                                  'calenderMobile_update_app_state');
                                                              FFAppState()
                                                                  .HorariosDisponiveisParaAgendar = [];
                                                              FFAppState()
                                                                      .HoraiosStatus =
                                                                  'empty';
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                            }
                                                          } else {
                                                            logFirebaseEvent(
                                                                'calenderMobile_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Ops! Selecione uma data futura!',
                                                                  style:
                                                                      GoogleFonts
                                                                          .sora(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        16.0,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFFA60F11),
                                                              ),
                                                            );
                                                            logFirebaseEvent(
                                                                'calenderMobile_update_page_state');
                                                            _model.dataPassada =
                                                                true;
                                                            _model.horarioSelecionado =
                                                                null;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'calenderMobile_update_app_state');
                                                            FFAppState()
                                                                .botaoAgendar = 0;
                                                            FFAppState()
                                                                .horarios = [];
                                                            safeSetState(() {});
                                                            return;
                                                          }

                                                          logFirebaseEvent(
                                                              'calenderMobile_update_page_state');
                                                          _model.diaDaSemana =
                                                              functions.diadaSemana(
                                                                  _model
                                                                      .calenderMobileSelectedDay!
                                                                      .start);
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'calenderMobile_update_page_state');
                                                          _model.daraOkPage = functions
                                                              .dATAcorrigida(_model
                                                                  .calenderMobileSelectedDay!
                                                                  .start);
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'calenderMobile_update_app_state');
                                                          FFAppState()
                                                              .botaoAgendar = 0;
                                                          safeSetState(() {});
                                                          safeSetState(() {});
                                                        },
                                                        titleStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        dayOfWeekStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        dateStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        selectedDateStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        inactiveDateStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 393.0,
                                                        height: 39.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF101010),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                FFIcons
                                                                    .kplaneta,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .botao,
                                                                size: 18.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Fuso horário: Horário Padrão de Brasília (GMT-3)',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 193.0,
                                                        height: 517.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            21.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          142.0,
                                                                      height:
                                                                          39.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .botao,
                                                                        borderRadius:
                                                                            BorderRadius.circular(3.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Escolha o horário',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                color: FlutterFlowTheme.of(context).fundo,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              if (_model
                                                                  .dataPassada)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          9.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        229.0,
                                                                    height:
                                                                        39.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF101010),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              3.0),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .warning_amber,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              18.0,
                                                                        ),
                                                                        Text(
                                                                          'Selecione uma data Futura',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                color: Colors.white,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 193.0,
                                                                  height: 494.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (FFAppState().HoraiosStatus ==
                                                                            'have')
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final lisHoras = FFAppState().HorariosDisponiveisParaAgendar.toList();

                                                                              return SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: List.generate(lisHoras.length, (lisHorasIndex) {
                                                                                    final lisHorasItem = lisHoras[lisHorasIndex];
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('AGENDA_MOBILE_Container_xzk2c6lu_ON_TAP');
                                                                                                logFirebaseEvent('Container_update_page_state');
                                                                                                _model.hararioForNotify = lisHorasItem;
                                                                                                _model.horarioSelecionado = lisHorasItem;
                                                                                                safeSetState(() {});
                                                                                                logFirebaseEvent('Container_update_app_state');
                                                                                                FFAppState().botaoAgendar = 1;
                                                                                                FFAppState().diadaSemana = lisHorasItem;
                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 100.0,
                                                                                                height: 40.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0xFF101010),
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                  border: Border.all(
                                                                                                    color: _model.horarioSelecionado == lisHorasItem ? Color(0xFFFF0000) : Color(0x00000000),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    FaIcon(
                                                                                                      FontAwesomeIcons.clock,
                                                                                                      color: FlutterFlowTheme.of(context).botao,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    Text(
                                                                                                      lisHorasItem,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                            fontSize: 15.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  }),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        if ((columnFuncionamentoRecord !=
                                                                                null) &&
                                                                            (containerRemoverHorariosRecord !=
                                                                                null))
                                                                          Expanded(
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final horarios = functions.ordenarHorarios(functions.removerhorarios(containerRemoverHorariosRecord.horario.toList(), columnFuncionamentoRecord.horarios.toList())!.toList())?.toList() ?? [];

                                                                                return SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(horarios.length, (horariosIndex) {
                                                                                      final horariosItem = horarios[horariosIndex];
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                              child: StreamBuilder<List<AulasRecord>>(
                                                                                                stream: queryAulasRecord(
                                                                                                  queryBuilder: (aulasRecord) => aulasRecord
                                                                                                      .where(
                                                                                                        'data',
                                                                                                        isEqualTo: functions.montarData(horariosItem, _model.calenderMobileSelectedDay!.start),
                                                                                                      )
                                                                                                      .where(
                                                                                                        'professor',
                                                                                                        isEqualTo: widget.professor,
                                                                                                      ),
                                                                                                  singleRecord: true,
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50.0,
                                                                                                        height: 50.0,
                                                                                                        child: CircularProgressIndicator(
                                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<AulasRecord> containerAulasRecordList = snapshot.data!;
                                                                                                  final containerAulasRecord = containerAulasRecordList.isNotEmpty ? containerAulasRecordList.first : null;

                                                                                                  return InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('AGENDA_MOBILE_Container_m0n1xw6h_ON_TAP');
                                                                                                      if (containerAulasRecord != null) {
                                                                                                        logFirebaseEvent('Container_show_snack_bar');
                                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                                          SnackBar(
                                                                                                            content: Text(
                                                                                                              'Horário Ocupado',
                                                                                                              style: TextStyle(
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              ),
                                                                                                            ),
                                                                                                            duration: Duration(milliseconds: 4000),
                                                                                                            backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                                          ),
                                                                                                        );
                                                                                                      } else {
                                                                                                        logFirebaseEvent('Container_update_app_state');
                                                                                                        FFAppState().botaoAgendar = 1;
                                                                                                        FFAppState().diadaSemana = horariosItem;
                                                                                                        safeSetState(() {});
                                                                                                      }
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 100.0,
                                                                                                      height: 40.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: valueOrDefault<Color>(
                                                                                                          containerAulasRecord != null ? FlutterFlowTheme.of(context).error : Color(0xFF101010),
                                                                                                          Color(0xFF101010),
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          FaIcon(
                                                                                                            FontAwesomeIcons.clock,
                                                                                                            color: Color(0xFFDA2A0B),
                                                                                                            size: 18.0,
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              horariosItem,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    }),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        if (FFAppState().HoraiosStatus ==
                                                                            'empty')
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                  child: AutoSizeText(
                                                                                    'Sem Horários',
                                                                                    textAlign: TextAlign.center,
                                                                                    minFontSize: 16.0,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          fontSize: 20.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (FFAppState().HoraiosStatus ==
                                                                            'loading')
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.replay,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 24.0,
                                                                                  ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if ((FFAppState().botaoAgendar ==
                                                                                1) &&
                                                                            !_model.dataPassada)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                StreamBuilder<List<CredenciaisRecord>>(
                                                                              stream: queryCredenciaisRecord(
                                                                                singleRecord: true,
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<CredenciaisRecord> buttonCredenciaisRecordList = snapshot.data!;
                                                                                final buttonCredenciaisRecord = buttonCredenciaisRecordList.isNotEmpty ? buttonCredenciaisRecordList.first : null;

                                                                                return FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('AGENDA_MOBILE_PAGE_AGENDAR_BTN_ON_TAP');
                                                                                    var _shouldSetState = false;
                                                                                    logFirebaseEvent('Button_update_app_state');
                                                                                    FFAppState().professorSelecionado = null;
                                                                                    safeSetState(() {});
                                                                                    if (valueOrDefault(currentUserDocument?.saldo, 0) > 0) {
                                                                                      if (true) {
                                                                                        if (functions.h1HCopy(functions.montarData(_model.horarioSelecionado!, _model.calenderMobileSelectedDay!.start)!)) {
                                                                                          logFirebaseEvent('Button_backend_call');
                                                                                          _model.outAgendado = await AgendarHorarioCall.call(
                                                                                            data: _model.calenderMobileSelectedDay?.start.toString(),
                                                                                            professorId: agendaMobileProfessoresRecord.reference.id,
                                                                                            diaSemana: _model.diaDaSemana,
                                                                                            horario: _model.horarioSelecionado,
                                                                                            idAluno: currentUserReference?.id,
                                                                                            nomeProfessor: agendaMobileProfessoresRecord.displayName,
                                                                                            nomeAluno: currentUserDisplayName,
                                                                                            telefoneAluno: currentPhoneNumber,
                                                                                            telefoneProfressor: agendaMobileProfessoresRecord.phoneNumber,
                                                                                            page: 'paginamobileNova Mobile',
                                                                                          );

                                                                                          _shouldSetState = true;
                                                                                          if (!(_model.outAgendado?.succeeded ?? true)) {
                                                                                            logFirebaseEvent('Button_show_snack_bar');
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              SnackBar(
                                                                                                content: Text(
                                                                                                  'Ops, parece que esse horário ficou indisponível.',
                                                                                                  style: GoogleFonts.roboto(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                                duration: Duration(milliseconds: 4000),
                                                                                                backgroundColor: Color(0xFFCF2802),
                                                                                              ),
                                                                                            );
                                                                                            logFirebaseEvent('Button_backend_call');
                                                                                            _model.outHoraiosPErroAgendar = await BuscaHorariosDisponiveisCall.call(
                                                                                              data: _model.calenderMobileSelectedDay?.start.toString(),
                                                                                              professorId: agendaMobileProfessoresRecord.reference.id,
                                                                                              diaSemana: _model.diaDaSemana,
                                                                                            );

                                                                                            _shouldSetState = true;
                                                                                            if ((_model.outHoraiosPErroAgendar?.statusCode ?? 200) == 200) {
                                                                                              logFirebaseEvent('Button_update_app_state');
                                                                                              FFAppState().HorariosDisponiveisParaAgendar = BuscaHorariosDisponiveisCall.listHorarios(
                                                                                                (_model.outHoraiosPErroAgendar?.jsonBody ?? ''),
                                                                                              )!
                                                                                                  .toList()
                                                                                                  .cast<String>();
                                                                                              FFAppState().HoraiosStatus = 'have';
                                                                                              FFAppState().update(() {});
                                                                                            } else if ((_model.outHoraiosPErroAgendar?.statusCode ?? 200) == 201) {
                                                                                              logFirebaseEvent('Button_update_app_state');
                                                                                              FFAppState().HorariosDisponiveisParaAgendar = [];
                                                                                              FFAppState().HoraiosStatus = 'empty';
                                                                                              FFAppState().update(() {});
                                                                                            }

                                                                                            if (_shouldSetState) safeSetState(() {});
                                                                                            return;
                                                                                          }
                                                                                          logFirebaseEvent('Button_backend_call');
                                                                                          unawaited(
                                                                                            () async {}(),
                                                                                          );
                                                                                          logFirebaseEvent('Button_backend_call');
                                                                                          unawaited(
                                                                                            () async {
                                                                                              await NotificaesGroup.notifyAulasStatusCall.call(
                                                                                                typeNotify: 'aluno_pendente',
                                                                                                telAluno: currentPhoneNumber,
                                                                                                telProf: agendaMobileProfessoresRecord.phoneNumber,
                                                                                                dataAula: '${_model.daraOkPage?.toString()} ${_model.hararioForNotify}',
                                                                                              );
                                                                                            }(),
                                                                                          );
                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                          var logsRecordReference = LogsRecord.collection.doc();
                                                                                          await logsRecordReference.set(createLogsRecordData(
                                                                                            dateTime: getCurrentTimestamp,
                                                                                            user: currentUserReference,
                                                                                            emailUser: currentUserEmail,
                                                                                            describe: 'Aluno agendou uma aula pelo computador.',
                                                                                            where: 'Aluno-Desktop',
                                                                                            saldoAnterior: valueOrDefault(currentUserDocument?.saldo, 0),
                                                                                            saldoAgora: valueOrDefault(currentUserDocument?.saldo, 0) - 1,
                                                                                          ));
                                                                                          _model.log1 = LogsRecord.getDocumentFromData(
                                                                                              createLogsRecordData(
                                                                                                dateTime: getCurrentTimestamp,
                                                                                                user: currentUserReference,
                                                                                                emailUser: currentUserEmail,
                                                                                                describe: 'Aluno agendou uma aula pelo computador.',
                                                                                                where: 'Aluno-Desktop',
                                                                                                saldoAnterior: valueOrDefault(currentUserDocument?.saldo, 0),
                                                                                                saldoAgora: valueOrDefault(currentUserDocument?.saldo, 0) - 1,
                                                                                              ),
                                                                                              logsRecordReference);
                                                                                          _shouldSetState = true;
                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                          await currentUserReference!.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'saldo': FieldValue.increment(-(1)),
                                                                                                'Logs': FieldValue.arrayUnion([
                                                                                                  _model.log1?.reference
                                                                                                ]),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          logFirebaseEvent('Button_bottom_sheet');
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            isDismissible: false,
                                                                                            enableDrag: false,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return WebViewAware(
                                                                                                child: GestureDetector(
                                                                                                  onTap: () {
                                                                                                    FocusScope.of(context).unfocus();
                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                  },
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: ObservacaoAgendaNovaWidget(
                                                                                                      idAula: AgendarHorarioCall.id(
                                                                                                        (_model.outAgendado?.jsonBody ?? ''),
                                                                                                      ).toString(),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => safeSetState(() {}));

                                                                                          logFirebaseEvent('Button_update_app_state');
                                                                                          FFAppState().professorSelecionado = null;
                                                                                          FFAppState().botaoAgendar = 0;
                                                                                          FFAppState().diadaSemana = '';
                                                                                          FFAppState().HorariosDisponiveisParaAgendar = [];
                                                                                          FFAppState().HoraiosStatus = '';
                                                                                          if (valueOrDefault<bool>(currentUserDocument?.administradorCheck, false) == true) {
                                                                                            logFirebaseEvent('Button_show_snack_bar');
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              SnackBar(
                                                                                                content: Text(
                                                                                                  _model.calenderMobileSelectedDay!.start.toString(),
                                                                                                  style: TextStyle(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 24.0,
                                                                                                  ),
                                                                                                ),
                                                                                                duration: Duration(milliseconds: 7700),
                                                                                                backgroundColor: Colors.black,
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                        } else {
                                                                                          logFirebaseEvent('Button_alert_dialog');
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return WebViewAware(
                                                                                                child: AlertDialog(
                                                                                                  title: Text('Ops!'),
                                                                                                  content: Text('Você precisa agendar a aula com 1h de antecedência.'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        }
                                                                                      }
                                                                                    } else {
                                                                                      logFirebaseEvent('Button_alert_dialog');
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              title: Text('Saldo insuficiente!'),
                                                                                              content: Text('Você não tem créditos para agendar esta aula.'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    }

                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                  },
                                                                                  text: 'Agendar',
                                                                                  options: FFButtonOptions(
                                                                                    height: 40.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).botao,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          font: GoogleFonts.sora(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).fundo,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
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
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
