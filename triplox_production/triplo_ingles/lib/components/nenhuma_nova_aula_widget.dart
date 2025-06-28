import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nenhuma_nova_aula_model.dart';
export 'nenhuma_nova_aula_model.dart';

class NenhumaNovaAulaWidget extends StatefulWidget {
  const NenhumaNovaAulaWidget({super.key});

  @override
  State<NenhumaNovaAulaWidget> createState() => _NenhumaNovaAulaWidgetState();
}

class _NenhumaNovaAulaWidgetState extends State<NenhumaNovaAulaWidget> {
  late NenhumaNovaAulaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NenhumaNovaAulaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        'Não contém novas aulas para serem confirmadas.',
        textAlign: TextAlign.center,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: FlutterFlowTheme.of(context).bodyMedium,
              fontSize: 16.0,
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
