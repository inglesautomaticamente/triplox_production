import '/flutter_flow/flutter_flow_util.dart';
import 'alterar_saldo_widget.dart' show AlterarSaldoWidget;
import 'package:flutter/material.dart';

class AlterarSaldoModel extends FlutterFlowModel<AlterarSaldoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for removeQTD widget.
  FocusNode? removeQTDFocusNode;
  TextEditingController? removeQTDTextController;
  String? Function(BuildContext, String?)? removeQTDTextControllerValidator;
  // State field(s) for addQTD widget.
  FocusNode? addQTDFocusNode;
  TextEditingController? addQTDTextController;
  String? Function(BuildContext, String?)? addQTDTextControllerValidator;
  // State field(s) for definiQTD widget.
  FocusNode? definiQTDFocusNode;
  TextEditingController? definiQTDTextController;
  String? Function(BuildContext, String?)? definiQTDTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    removeQTDFocusNode?.dispose();
    removeQTDTextController?.dispose();

    addQTDFocusNode?.dispose();
    addQTDTextController?.dispose();

    definiQTDFocusNode?.dispose();
    definiQTDTextController?.dispose();
  }
}
