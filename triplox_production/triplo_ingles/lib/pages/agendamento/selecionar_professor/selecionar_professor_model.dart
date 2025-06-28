import '/components/menu_desktop_widget.dart';
import '/components/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'selecionar_professor_widget.dart' show SelecionarProfessorWidget;
import 'package:flutter/material.dart';

class SelecionarProfessorModel
    extends FlutterFlowModel<SelecionarProfessorWidget> {
  ///  Local state fields for this page.

  int profselect = 0;

  bool mobile = false;

  ///  State fields for stateful widgets in this page.

  // Model for menu_desktop component.
  late MenuDesktopModel menuDesktopModel;
  // Model for menu_mobile component.
  late MenuMobileModel menuMobileModel;

  @override
  void initState(BuildContext context) {
    menuDesktopModel = createModel(context, () => MenuDesktopModel());
    menuMobileModel = createModel(context, () => MenuMobileModel());
  }

  @override
  void dispose() {
    menuDesktopModel.dispose();
    menuMobileModel.dispose();
  }
}
