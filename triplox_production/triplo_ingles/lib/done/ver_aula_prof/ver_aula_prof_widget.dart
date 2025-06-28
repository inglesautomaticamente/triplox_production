import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/done/link_para_aluno/link_para_aluno_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'ver_aula_prof_model.dart';
export 'ver_aula_prof_model.dart';

class VerAulaProfWidget extends StatefulWidget {
  const VerAulaProfWidget({
    super.key,
    required this.aula,
  });

  final AulasRecord? aula;

  @override
  State<VerAulaProfWidget> createState() => _VerAulaProfWidgetState();
}

class _VerAulaProfWidgetState extends State<VerAulaProfWidget> {
  late VerAulaProfModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerAulaProfModel());

    _model.textController ??=
        TextEditingController(text: widget.aula?.observacao);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 8.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent4,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 700.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Aula',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            font: FlutterFlowTheme.of(context)
                                                .headlineLarge,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.aula?.nomeAluno,
                                              '_',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  font: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            '${valueOrDefault<String>(
                                              dateTimeFormat(
                                                "d/M",
                                                widget.aula?.data,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              '-',
                                            )} ${valueOrDefault<String>(
                                              widget.aula?.horario,
                                              '-',
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  font: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 44.0,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'VER_AULA_PROF_close_rounded_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_bottom_sheet');
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Color(0xFF707683),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          logFirebaseEvent(
                                              'VER_AULA_PROF_TextField_tgt41hly_ON_TEXT');
                                          logFirebaseEvent(
                                              'TextField_backend_call');

                                          await widget.aula!.reference
                                              .update(createAulasRecordData(
                                            observacao:
                                                _model.textController.text,
                                          ));
                                        },
                                      ),
                                      autofocus: false,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'Qual texto você está?',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      textAlign: TextAlign.start,
                                      maxLines: null,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'VER_AULA_PROF_NOTIFICAR_ALUNO_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: LinkParaAlunoWidget(
                                                    aula: widget.aula!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        text: 'Notificar Aluno',
                                        options: FFButtonOptions(
                                          padding: EdgeInsets.all(24.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF03318E),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 1.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'VER_AULA_PROF_COMP_FECHAR_BTN_ON_TAP');
                                        logFirebaseEvent('Button_bottom_sheet');
                                        Navigator.pop(context);
                                      },
                                      text: 'Fechar',
                                      options: FFButtonOptions(
                                        padding: EdgeInsets.all(24.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFC33D3D),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .titleSmall,
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 1.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'VER_AULA_PROF_CANCELAR_AULA_BTN_ON_TAP');
                                          if (getCurrentTimestamp <=
                                              functions.subtrairHoras(
                                                  widget.aula!.data!)) {
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            _model.apiResultihqCopy =
                                                await NotificaesGroup
                                                    .notifyAulasStatusCall
                                                    .call(
                                              typeNotify: 'aula_cancelada',
                                              telAluno:
                                                  widget.aula?.telefoneAluno,
                                              telProf:
                                                  widget.aula?.telProfessor,
                                              dataAula: '${dateTimeFormat(
                                                "d/M",
                                                widget.aula?.data,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} ${widget.aula?.horario}',
                                            );

                                            if ((_model.apiResultihqCopy
                                                    ?.succeeded ??
                                                true)) {}
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await widget.aula!.reference
                                                .update(createAulasRecordData(
                                              cancelar: true,
                                              canceladoEm: getCurrentTimestamp,
                                            ));
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            unawaited(
                                              () async {
                                                await DeletaAgendamentoCall
                                                    .call(
                                                  idAula: widget
                                                      .aula?.reference.id,
                                                );
                                              }(),
                                            );
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            _model.alunoData = await UsersRecord
                                                .getDocumentOnce(
                                                    widget.aula!.aluno!);
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            var logsRecordReference1 =
                                                LogsRecord.collection.doc();
                                            await logsRecordReference1
                                                .set(createLogsRecordData(
                                              dateTime: getCurrentTimestamp,
                                              user: _model.alunoData?.reference,
                                              emailUser:
                                                  _model.alunoData?.email,
                                              describe:
                                                  'Professor-Cancelou a aula antes do horario limite',
                                              where: 'Professor-Cancela',
                                              saldoAnterior:
                                                  _model.alunoData?.saldo,
                                              saldoAgora:
                                                  _model.alunoData!.saldo + 1,
                                              professorId: currentUserDocument
                                                  ?.professores,
                                              aulaRef: widget.aula?.reference,
                                            ));
                                            _model.log1 =
                                                LogsRecord.getDocumentFromData(
                                                    createLogsRecordData(
                                                      dateTime:
                                                          getCurrentTimestamp,
                                                      user: _model
                                                          .alunoData?.reference,
                                                      emailUser: _model
                                                          .alunoData?.email,
                                                      describe:
                                                          'Professor-Cancelou a aula antes do horario limite',
                                                      where:
                                                          'Professor-Cancela',
                                                      saldoAnterior: _model
                                                          .alunoData?.saldo,
                                                      saldoAgora: _model
                                                              .alunoData!
                                                              .saldo +
                                                          1,
                                                      professorId:
                                                          currentUserDocument
                                                              ?.professores,
                                                      aulaRef: widget
                                                          .aula?.reference,
                                                    ),
                                                    logsRecordReference1);
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await widget.aula!.aluno!.update({
                                              ...mapToFirestore(
                                                {
                                                  'saldo':
                                                      FieldValue.increment(1),
                                                  'Logs': FieldValue.arrayUnion(
                                                      [_model.log1?.reference]),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'Button_bottom_sheet');
                                            Navigator.pop(context);
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Agendamento cancelado',
                                                  style: GoogleFonts.roboto(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0xFFDA2A0B),
                                              ),
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            _model.apiResultihqeCopy =
                                                await NotificaesGroup
                                                    .notifyAulasStatusCall
                                                    .call(
                                              typeNotify: 'aula_cancelada',
                                              telAluno:
                                                  widget.aula?.telefoneAluno,
                                              telProf:
                                                  widget.aula?.telProfessor,
                                              dataAula: '${dateTimeFormat(
                                                "d/M",
                                                widget.aula?.data,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} ${widget.aula?.horario}',
                                            );

                                            if ((_model.apiResultihqeCopy
                                                    ?.succeeded ??
                                                true)) {}
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await widget.aula!.reference
                                                .update(createAulasRecordData(
                                              cancelar: true,
                                              canceladoEm: getCurrentTimestamp,
                                            ));
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            unawaited(
                                              () async {
                                                await DeletaAgendamentoCall
                                                    .call(
                                                  idAula: widget
                                                      .aula?.reference.id,
                                                );
                                              }(),
                                            );
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            _model.alunoData2 =
                                                await UsersRecord
                                                    .getDocumentOnce(
                                                        widget.aula!.aluno!);
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            var logsRecordReference2 =
                                                LogsRecord.collection.doc();
                                            await logsRecordReference2
                                                .set(createLogsRecordData(
                                              dateTime: getCurrentTimestamp,
                                              user:
                                                  _model.alunoData2?.reference,
                                              emailUser:
                                                  _model.alunoData2?.email,
                                              describe:
                                                  'Professor-Cancelou a aula depois do horario limite',
                                              where: 'Professor-Cancela',
                                              saldoAnterior:
                                                  _model.alunoData2?.saldo,
                                              saldoAgora:
                                                  _model.alunoData2!.saldo + 1,
                                              professorId: currentUserDocument
                                                  ?.professores,
                                              aulaRef: widget.aula?.reference,
                                            ));
                                            _model.log2 =
                                                LogsRecord.getDocumentFromData(
                                                    createLogsRecordData(
                                                      dateTime:
                                                          getCurrentTimestamp,
                                                      user: _model.alunoData2
                                                          ?.reference,
                                                      emailUser: _model
                                                          .alunoData2?.email,
                                                      describe:
                                                          'Professor-Cancelou a aula depois do horario limite',
                                                      where:
                                                          'Professor-Cancela',
                                                      saldoAnterior: _model
                                                          .alunoData2?.saldo,
                                                      saldoAgora: _model
                                                              .alunoData2!
                                                              .saldo +
                                                          1,
                                                      professorId:
                                                          currentUserDocument
                                                              ?.professores,
                                                      aulaRef: widget
                                                          .aula?.reference,
                                                    ),
                                                    logsRecordReference2);
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await widget.aula!.aluno!.update({
                                              ...mapToFirestore(
                                                {
                                                  'saldo':
                                                      FieldValue.increment(1),
                                                  'Logs': FieldValue.arrayUnion(
                                                      [_model.log2?.reference]),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'Button_bottom_sheet');
                                            Navigator.pop(context);
                                          }

                                          safeSetState(() {});
                                        },
                                        text: 'Cancelar Aula',
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 24.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelLarge
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Color(0xFF880000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'VER_AULA_PROF_CONCLUIR_AULA_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await widget.aula!.reference
                                                .update(createAulasRecordData(
                                              finalizada: true,
                                            ));
                                            logFirebaseEvent(
                                                'Button_bottom_sheet');
                                            Navigator.pop(context);
                                          },
                                          text: 'Concluir Aula',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 24.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      font: FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
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
    );
  }
}
