import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'completar_cadastro_widget.dart' show CompletarCadastroWidget;
import 'package:flutter/material.dart';

class CompletarCadastroModel extends FlutterFlowModel<CompletarCadastroWidget> {
  ///  Local state fields for this page.

  int pagina = 2;

  int intervalo = 45;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<String, bool> checkboxValueMap = {};
  List<String> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Backend Call - Create Document] action in Checkbox widget.
  FuncionamentoRecord? criado;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
