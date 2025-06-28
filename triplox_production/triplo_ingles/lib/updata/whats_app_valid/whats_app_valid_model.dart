import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'whats_app_valid_widget.dart' show WhatsAppValidWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class WhatsAppValidModel extends FlutterFlowModel<WhatsAppValidWidget> {
  ///  Local state fields for this component.

  bool erro = false;

  int state = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TelefoneEdit widget.
  FocusNode? telefoneEditFocusNode;
  TextEditingController? telefoneEditTextController;
  final telefoneEditMask = MaskTextInputFormatter(mask: '+##############');
  String? Function(BuildContext, String?)? telefoneEditTextControllerValidator;
  // Stores action output result for [Backend Call - API (verifywhats)] action in Button widget.
  ApiCallResponse? apiResultsjb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    telefoneEditFocusNode?.dispose();
    telefoneEditTextController?.dispose();
  }
}
