import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/updata/manutencao/manutencao_widget.dart';
import '/updata/saldoverifica/saldoverifica_widget.dart';
import '/updata/update/update_widget.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future opsManutencao(BuildContext context) async {
  logFirebaseEvent('OpsManutencao_alert_dialog');
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return WebViewAware(
        child: AlertDialog(
          title: Text('Ops,'),
          content: Text(
              'Essa opção está passando por uma manutenção nesse momento.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        ),
      );
    },
  );
}

Future version(BuildContext context) async {
  VersionsRecord? outVersionBack;

  logFirebaseEvent('Version_backend_call');
  outVersionBack =
      await VersionsRecord.getDocumentOnce(FFAppState().versionref!);
  if (outVersionBack.emManutencao == true) {
    logFirebaseEvent('Version_alert_dialog');
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: WebViewAware(
            child: ManutencaoWidget(),
          ),
        );
      },
    );
  }
  if (currentUserDocument?.professores != null) {
    if (outVersionBack.professoresVersion != FFAppState().Professorversion) {
      logFirebaseEvent('Version_alert_dialog');
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: UpdateWidget(),
            ),
          );
        },
      );
    }
  } else {
    if (outVersionBack.alunosVersion != FFAppState().Alunoversion) {
      logFirebaseEvent('Version_alert_dialog');
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: UpdateWidget(),
            ),
          );
        },
      );
    }
  }

  if (valueOrDefault<bool>(currentUserDocument?.saldoVerificado, false) ==
      true) {
    logFirebaseEvent('Version_alert_dialog');
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: WebViewAware(
            child: SaldoverificaWidget(),
          ),
        );
      },
    );
  } else if (valueOrDefault<bool>(
          currentUserDocument?.saldoVerificado, false) ==
      false) {}
}

Future geoo(BuildContext context) async {
  ApiCallResponse? apiResultgsi;

  logFirebaseEvent('geoo_backend_call');
  apiResultgsi = await GetGeoCall.call();

  if ((apiResultgsi.succeeded ?? true)) {
    logFirebaseEvent('geoo_backend_call');

    await currentUserReference!.update(createUsersRecordData(
      cityName: GetGeoCall.cityname(
        (apiResultgsi.jsonBody ?? ''),
      ),
      regionName: GetGeoCall.regionname(
        (apiResultgsi.jsonBody ?? ''),
      ),
      countryName: GetGeoCall.countryname(
        (apiResultgsi.jsonBody ?? ''),
      ),
      countryCode: GetGeoCall.countrycode(
        (apiResultgsi.jsonBody ?? ''),
      ),
      ip: GetGeoCall.ip(
        (apiResultgsi.jsonBody ?? ''),
      ),
    ));
  }
}
