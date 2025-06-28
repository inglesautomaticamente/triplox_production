import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'remover_horarios_widget.dart' show RemoverHorariosWidget;
import 'package:flutter/material.dart';

class RemoverHorariosModel extends FlutterFlowModel<RemoverHorariosWidget> {
  ///  Local state fields for this page.

  String? diadasemana = '';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in BT_PARA_REMOVER widget.
  AulasRecord? addAulaCopy;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
