import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/menu_desktop_widget.dart';
import '/components/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'confimaula_widget.dart' show ConfimaulaWidget;
import 'package:flutter/material.dart';

class ConfimaulaModel extends FlutterFlowModel<ConfimaulaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menu_desktop component.
  late MenuDesktopModel menuDesktopModel;
  // Model for menu_mobile component.
  late MenuMobileModel menuMobileModel;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? alunoDados;
  // Stores action output result for [Backend Call - API (NotifyAulasStatus)] action in Button widget.
  ApiCallResponse? apiResultihqCopy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LogsRecord? log1;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? alunoDados2;
  // Stores action output result for [Backend Call - API (NotifyAulasStatus)] action in Button widget.
  ApiCallResponse? apiResultihqCopy1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LogsRecord? log2;
  // Stores action output result for [Backend Call - API (Deleta Agendamento)] action in Button widget.
  ApiCallResponse? apiResult77l;
  // Stores action output result for [Backend Call - API (NotifyAulasStatus)] action in Button widget.
  ApiCallResponse? apiResultb7q;

  @override
  void initState(BuildContext context) {
    menuDesktopModel = createModel(context, () => MenuDesktopModel());
    menuMobileModel = createModel(context, () => MenuMobileModel());
  }

  @override
  void dispose() {
    menuDesktopModel.dispose();
    menuMobileModel.dispose();
  }
}
