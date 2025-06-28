import '/components/menu_desktop_widget.dart';
import '/components/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'perfil_widget.dart' show PerfilWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PerfilModel extends FlutterFlowModel<PerfilWidget> {
  ///  Local state fields for this page.

  int opcaomenu = 1;

  ///  State fields for stateful widgets in this page.

  // Model for menu_mobile component.
  late MenuMobileModel menuMobileModel;
  // Model for menu_desktop component.
  late MenuDesktopModel menuDesktopModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for nome111 widget.
  FocusNode? nome111FocusNode;
  TextEditingController? nome111TextController;
  String? Function(BuildContext, String?)? nome111TextControllerValidator;
  // State field(s) for email11 widget.
  FocusNode? email11FocusNode;
  TextEditingController? email11TextController;
  String? Function(BuildContext, String?)? email11TextControllerValidator;
  // State field(s) for telefone1113 widget.
  FocusNode? telefone1113FocusNode;
  TextEditingController? telefone1113TextController;
  String? Function(BuildContext, String?)? telefone1113TextControllerValidator;
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
  // State field(s) for ddnomeendereco widget.
  FocusNode? ddnomeenderecoFocusNode1;
  TextEditingController? ddnomeenderecoTextController1;
  String? Function(BuildContext, String?)?
      ddnomeenderecoTextController1Validator;
  // State field(s) for ddcep widget.
  FocusNode? ddcepFocusNode1;
  TextEditingController? ddcepTextController1;
  String? Function(BuildContext, String?)? ddcepTextController1Validator;
  // State field(s) for ddnumero widget.
  FocusNode? ddnumeroFocusNode1;
  TextEditingController? ddnumeroTextController1;
  String? Function(BuildContext, String?)? ddnumeroTextController1Validator;
  // State field(s) for ddrua widget.
  FocusNode? ddruaFocusNode1;
  TextEditingController? ddruaTextController1;
  String? Function(BuildContext, String?)? ddruaTextController1Validator;
  // State field(s) for ddcomplemento widget.
  FocusNode? ddcomplementoFocusNode1;
  TextEditingController? ddcomplementoTextController1;
  String? Function(BuildContext, String?)?
      ddcomplementoTextController1Validator;
  // State field(s) for ddbairro widget.
  FocusNode? ddbairroFocusNode1;
  TextEditingController? ddbairroTextController1;
  String? Function(BuildContext, String?)? ddbairroTextController1Validator;
  // State field(s) for ddcidade widget.
  FocusNode? ddcidadeFocusNode1;
  TextEditingController? ddcidadeTextController1;
  String? Function(BuildContext, String?)? ddcidadeTextController1Validator;
  // State field(s) for ddestado widget.
  FocusNode? ddestadoFocusNode1;
  TextEditingController? ddestadoTextController1;
  String? Function(BuildContext, String?)? ddestadoTextController1Validator;
  // State field(s) for ddpais widget.
  FocusNode? ddpaisFocusNode1;
  TextEditingController? ddpaisTextController1;
  String? Function(BuildContext, String?)? ddpaisTextController1Validator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for nome22 widget.
  FocusNode? nome22FocusNode;
  TextEditingController? nome22TextController;
  String? Function(BuildContext, String?)? nome22TextControllerValidator;
  // State field(s) for email22 widget.
  FocusNode? email22FocusNode;
  TextEditingController? email22TextController;
  String? Function(BuildContext, String?)? email22TextControllerValidator;
  // State field(s) for telefone22 widget.
  FocusNode? telefone22FocusNode;
  TextEditingController? telefone22TextController;
  String? Function(BuildContext, String?)? telefone22TextControllerValidator;
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
  // State field(s) for ddnomeendereco widget.
  FocusNode? ddnomeenderecoFocusNode2;
  TextEditingController? ddnomeenderecoTextController2;
  String? Function(BuildContext, String?)?
      ddnomeenderecoTextController2Validator;
  // State field(s) for ddbairro widget.
  FocusNode? ddbairroFocusNode2;
  TextEditingController? ddbairroTextController2;
  String? Function(BuildContext, String?)? ddbairroTextController2Validator;
  // State field(s) for ddcep widget.
  FocusNode? ddcepFocusNode2;
  TextEditingController? ddcepTextController2;
  String? Function(BuildContext, String?)? ddcepTextController2Validator;
  // State field(s) for ddcidade widget.
  FocusNode? ddcidadeFocusNode2;
  TextEditingController? ddcidadeTextController2;
  String? Function(BuildContext, String?)? ddcidadeTextController2Validator;
  // State field(s) for ddnumero widget.
  FocusNode? ddnumeroFocusNode2;
  TextEditingController? ddnumeroTextController2;
  String? Function(BuildContext, String?)? ddnumeroTextController2Validator;
  // State field(s) for ddnumero widget.
  FocusNode? ddnumeroFocusNode3;
  TextEditingController? ddnumeroTextController3;
  String? Function(BuildContext, String?)? ddnumeroTextController3Validator;
  // State field(s) for ddestado widget.
  FocusNode? ddestadoFocusNode2;
  TextEditingController? ddestadoTextController2;
  String? Function(BuildContext, String?)? ddestadoTextController2Validator;
  // State field(s) for ddrua widget.
  FocusNode? ddruaFocusNode2;
  TextEditingController? ddruaTextController2;
  String? Function(BuildContext, String?)? ddruaTextController2Validator;
  // State field(s) for ddpais widget.
  FocusNode? ddpaisFocusNode2;
  TextEditingController? ddpaisTextController2;
  String? Function(BuildContext, String?)? ddpaisTextController2Validator;
  // State field(s) for ddcomplemento widget.
  FocusNode? ddcomplementoFocusNode2;
  TextEditingController? ddcomplementoTextController2;
  String? Function(BuildContext, String?)?
      ddcomplementoTextController2Validator;

  @override
  void initState(BuildContext context) {
    menuMobileModel = createModel(context, () => MenuMobileModel());
    menuDesktopModel = createModel(context, () => MenuDesktopModel());
  }

  @override
  void dispose() {
    menuMobileModel.dispose();
    menuDesktopModel.dispose();
    nome111FocusNode?.dispose();
    nome111TextController?.dispose();

    email11FocusNode?.dispose();
    email11TextController?.dispose();

    telefone1113FocusNode?.dispose();
    telefone1113TextController?.dispose();

    dtnascFocusNode1?.dispose();
    dtnascTextController1?.dispose();

    cpfFocusNode1?.dispose();
    cpfTextController1?.dispose();

    ddnomeenderecoFocusNode1?.dispose();
    ddnomeenderecoTextController1?.dispose();

    ddcepFocusNode1?.dispose();
    ddcepTextController1?.dispose();

    ddnumeroFocusNode1?.dispose();
    ddnumeroTextController1?.dispose();

    ddruaFocusNode1?.dispose();
    ddruaTextController1?.dispose();

    ddcomplementoFocusNode1?.dispose();
    ddcomplementoTextController1?.dispose();

    ddbairroFocusNode1?.dispose();
    ddbairroTextController1?.dispose();

    ddcidadeFocusNode1?.dispose();
    ddcidadeTextController1?.dispose();

    ddestadoFocusNode1?.dispose();
    ddestadoTextController1?.dispose();

    ddpaisFocusNode1?.dispose();
    ddpaisTextController1?.dispose();

    nome22FocusNode?.dispose();
    nome22TextController?.dispose();

    email22FocusNode?.dispose();
    email22TextController?.dispose();

    telefone22FocusNode?.dispose();
    telefone22TextController?.dispose();

    dtnascFocusNode2?.dispose();
    dtnascTextController2?.dispose();

    cpfFocusNode2?.dispose();
    cpfTextController2?.dispose();

    ddnomeenderecoFocusNode2?.dispose();
    ddnomeenderecoTextController2?.dispose();

    ddbairroFocusNode2?.dispose();
    ddbairroTextController2?.dispose();

    ddcepFocusNode2?.dispose();
    ddcepTextController2?.dispose();

    ddcidadeFocusNode2?.dispose();
    ddcidadeTextController2?.dispose();

    ddnumeroFocusNode2?.dispose();
    ddnumeroTextController2?.dispose();

    ddnumeroFocusNode3?.dispose();
    ddnumeroTextController3?.dispose();

    ddestadoFocusNode2?.dispose();
    ddestadoTextController2?.dispose();

    ddruaFocusNode2?.dispose();
    ddruaTextController2?.dispose();

    ddpaisFocusNode2?.dispose();
    ddpaisTextController2?.dispose();

    ddcomplementoFocusNode2?.dispose();
    ddcomplementoTextController2?.dispose();
  }
}
