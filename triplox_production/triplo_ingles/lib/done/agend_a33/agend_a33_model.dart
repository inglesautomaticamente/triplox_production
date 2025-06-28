import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/menu_desktop_widget.dart';
import '/components/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'agend_a33_widget.dart' show AgendA33Widget;
import 'package:flutter/material.dart';

class AgendA33Model extends FlutterFlowModel<AgendA33Widget> {
  ///  Local state fields for this page.

  String? diadasemana = '';

  String horariopage = '0';

  DateTime? daraOkPage;

  bool dataPassada = false;

  ///  State fields for stateful widgets in this page.

  // Model for menu_desktop component.
  late MenuDesktopModel menuDesktopModel;
  // Model for menu_mobile component.
  late MenuMobileModel menuMobileModel;
  // State field(s) for CalendarDesk widget.
  DateTimeRange? calendarDeskSelectedDay;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AulasRecord? addAulaCopy;
  // Stores action output result for [Backend Call - API (Agenda Cloud)] action in Button widget.
  ApiCallResponse? agendamentoCloud;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LogsRecord? log1;
  // State field(s) for calenderMobile widget.
  DateTimeRange? calenderMobileSelectedDay;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AulasRecord? addAulaCopy2;
  // Stores action output result for [Backend Call - API (Agenda Cloud)] action in Button widget.
  ApiCallResponse? agendamentoCloud2;

  @override
  void initState(BuildContext context) {
    menuDesktopModel = createModel(context, () => MenuDesktopModel());
    menuMobileModel = createModel(context, () => MenuMobileModel());
    calendarDeskSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calenderMobileSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    menuDesktopModel.dispose();
    menuMobileModel.dispose();
  }
}
