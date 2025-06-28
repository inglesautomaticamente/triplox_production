import '/flutter_flow/flutter_flow_util.dart';
import 'observacao_agenda_nova_widget.dart' show ObservacaoAgendaNovaWidget;
import 'package:flutter/material.dart';

class ObservacaoAgendaNovaModel
    extends FlutterFlowModel<ObservacaoAgendaNovaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    if (val.length < 2) {
      return 'Mínimo 2 caracteres';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
