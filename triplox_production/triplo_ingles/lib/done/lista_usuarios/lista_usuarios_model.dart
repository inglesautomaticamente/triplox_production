import '/components/menu_desktop_widget.dart';
import '/components/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lista_usuarios_widget.dart' show ListaUsuariosWidget;
import 'package:flutter/material.dart';

class ListaUsuariosModel extends FlutterFlowModel<ListaUsuariosWidget> {
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
