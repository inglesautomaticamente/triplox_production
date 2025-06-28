import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'transferir_widget.dart' show TransferirWidget;
import 'package:flutter/material.dart';

class TransferirModel extends FlutterFlowModel<TransferirWidget> {
  ///  Local state fields for this page.

  Color mouseOnlogin = Color(0x0);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  String? _nomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for telefone widget.
  FocusNode? telefoneFocusNode;
  TextEditingController? telefoneTextController;
  String? Function(BuildContext, String?)? telefoneTextControllerValidator;
  String? _telefoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email não reconhecido';
    }
    return null;
  }

  // State field(s) for textoStart widget.
  String? textoStartValue;
  FormFieldController<String>? textoStartValueController;
  // State field(s) for textofinal widget.
  String? textofinalValue;
  FormFieldController<String>? textofinalValueController;
  // State field(s) for PssWinput widget.
  FocusNode? pssWinputFocusNode;
  TextEditingController? pssWinputTextController;
  late bool pssWinputVisibility;
  String? Function(BuildContext, String?)? pssWinputTextControllerValidator;
  String? _pssWinputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for MouseOnButtonLogin widget.
  bool mouseOnButtonLoginHovered = false;
  // Stores action output result for [Backend Call - API (Tranferir Aluno)] action in ButtonLoginOK widget.
  ApiCallResponse? oUTApiTranferir;

  @override
  void initState(BuildContext context) {
    nomeTextControllerValidator = _nomeTextControllerValidator;
    telefoneTextControllerValidator = _telefoneTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    pssWinputVisibility = false;
    pssWinputTextControllerValidator = _pssWinputTextControllerValidator;
  }

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    telefoneFocusNode?.dispose();
    telefoneTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    pssWinputFocusNode?.dispose();
    pssWinputTextController?.dispose();
  }
}
