import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  Color mouseOnlogin = Color(0x0);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - urlverify] action in Login widget.
  bool? outURL;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for PssWinput widget.
  FocusNode? pssWinputFocusNode;
  TextEditingController? pssWinputTextController;
  late bool pssWinputVisibility;
  String? Function(BuildContext, String?)? pssWinputTextControllerValidator;
  // State field(s) for MouseOnButtonLogin widget.
  bool mouseOnButtonLoginHovered = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

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
  }
}
