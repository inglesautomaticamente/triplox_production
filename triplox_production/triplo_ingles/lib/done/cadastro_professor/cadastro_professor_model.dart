import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadastro_professor_widget.dart' show CadastroProfessorWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroProfessorModel extends FlutterFlowModel<CadastroProfessorWidget> {
  ///  Local state fields for this page.

  Color mouseOnlogin = Color(0x0);

  Color checkTermosColor = Color(0xFF95A1AC);

  bool checkTermosBt = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for primeironome widget.
  FocusNode? primeironomeFocusNode;
  TextEditingController? primeironomeTextController;
  String? Function(BuildContext, String?)? primeironomeTextControllerValidator;
  String? _primeironomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  // State field(s) for sobrenome widget.
  FocusNode? sobrenomeFocusNode;
  TextEditingController? sobrenomeTextController;
  String? Function(BuildContext, String?)? sobrenomeTextControllerValidator;
  String? _sobrenomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  // State field(s) for usuario widget.
  FocusNode? usuarioFocusNode;
  TextEditingController? usuarioTextController;
  final usuarioMask = MaskTextInputFormatter(mask: '@AAAAAAAAAAAAAAAAAAAAAAA');
  String? Function(BuildContext, String?)? usuarioTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email Inválido';
    }
    return null;
  }

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  // State field(s) for PssWinput widget.
  FocusNode? pssWinputFocusNode;
  TextEditingController? pssWinputTextController;
  late bool pssWinputVisibility;
  String? Function(BuildContext, String?)? pssWinputTextControllerValidator;
  String? _pssWinputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is rCampo Obrigatório';
    }

    if (val.length < 8) {
      return 'Mínimo 8 caracteres';
    }

    return null;
  }

  // State field(s) for confPssWinput widget.
  FocusNode? confPssWinputFocusNode;
  TextEditingController? confPssWinputTextController;
  late bool confPssWinputVisibility;
  String? Function(BuildContext, String?)? confPssWinputTextControllerValidator;
  String? _confPssWinputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    if (val.length < 8) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  // State field(s) for MouseOnButtonLogin widget.
  bool mouseOnButtonLoginHovered = false;
  // Stores action output result for [Backend Call - Create Document] action in ButtonLoginOK widget.
  ProfessoresRecord? professor;
  // Stores action output result for [Backend Call - API (Cadastro Professores)] action in ButtonLoginOK widget.
  ApiCallResponse? professorapi;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {
    primeironomeTextControllerValidator = _primeironomeTextControllerValidator;
    sobrenomeTextControllerValidator = _sobrenomeTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    pssWinputVisibility = false;
    pssWinputTextControllerValidator = _pssWinputTextControllerValidator;
    confPssWinputVisibility = false;
    confPssWinputTextControllerValidator =
        _confPssWinputTextControllerValidator;
  }

  @override
  void dispose() {
    primeironomeFocusNode?.dispose();
    primeironomeTextController?.dispose();

    sobrenomeFocusNode?.dispose();
    sobrenomeTextController?.dispose();

    usuarioFocusNode?.dispose();
    usuarioTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    pssWinputFocusNode?.dispose();
    pssWinputTextController?.dispose();

    confPssWinputFocusNode?.dispose();
    confPssWinputTextController?.dispose();
  }
}
