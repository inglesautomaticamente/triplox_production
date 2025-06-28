import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drops_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'completar_cadastro_model.dart';
export 'completar_cadastro_model.dart';

class CompletarCadastroWidget extends StatefulWidget {
  const CompletarCadastroWidget({
    super.key,
    required this.professor,
  });

  final DocumentReference? professor;

  static String routeName = 'Completar_Cadastro';
  static String routePath = '/completarCadastro';

  @override
  State<CompletarCadastroWidget> createState() =>
      _CompletarCadastroWidgetState();
}

class _CompletarCadastroWidgetState extends State<CompletarCadastroWidget> {
  late CompletarCadastroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompletarCadastroModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Completar_Cadastro'});
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
        title: 'Completar_Cadastro',
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
              child: Wrap(
                spacing: 0.0,
                runSpacing: 0.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: 1000.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 32.0, 0.0, 24.0),
                                                child: Text(
                                                  'Selecione os dias e horários de Funcionamento',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final listaDias = functions
                                                        .criarListadeDias()
                                                        ?.toList() ??
                                                    [];

                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: List.generate(
                                                        listaDias.length,
                                                        (listaDiasIndex) {
                                                      final listaDiasItem =
                                                          listaDias[
                                                              listaDiasIndex];
                                                      return StreamBuilder<
                                                          List<
                                                              FuncionamentoRecord>>(
                                                        stream:
                                                            queryFuncionamentoRecord(
                                                          parent:
                                                              widget.professor,
                                                          queryBuilder:
                                                              (funcionamentoRecord) =>
                                                                  funcionamentoRecord
                                                                      .where(
                                                            'dia',
                                                            isEqualTo:
                                                                listaDiasItem,
                                                          ),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                              rowFuncionamentoRecordList =
                                                              snapshot.data!;
                                                          final rowFuncionamentoRecord =
                                                              rowFuncionamentoRecordList
                                                                      .isNotEmpty
                                                                  ? rowFuncionamentoRecordList
                                                                      .first
                                                                  : null;

                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 200.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Theme(
                                                                      data:
                                                                          ThemeData(
                                                                        checkboxTheme:
                                                                            CheckboxThemeData(
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        unselectedWidgetColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                      child:
                                                                          Checkbox(
                                                                        value: _model.checkboxValueMap[listaDiasItem] ??=
                                                                            rowFuncionamentoRecord !=
                                                                                null,
                                                                        onChanged:
                                                                            (newValue) async {
                                                                          safeSetState(() =>
                                                                              _model.checkboxValueMap[listaDiasItem] = newValue!);
                                                                          if (newValue!) {
                                                                            logFirebaseEvent('COMPLETAR_CADASTRO_Checkbox_hj9kj221_ON_');
                                                                            logFirebaseEvent('Checkbox_backend_call');

                                                                            var funcionamentoRecordReference =
                                                                                FuncionamentoRecord.createDoc(widget.professor!);
                                                                            await funcionamentoRecordReference.set({
                                                                              ...createFuncionamentoRecordData(
                                                                                dia: listaDiasItem,
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'horarios': [
                                                                                    '00:00-00:00'
                                                                                  ],
                                                                                },
                                                                              ),
                                                                            });
                                                                            _model.criado =
                                                                                FuncionamentoRecord.getDocumentFromData({
                                                                              ...createFuncionamentoRecordData(
                                                                                dia: listaDiasItem,
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'horarios': [
                                                                                    '00:00-00:00'
                                                                                  ],
                                                                                },
                                                                              ),
                                                                            }, funcionamentoRecordReference);

                                                                            safeSetState(() {});
                                                                          } else {
                                                                            logFirebaseEvent('COMPLETAR_CADASTRO_Checkbox_hj9kj221_ON_');
                                                                            logFirebaseEvent('Checkbox_backend_call');
                                                                            await rowFuncionamentoRecord!.reference.delete();
                                                                          }
                                                                        },
                                                                        side:
                                                                            BorderSide(
                                                                          width:
                                                                              2,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        checkColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      listaDiasItem,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final horasdisponiveis =
                                                                        rowFuncionamentoRecord?.horarios.toList() ??
                                                                            [];

                                                                    return SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            horasdisponiveis.length,
                                                                            (horasdisponiveisIndex) {
                                                                          final horasdisponiveisItem =
                                                                              horasdisponiveis[horasdisponiveisIndex];
                                                                          return Container(
                                                                            width:
                                                                                450.0,
                                                                            height:
                                                                                60.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                DropsWidget(
                                                                              key: Key('Keyx5x_${horasdisponiveisIndex}_of_${horasdisponiveis.length}'),
                                                                              index: horasdisponiveisIndex,
                                                                              docRef: rowFuncionamentoRecord!.reference,
                                                                            ),
                                                                          );
                                                                        }),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              if (rowFuncionamentoRecord !=
                                                                  null)
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30.0,
                                                                              buttonSize: 49.0,
                                                                              icon: Icon(
                                                                                Icons.add_rounded,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('COMPLETAR_CADASTRO_add_rounded_ICN_ON_TA');
                                                                                logFirebaseEvent('IconButton_backend_call');

                                                                                await rowFuncionamentoRecord.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'horarios': FieldValue.arrayUnion([
                                                                                        '00:00-00:00'
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(24.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Container(
                                                  width: 180.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'COMPLETAR_CADASTRO_Row_wy2lxy6r_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_backend_call');
                                                      unawaited(
                                                        () async {
                                                          await currentUserReference!
                                                              .update(
                                                                  createUsersRecordData(
                                                            profCompletouCadastro:
                                                                true,
                                                          ));
                                                        }(),
                                                      );
                                                      logFirebaseEvent(
                                                          'Row_navigate_to');

                                                      context.goNamed(
                                                        HomeWidget.routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );

                                                      logFirebaseEvent(
                                                          'Row_update_app_state');
                                                      FFAppState().voltar = 0;
                                                      safeSetState(() {});
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Concluído',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 32.0, 0.0, 24.0),
                                          child: Text(
                                            'Utilize um computador ou Tablet para acessar essa configuração.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  font: FlutterFlowTheme.of(
                                                          context)
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
                                              'COMPLETAR_CADASTRO_VOLTAR_BTN_ON_TAP');
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .botao,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .fundo,
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
