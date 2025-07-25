import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/menu_desktop_widget.dart';
import '/components/menu_mobile_widget.dart';
import '/done/observacao_agenda/observacao_agenda_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'agend_a33_model.dart';
export 'agend_a33_model.dart';

class AgendA33Widget extends StatefulWidget {
  const AgendA33Widget({
    super.key,
    required this.professor,
  });

  final DocumentReference? professor;

  static String routeName = 'AgendA33';
  static String routePath = '/agendaa2';

  @override
  State<AgendA33Widget> createState() => _AgendA33WidgetState();
}

class _AgendA33WidgetState extends State<AgendA33Widget> {
  late AgendA33Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendA33Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AgendA33'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('AGEND_A33_PAGE_AgendA33_ON_INIT_STATE');
      logFirebaseEvent('AgendA33_update_page_state');
      _model.diadasemana =
          functions.diadaSemana(_model.calendarDeskSelectedDay!.start);
      _model.daraOkPage =
          functions.dATAcorrigida(_model.calendarDeskSelectedDay!.start);
      safeSetState(() {});
      logFirebaseEvent('AgendA33_set_dark_mode_settings');
      setDarkModeSetting(context, ThemeMode.dark);
      if (valueOrDefault<bool>(currentUserDocument?.professor, false) == true) {
        logFirebaseEvent('AgendA33_navigate_to');

        context.goNamed(
          HomeWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );

        return;
      } else {
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
    context.watch<FFAppState>();

    return StreamBuilder<ProfessoresRecord>(
      stream: ProfessoresRecord.getDocument(widget.professor!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
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

        final agendA33ProfessoresRecord = snapshot.data!;

        return Title(
            title: 'Selecionar Data',
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
                  child: StreamBuilder<List<RemoverHorariosRecord>>(
                    stream: queryRemoverHorariosRecord(
                      parent: agendA33ProfessoresRecord.reference,
                      queryBuilder: (removerHorariosRecord) =>
                          removerHorariosRecord.where(
                        'data',
                        isEqualTo: _model.calendarDeskSelectedDay?.start,
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
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: StreamBuilder<List<FuncionamentoRecord>>(
                          stream: queryFuncionamentoRecord(
                            parent: agendA33ProfessoresRecord.reference,
                            queryBuilder: (funcionamentoRecord) =>
                                funcionamentoRecord.where(
                              'dia',
                              isEqualTo: _model.diadasemana,
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  if ((valueOrDefault<bool>(
                                              currentUserDocument?.professor,
                                              false) ==
                                          false) &&
                                      responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                      ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 80.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Detalhes \ndas aulas:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        color: Colors.white,
                                                        fontSize: 46.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 25.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 309.0,
                                                    height: 39.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF101010),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                          child: Image.network(
                                                            agendA33ProfessoresRecord
                                                                .photoUrl,
                                                            width: 30.0,
                                                            height: 30.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          agendA33ProfessoresRecord
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
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 9.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 309.0,
                                                    height: 39.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF101010),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                          'Aulas com 45 minutos de duração ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 9.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 309.0,
                                                    height: 39.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF101010),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 25.0, 0.0, 0.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Dicas para um ',
                                                          style: TextStyle(),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'melhor\ndesempenho ',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .botao,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: 'nas aulas:',
                                                          style: TextStyle(),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                            color: Colors.white,
                                                            fontSize: 19.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 9.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Separe um lugar somente para a aula;\nLivre-se de distrações durante a aula;\nTem dúvidas? Pergunte!',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            StreamBuilder<
                                                List<FuncionamentoRecord>>(
                                              stream: queryFuncionamentoRecord(
                                                parent: widget.professor,
                                                queryBuilder:
                                                    (funcionamentoRecord) =>
                                                        funcionamentoRecord
                                                            .where(
                                                  'dia',
                                                  isEqualTo: _model.diadasemana,
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
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<FuncionamentoRecord>
                                                    columnFuncionamentoRecordList =
                                                    snapshot.data!;
                                                final columnFuncionamentoRecord =
                                                    columnFuncionamentoRecordList
                                                            .isNotEmpty
                                                        ? columnFuncionamentoRecordList
                                                            .first
                                                        : null;

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  21.0),
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
                                                    if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.administradorCheck,
                                                        false))
                                                      Text(
                                                        valueOrDefault<String>(
                                                          _model
                                                              .calendarDeskSelectedDay
                                                              ?.start
                                                              .toString(),
                                                          'd',
                                                        ),
                                                        style:
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
                                                      ),
                                                    Container(
                                                      width: 541.0,
                                                      height: 521.0,
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
                                                                .botao,
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
                                                                  .calendarDeskSelectedDay ==
                                                              newSelectedDate) {
                                                            return;
                                                          }
                                                          _model.calendarDeskSelectedDay =
                                                              newSelectedDate;
                                                          logFirebaseEvent(
                                                              'AGEND_A33_CalendarDesk_ON_DATE_SELECTED');
                                                          logFirebaseEvent(
                                                              'CalendarDesk_update_app_state');
                                                          FFAppState()
                                                              .botaoAgendar = 0;
                                                          FFAppState()
                                                              .update(() {});
                                                          if (functions.dataPassada(
                                                                  getCurrentTimestamp,
                                                                  _model
                                                                      .calendarDeskSelectedDay!
                                                                      .start) ==
                                                              true) {
                                                            logFirebaseEvent(
                                                                'CalendarDesk_update_page_state');
                                                            _model.dataPassada =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'CalendarDesk_show_snack_bar');
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
                                                                'CalendarDesk_update_page_state');
                                                            _model.dataPassada =
                                                                true;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'CalendarDesk_update_app_state');
                                                            FFAppState()
                                                                .botaoAgendar = 0;
                                                            FFAppState()
                                                                .update(() {});
                                                            return;
                                                          }

                                                          logFirebaseEvent(
                                                              'CalendarDesk_update_page_state');
                                                          _model.diadasemana =
                                                              functions.diadaSemana(
                                                                  _model
                                                                      .calendarDeskSelectedDay!
                                                                      .start);
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'CalendarDesk_update_page_state');
                                                          _model.daraOkPage = functions
                                                              .dATAcorrigida(_model
                                                                  .calendarDeskSelectedDay!
                                                                  .start);
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
                                                );
                                              },
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  21.0),
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
                                                            'Escolha o horário',
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
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 9.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 229.0,
                                                    height: 39.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF101010),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                          Icons.warning_amber,
                                                          color:
                                                              Color(0xFFDAB10B),
                                                          size: 18.0,
                                                        ),
                                                        Text(
                                                          'Horário de Brasília - Brasil',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                                if (_model.dataPassada)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 9.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 229.0,
                                                      height: 39.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF101010),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.warning_amber,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 18.0,
                                                          ),
                                                          Text(
                                                            'Selecione uma data Futura',
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
                                                Container(
                                                  width: 193.0,
                                                  height: 517.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if ((columnFuncionamentoRecord !=
                                                                null) &&
                                                            !_model.dataPassada)
                                                          Expanded(
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final horarios = functions
                                                                        .ordenarHorarios(columnFuncionamentoRecord
                                                                            .horarios
                                                                            .toList())
                                                                        ?.toList() ??
                                                                    [];

                                                                return SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        horarios
                                                                            .length,
                                                                        (horariosIndex) {
                                                                      final horariosItem =
                                                                          horarios[
                                                                              horariosIndex];
                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                              child: StreamBuilder<List<AulasRecord>>(
                                                                                stream: queryAulasRecord(
                                                                                  queryBuilder: (aulasRecord) => aulasRecord
                                                                                      .where(
                                                                                        'data_agandado',
                                                                                        isEqualTo: _model.daraOkPage,
                                                                                      )
                                                                                      .where(
                                                                                        'professor',
                                                                                        isEqualTo: widget.professor,
                                                                                      )
                                                                                      .where(
                                                                                        'horario',
                                                                                        isEqualTo: horariosItem,
                                                                                      )
                                                                                      .where(
                                                                                        'cancelar',
                                                                                        isEqualTo: false,
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
                                                                                      logFirebaseEvent('AGEND_A33_PAGE_Container_8nndd9pv_ON_TAP');
                                                                                      if (containerAulasRecord != null) {
                                                                                        logFirebaseEvent('Container_show_snack_bar');
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Horário ocupado',
                                                                                              style: GoogleFonts.roboto(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 15.0,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: Color(0xFFDA2A0B),
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        logFirebaseEvent('Container_update_page_state');
                                                                                        _model.horariopage = horariosItem;
                                                                                        safeSetState(() {});
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
                                                                                        border: Border.all(
                                                                                          color: FFAppState().diadaSemana == horariosItem ? Color(0xFFDA2A0B) : Color(0x00000000),
                                                                                        ),
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.clock,
                                                                                            color: FlutterFlowTheme.of(context).botao,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          Text(
                                                                                            horariosItem,
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
                                                        if (((columnFuncionamentoRecord !=
                                                                    null) &&
                                                                (containerRemoverHorariosRecord !=
                                                                    null)) &&
                                                            responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                              tabletLandscape:
                                                                  false,
                                                              desktop: false,
                                                            ))
                                                          Expanded(
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final horarios = functions
                                                                        .ordenarHorarios(functions
                                                                            .removerhorarios(containerRemoverHorariosRecord.horario.toList(),
                                                                                columnFuncionamentoRecord.horarios.toList())!
                                                                            .toList())
                                                                        ?.toList() ??
                                                                    [];

                                                                return SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        horarios
                                                                            .length,
                                                                        (horariosIndex) {
                                                                      final horariosItem =
                                                                          horarios[
                                                                              horariosIndex];
                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                              child: StreamBuilder<List<AulasRecord>>(
                                                                                stream: queryAulasRecord(
                                                                                  queryBuilder: (aulasRecord) => aulasRecord
                                                                                      .where(
                                                                                        'data',
                                                                                        isEqualTo: _model.calendarDeskSelectedDay?.start,
                                                                                      )
                                                                                      .where(
                                                                                        'professor',
                                                                                        isEqualTo: widget.professor,
                                                                                      )
                                                                                      .where(
                                                                                        'horario',
                                                                                        isEqualTo: horariosItem,
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
                                                                                      logFirebaseEvent('AGEND_A33_PAGE_Container_ebedb12s_ON_TAP');
                                                                                      if (containerAulasRecord != null) {
                                                                                        logFirebaseEvent('Container_show_snack_bar');
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Horário ocupado',
                                                                                              style: GoogleFonts.roboto(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 15.0,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: Color(0xFFDA2A0B),
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
                                                        if (!(columnFuncionamentoRecord !=
                                                                null) &&
                                                            !_model.dataPassada)
                                                          Expanded(
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Sem Horários',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        fontSize:
                                                                            24.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if (FFAppState()
                                                                    .botaoAgendar ==
                                                                1)
                                                              StreamBuilder<
                                                                  List<
                                                                      CredenciaisRecord>>(
                                                                stream:
                                                                    queryCredenciaisRecord(
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<CredenciaisRecord>
                                                                      buttonCredenciaisRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  final buttonCredenciaisRecord = buttonCredenciaisRecordList
                                                                          .isNotEmpty
                                                                      ? buttonCredenciaisRecordList
                                                                          .first
                                                                      : null;

                                                                  return FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'AGEND_A33_PAGE_AGENDAR_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      FFAppState()
                                                                              .professorSelecionado =
                                                                          null;
                                                                      safeSetState(
                                                                          () {});
                                                                      if (valueOrDefault(
                                                                              currentUserDocument?.saldo,
                                                                              0) >
                                                                          0) {
                                                                        if (widget.professor ==
                                                                            widget.professor) {
                                                                          if (functions.h24H(functions.montarData(
                                                                              _model.horariopage,
                                                                              _model.calendarDeskSelectedDay!.start)!)) {
                                                                            logFirebaseEvent('Button_backend_call');

                                                                            var aulasRecordReference =
                                                                                AulasRecord.collection.doc();
                                                                            await aulasRecordReference.set(createAulasRecordData(
                                                                              aluno: currentUserReference,
                                                                              professor: widget.professor,
                                                                              data: functions.dATAcorrigidaCopy(functions.montarData(_model.horariopage, _model.calendarDeskSelectedDay!.start)!),
                                                                              cancelar: false,
                                                                              title: 'Professor - ${agendA33ProfessoresRecord.displayName}',
                                                                              nomeAluno: currentUserDisplayName,
                                                                              telefoneAluno: currentPhoneNumber,
                                                                              nomeProfessor: agendA33ProfessoresRecord.displayName,
                                                                              telProfessor: agendA33ProfessoresRecord.phoneNumber,
                                                                              verificada: false,
                                                                              horario: _model.horariopage,
                                                                              dataAgandado: functions.dATAcorrigida(_model.calendarDeskSelectedDay!.start),
                                                                              finalizada: false,
                                                                              agendadoPage: 'agenda33 desktop',
                                                                            ));
                                                                            _model.addAulaCopy = AulasRecord.getDocumentFromData(
                                                                                createAulasRecordData(
                                                                                  aluno: currentUserReference,
                                                                                  professor: widget.professor,
                                                                                  data: functions.dATAcorrigidaCopy(functions.montarData(_model.horariopage, _model.calendarDeskSelectedDay!.start)!),
                                                                                  cancelar: false,
                                                                                  title: 'Professor - ${agendA33ProfessoresRecord.displayName}',
                                                                                  nomeAluno: currentUserDisplayName,
                                                                                  telefoneAluno: currentPhoneNumber,
                                                                                  nomeProfessor: agendA33ProfessoresRecord.displayName,
                                                                                  telProfessor: agendA33ProfessoresRecord.phoneNumber,
                                                                                  verificada: false,
                                                                                  horario: _model.horariopage,
                                                                                  dataAgandado: functions.dATAcorrigida(_model.calendarDeskSelectedDay!.start),
                                                                                  finalizada: false,
                                                                                  agendadoPage: 'agenda33 desktop',
                                                                                ),
                                                                                aulasRecordReference);
                                                                            logFirebaseEvent('Button_backend_call');
                                                                            unawaited(
                                                                              () async {
                                                                                _model.agendamentoCloud = await AgendaCloudCall.call(
                                                                                  nomeAluno: _model.addAulaCopy?.nomeAluno,
                                                                                  telefoneAluno: _model.addAulaCopy?.telefoneAluno,
                                                                                  telefoneProfessor: _model.addAulaCopy?.telProfessor,
                                                                                  data: dateTimeFormat(
                                                                                    "d/M/y",
                                                                                    _model.addAulaCopy?.dataAgandado,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  hora: _model.addAulaCopy?.horario,
                                                                                  nomeProfessor: _model.addAulaCopy?.nomeProfessor,
                                                                                  idAula: _model.addAulaCopy?.reference.id,
                                                                                );
                                                                              }(),
                                                                            );
                                                                            logFirebaseEvent('Button_backend_call');
                                                                            unawaited(
                                                                              () async {
                                                                                await NotificaesGroup.notifyAulasStatusCall.call(
                                                                                  typeNotify: 'aluno_pendente',
                                                                                  telAluno: currentPhoneNumber,
                                                                                  telProf: agendA33ProfessoresRecord.phoneNumber,
                                                                                  dataAula: '${dateTimeFormat(
                                                                                    "d/M",
                                                                                    _model.addAulaCopy?.data,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )} ${_model.horariopage}',
                                                                                );
                                                                              }(),
                                                                            );
                                                                            logFirebaseEvent('Button_backend_call');

                                                                            var logsRecordReference =
                                                                                LogsRecord.collection.doc();
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
                                                                                      child: ObservacaoAgendaWidget(
                                                                                        addObservacao: _model.addAulaCopy!,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));

                                                                            logFirebaseEvent('Button_update_app_state');
                                                                            FFAppState().professorSelecionado =
                                                                                null;
                                                                            FFAppState().botaoAgendar =
                                                                                0;
                                                                            FFAppState().diadaSemana =
                                                                                '';
                                                                            if (valueOrDefault<bool>(currentUserDocument?.administradorCheck, false) ==
                                                                                true) {
                                                                              logFirebaseEvent('Button_show_snack_bar');
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    _model.calendarDeskSelectedDay!.start.toString(),
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
                                                                                    content: Text('Você precisa agendar a aula com 24h de antecedência.'),
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
                                                                        logFirebaseEvent(
                                                                            'Button_alert_dialog');
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
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

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'Agendar',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .botao,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.sora(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).fundo,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.administradorCheck,
                                                false))
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    StreamBuilder<
                                                        List<AulasRecord>>(
                                                      stream: queryAulasRecord(
                                                        queryBuilder:
                                                            (aulasRecord) =>
                                                                aulasRecord
                                                                    .where(
                                                                      'data_agandado',
                                                                      isGreaterThan: _model
                                                                          .calendarDeskSelectedDay
                                                                          ?.start,
                                                                    )
                                                                    .where(
                                                                      'professor',
                                                                      isEqualTo:
                                                                          widget
                                                                              .professor,
                                                                    ),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<AulasRecord>
                                                            listViewAulasRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final listViewAulasRecord =
                                                            listViewAulasRecordList
                                                                    .isNotEmpty
                                                                ? listViewAulasRecordList
                                                                    .first
                                                                : null;

                                                        return ListView(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewAulasRecord
                                                                    ?.dataAgandado
                                                                    ?.toString(),
                                                                'd',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewAulasRecord
                                                                    ?.dataAgandado
                                                                    ?.secondsSinceEpoch
                                                                    .toString(),
                                                                'un',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewAulasRecord
                                                                    ?.reference
                                                                    .id,
                                                                'un',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ].divide(SizedBox(width: 40.0)),
                                        ),
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    desktop: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: StreamBuilder<
                                          List<FuncionamentoRecord>>(
                                        stream: queryFuncionamentoRecord(
                                          parent: agendA33ProfessoresRecord
                                              .reference,
                                          queryBuilder: (funcionamentoRecord) =>
                                              funcionamentoRecord.where(
                                            'dia',
                                            isEqualTo: _model.diadasemana,
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
                                          List<FuncionamentoRecord>
                                              columnFuncionamentoRecordList =
                                              snapshot.data!;
                                          final columnFuncionamentoRecord =
                                              columnFuncionamentoRecordList
                                                      .isNotEmpty
                                                  ? columnFuncionamentoRecordList
                                                      .first
                                                  : null;

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 50.0,
                                                                0.0, 0.0),
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
                                                            color: Colors.white,
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 25.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 309.0,
                                                      height: 39.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF101010),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3.0),
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
                                                              agendA33ProfessoresRecord
                                                                  .photoUrl,
                                                              width: 30.0,
                                                              height: 30.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            agendA33ProfessoresRecord
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
                                                            .fromSTEB(0.0, 9.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 309.0,
                                                      height: 39.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF101010),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3.0),
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
                                                            color: Color(
                                                                0xFFDA2A0B),
                                                            size: 18.0,
                                                          ),
                                                          Text(
                                                            'Aulas com 45 minutos de duração ',
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
                                                            .fromSTEB(0.0, 9.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 309.0,
                                                      height: 39.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF101010),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3.0),
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
                                                            color: Color(
                                                                0xFFDA2A0B),
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
                                                            .fromSTEB(0.0, 25.0,
                                                                0.0, 0.0),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Dicas para um ',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'melhor\ndesempenho ',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFFDA2A0B),
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: 'nas aulas:',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              color:
                                                                  Colors.white,
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
                                                            .fromSTEB(0.0, 9.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Separe um lugar somente para a aula;\nLivre-se de distrações durante a aula;\nTem dúvidas? Pergunte!',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                            color: Colors.white,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 39.0,
                                                                0.0, 10.0),
                                                    child: Container(
                                                      width: 142.0,
                                                      height: 39.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFDA2A0B),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3.0),
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
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
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
                                                      color: Color(0xFF101010),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: FlutterFlowCalendar(
                                                      color: Color(0xFFDA2A0B),
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
                                                            'AGEND_A33_calenderMobile_ON_DATE_SELECTE');
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
                                                        } else {
                                                          logFirebaseEvent(
                                                              'calenderMobile_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
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
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'calenderMobile_update_app_state');
                                                          FFAppState()
                                                              .botaoAgendar = 0;
                                                          safeSetState(() {});
                                                          return;
                                                        }

                                                        logFirebaseEvent(
                                                            'calenderMobile_update_page_state');
                                                        _model.diadasemana = functions
                                                            .diadaSemana(_model
                                                                .calenderMobileSelectedDay!
                                                                .start);
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
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 393.0,
                                                      height: 39.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF101010),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3.0),
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
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              FFIcons.kplaneta,
                                                              color: Color(
                                                                  0xFFDA2A0B),
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
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 193.0,
                                                      height: 517.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
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
                                                              MainAxisSize.max,
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
                                                                      color: Color(
                                                                          0xFFDA2A0B),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              3.0),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Escolha o horário',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: FlutterFlowTheme.of(context).bodyMedium,
                                                                              color: Colors.white,
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            9.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 229.0,
                                                                  height: 39.0,
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
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .warning_amber,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
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
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            Container(
                                                              width: 193.0,
                                                              height: 317.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            12.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if ((columnFuncionamentoRecord != null) &&
                                                                        !(containerRemoverHorariosRecord !=
                                                                            null) &&
                                                                        !_model
                                                                            .dataPassada)
                                                                      Expanded(
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final horarios =
                                                                                functions.ordenarHorarios(columnFuncionamentoRecord.horarios.toList())?.toList() ?? [];

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
                                                                                                    'data_agandado',
                                                                                                    isEqualTo: _model.calenderMobileSelectedDay?.start,
                                                                                                  )
                                                                                                  .where(
                                                                                                    'professor',
                                                                                                    isEqualTo: widget.professor,
                                                                                                  )
                                                                                                  .where(
                                                                                                    'horario',
                                                                                                    isEqualTo: horariosItem,
                                                                                                  )
                                                                                                  .where(
                                                                                                    'cancelar',
                                                                                                    isEqualTo: false,
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
                                                                                                  logFirebaseEvent('AGEND_A33_PAGE_Container_kdvjl769_ON_TAP');
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
                                                                                                    border: Border.all(
                                                                                                      color: FFAppState().diadaSemana == horariosItem ? Color(0xFFFF0000) : Color(0x00000000),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      FaIcon(
                                                                                                        FontAwesomeIcons.clock,
                                                                                                        color: Color(0xFFDA2A0B),
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        horariosItem,
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
                                                                    if ((columnFuncionamentoRecord !=
                                                                            null) &&
                                                                        (containerRemoverHorariosRecord !=
                                                                            null))
                                                                      Expanded(
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final horarios =
                                                                                functions.ordenarHorarios(functions.removerhorarios(containerRemoverHorariosRecord.horario.toList(), columnFuncionamentoRecord.horarios.toList())!.toList())?.toList() ?? [];

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
                                                                                                    isEqualTo: functions.montarData(horariosItem, _model.calendarDeskSelectedDay!.start),
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
                                                                                                  logFirebaseEvent('AGEND_A33_PAGE_Container_7fibs8dz_ON_TAP');
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
                                                                                                    logFirebaseEvent('Container_alert_dialog');
                                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                                          context: context,
                                                                                                          builder: (alertDialogContext) {
                                                                                                            return WebViewAware(
                                                                                                              child: AlertDialog(
                                                                                                                title: Text('Reservar este Horário?'),
                                                                                                                content: Text('Tem Certeza que deseja Reservar o horário das ${horariosItem} Com o Professor ${agendA33ProfessoresRecord.displayName}'),
                                                                                                                actions: [
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                    child: Text('Cancelar'),
                                                                                                                  ),
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                    child: Text('Sim, reservar'),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ) ??
                                                                                                        false;
                                                                                                    if (confirmDialogResponse) {
                                                                                                      logFirebaseEvent('Container_backend_call');

                                                                                                      await AulasRecord.collection.doc().set(createAulasRecordData(
                                                                                                            data: functions.montarData(horariosItem, _model.calendarDeskSelectedDay!.start),
                                                                                                            professor: widget.professor,
                                                                                                          ));
                                                                                                      logFirebaseEvent('Container_backend_call');

                                                                                                      await currentUserReference!.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'saldo': FieldValue.increment(-(1)),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                      logFirebaseEvent('Container_navigate_to');

                                                                                                      context.goNamed(AgendamentosWidget.routeName);
                                                                                                    }
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
                                                                    if (!(columnFuncionamentoRecord !=
                                                                        null))
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'FECHADO',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    fontSize: 24.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (((FFAppState().diadaSemana != '') &&
                                                                            !_model
                                                                                .dataPassada) &&
                                                                        responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                          tabletLandscape:
                                                                              false,
                                                                          desktop:
                                                                              false,
                                                                        ))
                                                                      StreamBuilder<
                                                                          List<
                                                                              CredenciaisRecord>>(
                                                                        stream:
                                                                            queryCredenciaisRecord(
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<CredenciaisRecord>
                                                                              buttonCredenciaisRecordList =
                                                                              snapshot.data!;
                                                                          final buttonCredenciaisRecord = buttonCredenciaisRecordList.isNotEmpty
                                                                              ? buttonCredenciaisRecordList.first
                                                                              : null;

                                                                          return FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('AGEND_A33_PAGE_AGENDAR_BTN_ON_TAP');
                                                                              logFirebaseEvent('Button_update_app_state');
                                                                              FFAppState().professorSelecionado = null;
                                                                              safeSetState(() {});
                                                                              if (valueOrDefault(currentUserDocument?.saldo, 0) > 0) {
                                                                                if (widget.professor == widget.professor) {}
                                                                                logFirebaseEvent('Button_backend_call');

                                                                                var aulasRecordReference = AulasRecord.collection.doc();
                                                                                await aulasRecordReference.set(createAulasRecordData(
                                                                                  aluno: currentUserReference,
                                                                                  professor: widget.professor,
                                                                                  data: functions.montarData(FFAppState().diadaSemana, _model.calendarDeskSelectedDay!.start),
                                                                                  cancelar: false,
                                                                                  title: 'Professor - ${agendA33ProfessoresRecord.displayName}',
                                                                                  nomeAluno: currentUserDisplayName,
                                                                                  telefoneAluno: currentPhoneNumber,
                                                                                  nomeProfessor: agendA33ProfessoresRecord.displayName,
                                                                                  telProfessor: agendA33ProfessoresRecord.phoneNumber,
                                                                                  verificada: false,
                                                                                  finalizada: false,
                                                                                ));
                                                                                _model.addAulaCopy2 = AulasRecord.getDocumentFromData(
                                                                                    createAulasRecordData(
                                                                                      aluno: currentUserReference,
                                                                                      professor: widget.professor,
                                                                                      data: functions.montarData(FFAppState().diadaSemana, _model.calendarDeskSelectedDay!.start),
                                                                                      cancelar: false,
                                                                                      title: 'Professor - ${agendA33ProfessoresRecord.displayName}',
                                                                                      nomeAluno: currentUserDisplayName,
                                                                                      telefoneAluno: currentPhoneNumber,
                                                                                      nomeProfessor: agendA33ProfessoresRecord.displayName,
                                                                                      telProfessor: agendA33ProfessoresRecord.phoneNumber,
                                                                                      verificada: false,
                                                                                      finalizada: false,
                                                                                    ),
                                                                                    aulasRecordReference);
                                                                                logFirebaseEvent('Button_backend_call');
                                                                                unawaited(
                                                                                  () async {
                                                                                    _model.agendamentoCloud2 = await AgendaCloudCall.call(
                                                                                      nomeAluno: _model.addAulaCopy2?.nomeAluno,
                                                                                      telefoneAluno: _model.addAulaCopy2?.telefoneAluno,
                                                                                      telefoneProfessor: _model.addAulaCopy2?.telProfessor,
                                                                                      data: dateTimeFormat(
                                                                                        "d/M/y",
                                                                                        _model.addAulaCopy2?.dataAgandado,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      hora: _model.addAulaCopy2?.horario,
                                                                                      nomeProfessor: _model.addAulaCopy2?.nomeProfessor,
                                                                                      idAula: _model.addAulaCopy2?.reference.id,
                                                                                    );
                                                                                  }(),
                                                                                );
                                                                                logFirebaseEvent('Button_backend_call');
                                                                                await NotificaesGroup.notifyAulasStatusCall.call(
                                                                                  typeNotify: 'aluno_pendente',
                                                                                  telAluno: currentPhoneNumber,
                                                                                  telProf: agendA33ProfessoresRecord.phoneNumber,
                                                                                  dataAula: dateTimeFormat(
                                                                                    "d/M H:mm",
                                                                                    _model.addAulaCopy2?.data,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                );

                                                                                logFirebaseEvent('Button_update_app_state');
                                                                                FFAppState().professorSelecionado = null;
                                                                                FFAppState().botaoAgendar = 0;
                                                                                FFAppState().diadaSemana = '';
                                                                                logFirebaseEvent('Button_backend_call');

                                                                                await currentUserReference!.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'saldo': FieldValue.increment(-(1)),
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
                                                                                          child: ObservacaoAgendaWidget(
                                                                                            addObservacao: _model.addAulaCopy2!,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              } else {
                                                                                logFirebaseEvent('Button_alert_dialog');
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        title: Text('Saldo insuficiente!'),
                                                                                        content: Text('Você não tem créditos para agendar esta reunião'),
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

                                                                              safeSetState(() {});
                                                                            },
                                                                            text:
                                                                                'Agendar',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: Color(0xFFDA2A0B),
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    font: GoogleFonts.sora(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
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
                                                                  ],
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
                                          );
                                        },
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
