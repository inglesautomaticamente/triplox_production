import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadastrode_aluno_teste_copy_widget.dart'
    show CadastrodeAlunoTesteCopyWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastrodeAlunoTesteCopyModel
    extends FlutterFlowModel<CadastrodeAlunoTesteCopyWidget> {
  ///  Local state fields for this page.

  Color mouseOnlogin = Color(0x0);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for PssWinput widget.
  FocusNode? pssWinputFocusNode;
  TextEditingController? pssWinputTextController;
  late bool pssWinputVisibility;
  String? Function(BuildContext, String?)? pssWinputTextControllerValidator;
  // State field(s) for nometeste widget.
  FocusNode? nometesteFocusNode;
  TextEditingController? nometesteTextController;
  String? Function(BuildContext, String?)? nometesteTextControllerValidator;
  // State field(s) for telefoneteste widget.
  FocusNode? telefonetesteFocusNode;
  TextEditingController? telefonetesteTextController;
  String? Function(BuildContext, String?)? telefonetesteTextControllerValidator;
  // State field(s) for cpfteste widget.
  FocusNode? cpftesteFocusNode;
  TextEditingController? cpftesteTextController;
  final cpftesteMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpftesteTextControllerValidator;
  // State field(s) for MouseOnButtonLogin widget.
  bool mouseOnButtonLoginHovered = false;
  // Stores action output result for [Backend Call - API (NovoUserTeste)] action in Button widget.
  ApiCallResponse? apiResultm7mCopy;

  @override
  void initState(BuildContext context) {
    pssWinputVisibility = false;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    pssWinputFocusNode?.dispose();
    pssWinputTextController?.dispose();

    nometesteFocusNode?.dispose();
    nometesteTextController?.dispose();

    telefonetesteFocusNode?.dispose();
    telefonetesteTextController?.dispose();

    cpftesteFocusNode?.dispose();
    cpftesteTextController?.dispose();
  }
}
