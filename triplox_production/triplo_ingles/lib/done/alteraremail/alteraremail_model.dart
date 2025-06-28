import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'alteraremail_widget.dart' show AlteraremailWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AlteraremailModel extends FlutterFlowModel<AlteraremailWidget> {
  ///  Local state fields for this page.

  Color mouseOnlogin = Color(0x0);

  Color checkTermosColor = Color(0xFF95A1AC);

  bool checkTermosBt = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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

  // State field(s) for emailnovo widget.
  FocusNode? emailnovoFocusNode;
  TextEditingController? emailnovoTextController;
  String? Function(BuildContext, String?)? emailnovoTextControllerValidator;
  // State field(s) for MouseOnButtonLogin widget.
  bool mouseOnButtonLoginHovered = false;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    usuarioFocusNode?.dispose();
    usuarioTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    emailnovoFocusNode?.dispose();
    emailnovoTextController?.dispose();
  }
}
