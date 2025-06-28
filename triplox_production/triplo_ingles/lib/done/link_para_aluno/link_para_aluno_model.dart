import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'link_para_aluno_widget.dart' show LinkParaAlunoWidget;
import 'package:flutter/material.dart';

class LinkParaAlunoModel extends FlutterFlowModel<LinkParaAlunoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for linkkkinfooo widget.
  FocusNode? linkkkinfoooFocusNode;
  TextEditingController? linkkkinfoooTextController;
  String? Function(BuildContext, String?)? linkkkinfoooTextControllerValidator;
  // Stores action output result for [Backend Call - API (NotifyAulasStatus)] action in Button widget.
  ApiCallResponse? apiResult8nm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    linkkkinfoooFocusNode?.dispose();
    linkkkinfoooTextController?.dispose();
  }
}
