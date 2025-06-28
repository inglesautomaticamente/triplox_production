import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'agenda_mobile_widget.dart' show AgendaMobileWidget;
import 'package:flutter/material.dart';

class AgendaMobileModel extends FlutterFlowModel<AgendaMobileWidget> {
  ///  Local state fields for this page.

  String? diaDaSemana = '';

  DateTime? daraOkPage;

  String? hararioForNotify;

  bool dataPassada = false;

  String? horarioSelecionado;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (BuscaHorariosDisponiveis)] action in agendaMobile widget.
  ApiCallResponse? outHoraiosPageLoad;
  // Model for menu_mobile component.
  late MenuMobileModel menuMobileModel;
  // State field(s) for calenderMobile widget.
  DateTimeRange? calenderMobileSelectedDay;
  // Stores action output result for [Backend Call - API (BuscaHorariosDisponiveis)] action in calenderMobile widget.
  ApiCallResponse? outHoraiosSelectCalendar;
  // Stores action output result for [Backend Call - API (AgendarHorario)] action in Button widget.
  ApiCallResponse? outAgendado;
  // Stores action output result for [Backend Call - API (BuscaHorariosDisponiveis)] action in Button widget.
  ApiCallResponse? outHoraiosPErroAgendar;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LogsRecord? log1;

  @override
  void initState(BuildContext context) {
    menuMobileModel = createModel(context, () => MenuMobileModel());
    calenderMobileSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    menuMobileModel.dispose();
  }
}
