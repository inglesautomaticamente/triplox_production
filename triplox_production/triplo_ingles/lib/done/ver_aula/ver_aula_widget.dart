import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
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
import 'ver_aula_model.dart';
export 'ver_aula_model.dart';

class VerAulaWidget extends StatefulWidget {
  const VerAulaWidget({
    super.key,
    required this.aula,
  });

  final AulasRecord? aula;

  @override
  State<VerAulaWidget> createState() => _VerAulaWidgetState();
}

class _VerAulaWidgetState extends State<VerAulaWidget> {
  late VerAulaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerAulaModel());

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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        '${valueOrDefault<String>(
                                          dateTimeFormat(
                                            "d/M",
                                            widget.aula?.data,
                                            locale: FFLocalizations.of(context)
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
                                              font: FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
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
                                        'VER_AULA_COMP_close_rounded_ICN_ON_TAP');
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
                                              'VER_AULA_TextField_jakdue7e_ON_TEXTFIELD');
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
                              if (!widget.aula!.finalizada)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'VER_AULA_COMP_CANCELAR_AULA_BTN_ON_TAP');
                                      if (getCurrentTimestamp <=
                                          functions.subtrairHoras(
                                              widget.aula!.data!)) {
                                        logFirebaseEvent('Button_backend_call');
                                        unawaited(
                                          () async {
                                            _model.apiResultihq =
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
                                          }(),
                                        );
                                        logFirebaseEvent('Button_backend_call');
                                        unawaited(
                                          () async {
                                            await DeletaAgendamentoCall.call(
                                              idAula:
                                                  widget.aula?.reference.id,
                                            );
                                          }(),
                                        );
                                        logFirebaseEvent('Button_backend_call');

                                        await widget.aula!.reference
                                            .update(createAulasRecordData(
                                          cancelar: true,
                                          canceladoEm: getCurrentTimestamp,
                                        ));
                                        logFirebaseEvent('Button_backend_call');

                                        var logsRecordReference1 =
                                            LogsRecord.collection.doc();
                                        await logsRecordReference1
                                            .set(createLogsRecordData(
                                          dateTime: getCurrentTimestamp,
                                          user: currentUserReference,
                                          emailUser: currentUserEmail,
                                          describe:
                                              'Aluno cancelou a aula antes de do horário limite 12h',
                                          where: 'Aluno-Cancela Aula',
                                          saldoAnterior: valueOrDefault(
                                              currentUserDocument?.saldo, 0),
                                          saldoAgora: valueOrDefault(
                                                  currentUserDocument?.saldo,
                                                  0) +
                                              1,
                                          aulaRef: widget.aula?.reference,
                                        ));
                                        _model.log1 =
                                            LogsRecord.getDocumentFromData(
                                                createLogsRecordData(
                                                  dateTime: getCurrentTimestamp,
                                                  user: currentUserReference,
                                                  emailUser: currentUserEmail,
                                                  describe:
                                                      'Aluno cancelou a aula antes de do horário limite 12h',
                                                  where: 'Aluno-Cancela Aula',
                                                  saldoAnterior: valueOrDefault(
                                                      currentUserDocument
                                                          ?.saldo,
                                                      0),
                                                  saldoAgora: valueOrDefault(
                                                          currentUserDocument
                                                              ?.saldo,
                                                          0) +
                                                      1,
                                                  aulaRef:
                                                      widget.aula?.reference,
                                                ),
                                                logsRecordReference1);
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'saldo': FieldValue.increment(1),
                                              'Logs': FieldValue.arrayUnion(
                                                  [_model.log1?.reference]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent('Button_bottom_sheet');
                                        Navigator.pop(context);
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Agendamento cancelado',
                                              style: GoogleFonts.roboto(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0xFFDA2A0B),
                                          ),
                                        );
                                      } else {
                                        logFirebaseEvent('Button_backend_call');
                                        unawaited(
                                          () async {
                                            _model.apiResultihqe =
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
                                          }(),
                                        );
                                        logFirebaseEvent('Button_backend_call');
                                        unawaited(
                                          () async {
                                            await DeletaAgendamentoCall.call(
                                              idAula:
                                                  widget.aula?.reference.id,
                                            );
                                          }(),
                                        );
                                        logFirebaseEvent('Button_backend_call');

                                        await widget.aula!.reference
                                            .update(createAulasRecordData(
                                          cancelar: true,
                                          canceladoEm: getCurrentTimestamp,
                                        ));
                                        logFirebaseEvent('Button_backend_call');

                                        var logsRecordReference2 =
                                            LogsRecord.collection.doc();
                                        await logsRecordReference2
                                            .set(createLogsRecordData(
                                          dateTime: getCurrentTimestamp,
                                          user: currentUserReference,
                                          emailUser: currentUserEmail,
                                          describe:
                                              'Aluno cancelou a aula depois de do horário limite 12h',
                                          where: 'Aluno-Cancela Aula',
                                          saldoAnterior: valueOrDefault(
                                              currentUserDocument?.saldo, 0),
                                          saldoAgora: valueOrDefault(
                                              currentUserDocument?.saldo, 0),
                                          aulaRef: widget.aula?.reference,
                                        ));
                                        _model.log2 =
                                            LogsRecord.getDocumentFromData(
                                                createLogsRecordData(
                                                  dateTime: getCurrentTimestamp,
                                                  user: currentUserReference,
                                                  emailUser: currentUserEmail,
                                                  describe:
                                                      'Aluno cancelou a aula depois de do horário limite 12h',
                                                  where: 'Aluno-Cancela Aula',
                                                  saldoAnterior: valueOrDefault(
                                                      currentUserDocument
                                                          ?.saldo,
                                                      0),
                                                  saldoAgora: valueOrDefault(
                                                      currentUserDocument
                                                          ?.saldo,
                                                      0),
                                                  aulaRef:
                                                      widget.aula?.reference,
                                                ),
                                                logsRecordReference2);
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'Logs': FieldValue.arrayUnion(
                                                  [_model.log2?.reference]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent('Button_bottom_sheet');
                                        Navigator.pop(context);
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Cancelar Aula',
                                    options: FFButtonOptions(
                                      padding: EdgeInsets.all(24.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: FlutterFlowTheme.of(context)
                                                .labelLarge,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFF880000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              if ((widget.aula?.linkZoom != null &&
                                      widget.aula?.linkZoom != '') &&
                                  !widget.aula!.finalizada)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'VER_AULA_COMP_ABRIR_MEET_BTN_ON_TAP');
                                      logFirebaseEvent('Button_launch_u_r_l');
                                      await launchURL(widget.aula!.linkZoom);
                                    },
                                    text: 'Abrir Meet',
                                    options: FFButtonOptions(
                                      padding: EdgeInsets.all(24.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF03318E),
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
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'VER_AULA_COMP_FECHAR_BTN_ON_TAP');
                                  logFirebaseEvent('Button_bottom_sheet');
                                  Navigator.pop(context);
                                },
                                text: 'Fechar',
                                options: FFButtonOptions(
                                  padding: EdgeInsets.all(24.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ],
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
