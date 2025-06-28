import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'drops_model.dart';
export 'drops_model.dart';

class DropsWidget extends StatefulWidget {
  const DropsWidget({
    super.key,
    required this.docRef,
    required this.index,
  });

  final DocumentReference? docRef;
  final int? index;

  @override
  State<DropsWidget> createState() => _DropsWidgetState();
}

class _DropsWidgetState extends State<DropsWidget> {
  late DropsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<FuncionamentoRecord>(
      future: FuncionamentoRecord.getDocumentOnce(widget.docRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: LinearProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          );
        }

        final rowFuncionamentoRecord = snapshot.data!;

        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowDropDown<String>(
              controller: _model.dasValueController ??=
                  FormFieldController<String>(
                _model.dasValue ??= functions.das(rowFuncionamentoRecord
                    .horarios
                    .elementAtOrNull(widget.index!)),
              ),
              options: functions.criarListadeHoras()!,
              onChanged: (val) async {
                safeSetState(() => _model.dasValue = val);
                logFirebaseEvent('DROPS_COMP_das_ON_FORM_WIDGET_SELECTED');
                logFirebaseEvent('das_update_app_state');
                FFAppState().horarios =
                    rowFuncionamentoRecord.horarios.toList().cast<String>();
                _model.updatePage(() {});
                logFirebaseEvent('das_update_app_state');
                FFAppState().updateHorariosAtIndex(
                  widget.index!,
                  (_) =>
                      functions.montarHorario(_model.dasValue, _model.asValue)!,
                );
                _model.updatePage(() {});
                logFirebaseEvent('das_backend_call');

                await rowFuncionamentoRecord.reference.update({
                  ...mapToFirestore(
                    {
                      'horarios': FFAppState().horarios,
                    },
                  ),
                });
              },
              width: 180.0,
              height: 50.0,
              searchHintTextStyle:
                  FlutterFlowTheme.of(context).labelMedium.override(
                        font: FlutterFlowTheme.of(context).labelMedium,
                        letterSpacing: 0.0,
                      ),
              searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: FlutterFlowTheme.of(context).bodyMedium,
                    letterSpacing: 0.0,
                  ),
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: FlutterFlowTheme.of(context).bodyMedium,
                    letterSpacing: 0.0,
                  ),
              hintText: '00:00',
              searchHintText: 'Buscar horário',
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: FlutterFlowTheme.of(context).alternate,
              borderWidth: 2.0,
              borderRadius: 8.0,
              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
              hidesUnderline: true,
              isSearchable: true,
              isMultiSelect: false,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Text(
                '-',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: FlutterFlowTheme.of(context).bodyMedium,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            FlutterFlowDropDown<String>(
              controller: _model.asValueController ??=
                  FormFieldController<String>(
                _model.asValue ??= functions.as(rowFuncionamentoRecord.horarios
                    .elementAtOrNull(widget.index!)),
              ),
              options: functions.criarListadeHoras()!,
              onChanged: (val) async {
                safeSetState(() => _model.asValue = val);
                logFirebaseEvent('DROPS_COMP_as_ON_FORM_WIDGET_SELECTED');
                logFirebaseEvent('as_update_app_state');
                FFAppState().horarios =
                    rowFuncionamentoRecord.horarios.toList().cast<String>();
                _model.updatePage(() {});
                logFirebaseEvent('as_update_app_state');
                FFAppState().updateHorariosAtIndex(
                  widget.index!,
                  (_) =>
                      functions.montarHorario(_model.dasValue, _model.asValue)!,
                );
                _model.updatePage(() {});
                logFirebaseEvent('as_backend_call');

                await rowFuncionamentoRecord.reference.update({
                  ...mapToFirestore(
                    {
                      'horarios': FFAppState().horarios,
                    },
                  ),
                });
              },
              width: 180.0,
              height: 50.0,
              searchHintTextStyle:
                  FlutterFlowTheme.of(context).labelMedium.override(
                        font: FlutterFlowTheme.of(context).labelMedium,
                        letterSpacing: 0.0,
                      ),
              searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: FlutterFlowTheme.of(context).bodyMedium,
                    letterSpacing: 0.0,
                  ),
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: FlutterFlowTheme.of(context).bodyMedium,
                    letterSpacing: 0.0,
                  ),
              hintText: '00:00',
              searchHintText: 'Buscar horário',
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: FlutterFlowTheme.of(context).alternate,
              borderWidth: 2.0,
              borderRadius: 8.0,
              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
              hidesUnderline: true,
              isSearchable: true,
              isMultiSelect: false,
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                buttonSize: 49.0,
                icon: FaIcon(
                  FontAwesomeIcons.trashAlt,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('DROPS_COMP_trashAlt_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_backend_call');

                  await widget.docRef!.update({
                    ...mapToFirestore(
                      {
                        'horarios': FieldValue.arrayRemove([
                          rowFuncionamentoRecord.horarios
                              .elementAtOrNull(widget.index!)
                        ]),
                      },
                    ),
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
