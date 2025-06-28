import '/components/menu_desktop_widget.dart';
import '/components/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'perfil_copy_widget.dart' show PerfilCopyWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PerfilCopyModel extends FlutterFlowModel<PerfilCopyWidget> {
  ///  Local state fields for this page.

  int opcaomenu = 1;

  ///  State fields for stateful widgets in this page.

  // Model for menu_mobile component.
  late MenuMobileModel menuMobileModel;
  // Model for menu_desktop component.
  late MenuDesktopModel menuDesktopModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode1;
  TextEditingController? nomeTextController1;
  String? Function(BuildContext, String?)? nomeTextController1Validator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for telefone widget.
  FocusNode? telefoneFocusNode1;
  TextEditingController? telefoneTextController1;
  final telefoneMask1 = MaskTextInputFormatter(mask: '## #####-####');
  String? Function(BuildContext, String?)? telefoneTextController1Validator;
  // State field(s) for dpgenero widget.
  String? dpgeneroValue1;
  FormFieldController<String>? dpgeneroValueController1;
  // State field(s) for dtnasc widget.
  FocusNode? dtnascFocusNode1;
  TextEditingController? dtnascTextController1;
  final dtnascMask1 = MaskTextInputFormatter(mask: '##/##/##');
  String? Function(BuildContext, String?)? dtnascTextController1Validator;
  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode1;
  TextEditingController? cpfTextController1;
  final cpfMask1 = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextController1Validator;
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode2;
  TextEditingController? nomeTextController2;
  String? Function(BuildContext, String?)? nomeTextController2Validator;
  // State field(s) for cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  String? Function(BuildContext, String?)? cepTextControllerValidator;
  // State field(s) for telefone widget.
  FocusNode? telefoneFocusNode2;
  TextEditingController? telefoneTextController2;
  final telefoneMask2 = MaskTextInputFormatter(mask: '## #####-####');
  String? Function(BuildContext, String?)? telefoneTextController2Validator;
  // State field(s) for dpgenero widget.
  String? dpgeneroValue2;
  FormFieldController<String>? dpgeneroValueController2;
  // State field(s) for dtnasc widget.
  FocusNode? dtnascFocusNode2;
  TextEditingController? dtnascTextController2;
  final dtnascMask2 = MaskTextInputFormatter(mask: '##/##/##');
  String? Function(BuildContext, String?)? dtnascTextController2Validator;
  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode2;
  TextEditingController? cpfTextController2;
  final cpfMask2 = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextController2Validator;

  @override
  void initState(BuildContext context) {
    menuMobileModel = createModel(context, () => MenuMobileModel());
    menuDesktopModel = createModel(context, () => MenuDesktopModel());
  }

  @override
  void dispose() {
    menuMobileModel.dispose();
    menuDesktopModel.dispose();
    nomeFocusNode1?.dispose();
    nomeTextController1?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    telefoneFocusNode1?.dispose();
    telefoneTextController1?.dispose();

    dtnascFocusNode1?.dispose();
    dtnascTextController1?.dispose();

    cpfFocusNode1?.dispose();
    cpfTextController1?.dispose();

    nomeFocusNode2?.dispose();
    nomeTextController2?.dispose();

    cepFocusNode?.dispose();
    cepTextController?.dispose();

    telefoneFocusNode2?.dispose();
    telefoneTextController2?.dispose();

    dtnascFocusNode2?.dispose();
    dtnascTextController2?.dispose();

    cpfFocusNode2?.dispose();
    cpfTextController2?.dispose();
  }
}
