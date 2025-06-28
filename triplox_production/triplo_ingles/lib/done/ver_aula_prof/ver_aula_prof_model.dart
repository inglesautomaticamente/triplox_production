import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ver_aula_prof_widget.dart' show VerAulaProfWidget;
import 'package:flutter/material.dart';

class VerAulaProfModel extends FlutterFlowModel<VerAulaProfWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (NotifyAulasStatus)] action in Button widget.
  ApiCallResponse? apiResultihqCopy;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? alunoData;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LogsRecord? log1;
  // Stores action output result for [Backend Call - API (NotifyAulasStatus)] action in Button widget.
  ApiCallResponse? apiResultihqeCopy;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? alunoData2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LogsRecord? log2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
