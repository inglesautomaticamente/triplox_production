import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'remover_horarios_model.dart';
export 'remover_horarios_model.dart';

class RemoverHorariosWidget extends StatefulWidget {
  const RemoverHorariosWidget({super.key});

  static String routeName = 'removerHorarios';
  static String routePath = '/removerHorarios';

  @override
  State<RemoverHorariosWidget> createState() => _RemoverHorariosWidgetState();
}

class _RemoverHorariosWidgetState extends State<RemoverHorariosWidget> {
  late RemoverHorariosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RemoverHorariosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'removerHorarios'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('REMOVER_HORARIOS_removerHorarios_ON_INIT');
      logFirebaseEvent('removerHorarios_update_page_state');
      _model.diadasemana = functions.diadaSemana(getCurrentTimestamp);
      safeSetState(() {});
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
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<ProfessoresRecord>(
        stream:
            ProfessoresRecord.getDocument(currentUserDocument!.professores!),
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

          final removerHorariosProfessoresRecord = snapshot.data!;

          return Title(
              title: 'removerHorarios',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  body: SafeArea(
                    top: true,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<FuncionamentoRecord>>(
                        stream: queryFuncionamentoRecord(
                          parent: currentUserDocument?.professores,
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
                                width: 40.0,
                                height: 40.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFEF393C),
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

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 25.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'REMOVER_HORARIOS_Icon_e2jz6bgl_ON_TAP');
                                          logFirebaseEvent(
                                              'Icon_navigate_back');
                                          context.pop();
                                          logFirebaseEvent(
                                              'Icon_update_app_state');
                                          FFAppState().voltar =
                                              FFAppState().voltar + -1;
                                          safeSetState(() {});
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.arrowLeft,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 40.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Clique no (X) para remover o horario que não deseja trabalhar',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                              fontSize: 20.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (columnFuncionamentoRecord !=
                                                  null)
                                                Expanded(
                                                  child: Builder(
                                                    builder: (context) {
                                                      final horarios = functions
                                                              .ordenarHorarios(
                                                                  columnFuncionamentoRecord
                                                                      .horarios
                                                                      .toList())
                                                              ?.toList() ??
                                                          [];

                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              horarios.length,
                                                              (horariosIndex) {
                                                            final horariosItem =
                                                                horarios[
                                                                    horariosIndex];
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            AulasRecord>>(
                                                                      stream:
                                                                          queryAulasRecord(
                                                                        queryBuilder: (aulasRecord) => aulasRecord
                                                                            .where(
                                                                              'data_agandado',
                                                                              isEqualTo: _model.calendarSelectedDay?.start,
                                                                            )
                                                                            .where(
                                                                              'professor',
                                                                              isEqualTo: currentUserDocument?.professores,
                                                                            )
                                                                            .where(
                                                                              'horario',
                                                                              isEqualTo: horariosItem,
                                                                            )
                                                                            .where(
                                                                              'cancelar',
                                                                              isEqualTo: false,
                                                                            ),
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
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<AulasRecord>
                                                                            containerAulasRecordList =
                                                                            snapshot.data!;
                                                                        final containerAulasRecord = containerAulasRecordList.isNotEmpty
                                                                            ? containerAulasRecordList.first
                                                                            : null;

                                                                        return Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              containerAulasRecord != null ? Color(0xFF6A1212) : FlutterFlowTheme.of(context).secondaryBackground,
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(24.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                36.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 10.0,
                                                                                    height: 100.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(24.0),
                                                                                        bottomRight: Radius.circular(0.0),
                                                                                        topLeft: Radius.circular(24.0),
                                                                                        topRight: Radius.circular(0.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    horariosItem,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          fontSize: 20.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                if ((containerAulasRecord != null) == false)
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 20.0,
                                                                                    buttonSize: 40.0,
                                                                                    fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                    hoverColor: FlutterFlowTheme.of(context).tertiary,
                                                                                    hoverIconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    icon: Icon(
                                                                                      Icons.close_rounded,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('REMOVER_HORARIOS_BT_PARA_REMOVER_ON_TAP');
                                                                                      logFirebaseEvent('BT_PARA_REMOVER_backend_call');

                                                                                      var aulasRecordReference = AulasRecord.collection.doc();
                                                                                      await aulasRecordReference.set(createAulasRecordData(
                                                                                        title: 'Esse horário foi Removido',
                                                                                        verificada: true,
                                                                                        horario: horariosItem,
                                                                                        dataAgandado: _model.calendarSelectedDay?.start,
                                                                                        removerhorarioaula: true,
                                                                                        finalizada: false,
                                                                                        professor: currentUserDocument?.professores,
                                                                                        cancelar: false,
                                                                                      ));
                                                                                      _model.addAulaCopy = AulasRecord.getDocumentFromData(
                                                                                          createAulasRecordData(
                                                                                            title: 'Esse horário foi Removido',
                                                                                            verificada: true,
                                                                                            horario: horariosItem,
                                                                                            dataAgandado: _model.calendarSelectedDay?.start,
                                                                                            removerhorarioaula: true,
                                                                                            finalizada: false,
                                                                                            professor: currentUserDocument?.professores,
                                                                                            cancelar: false,
                                                                                          ),
                                                                                          aulasRecordReference);
                                                                                      logFirebaseEvent('BT_PARA_REMOVER_show_snack_bar');
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Horario Removido',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 16.0,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                        ),
                                                                                      );

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                  ),
                                                                                if (((containerAulasRecord != null) == true) && containerAulasRecord!.removerhorarioaula)
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('REMOVER_HORARIOS_LIBERAR_HORRIO_BTN_ON_T');
                                                                                      logFirebaseEvent('Button_backend_call');
                                                                                      await containerAulasRecord.reference.delete();
                                                                                    },
                                                                                    text: 'Liberar Horário',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: Color(0x4B00CC20),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            font: FlutterFlowTheme.of(context).titleSmall,
                                                                                            color: Colors.white,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      elevation: 3.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                if ((containerAulasRecord != null) && (containerAulasRecord.removerhorarioaula == false))
                                                                                  Text(
                                                                                    'Contêm Aula Agendada',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                Text(
                                                                                  (containerAulasRecord != null).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        letterSpacing: 0.0,
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
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'FECHADO',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(24.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(24.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 3.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 360.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child:
                                                              FlutterFlowCalendar(
                                                            color: Color(
                                                                0xFFDA2A0B),
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                            weekFormat: false,
                                                            weekStartsMonday:
                                                                false,
                                                            initialDate:
                                                                getCurrentTimestamp,
                                                            rowHeight: 50.0,
                                                            onChange:
                                                                (DateTimeRange?
                                                                    newSelectedDate) async {
                                                              if (_model
                                                                      .calendarSelectedDay ==
                                                                  newSelectedDate) {
                                                                return;
                                                              }
                                                              _model.calendarSelectedDay =
                                                                  newSelectedDate;
                                                              logFirebaseEvent(
                                                                  'REMOVER_HORARIOS_Calendar_lc2slrjv_ON_DA');
                                                              logFirebaseEvent(
                                                                  'Calendar_update_page_state');
                                                              _model.diadasemana =
                                                                  functions.diadaSemana(_model
                                                                      .calendarSelectedDay!
                                                                      .start);
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            titleStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      font: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall,
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                            dayOfWeekStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      font: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            dateStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                            selectedDateStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall,
                                                                      fontSize:
                                                                          18.0,
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
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                        ),
                                                      ),
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 24.0),
                                        child: Text(
                                          'Utilize um computador ou Tablet para acessar essa configuração.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'REMOVER_HORARIOS_PAGE_VOLTAR_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_navigate_back');
                                        context.safePop();
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().voltar =
                                            FFAppState().voltar + -1;
                                        safeSetState(() {});
                                      },
                                      text: 'Voltar',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFDA2A0B),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .titleSmall,
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
