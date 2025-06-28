import '/flutter_flow/flutter_flow_util.dart';
import 'perdeusenha_widget.dart' show PerdeusenhaWidget;
import 'package:flutter/material.dart';

class PerdeusenhaModel extends FlutterFlowModel<PerdeusenhaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailpararede widget.
  FocusNode? emailpararedeFocusNode;
  TextEditingController? emailpararedeTextController;
  String? Function(BuildContext, String?)? emailpararedeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailpararedeFocusNode?.dispose();
    emailpararedeTextController?.dispose();
  }
}
