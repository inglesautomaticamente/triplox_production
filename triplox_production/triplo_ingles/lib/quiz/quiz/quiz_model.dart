import '/flutter_flow/flutter_flow_util.dart';
import 'quiz_widget.dart' show QuizWidget;
import 'package:flutter/material.dart';

class QuizModel extends FlutterFlowModel<QuizWidget> {
  ///  Local state fields for this page.

  int pageView = 1;

  dynamic jsonn;

  int totalresp = 0;

  String? pergunta1;

  String? pergunta2;

  String? pergunta3;

  String? pergunta4;

  String? pergunta5;

  String? pergunta6;

  String? pergunta7;

  String? pergunta8;

  String? pergunta9;

  String? pergunta10;

  String? pergunta11;

  String? pergunta12;

  String? pergunta13;

  String? pergunta14;

  String? pergunta15;

  String? pergunta16;

  String? pergunta17;

  String? pergunta18;

  String? pergunta19;

  String? pergunta20;

  String? pergunta21;

  String? pergunta22;

  String? pergunta23;

  String? pergunta24;

  int minimocont = 286;

  int fontH = 12;

  String? pergunta25;

  int resAustraliano = 0;

  int resCanadense = 0;

  int resBritnico = 0;

  int resAmericano = 0;

  List<int> winnerListNumb = [];
  void addToWinnerListNumb(int item) => winnerListNumb.add(item);
  void removeFromWinnerListNumb(int item) => winnerListNumb.remove(item);
  void removeAtIndexFromWinnerListNumb(int index) =>
      winnerListNumb.removeAt(index);
  void insertAtIndexInWinnerListNumb(int index, int item) =>
      winnerListNumb.insert(index, item);
  void updateWinnerListNumbAtIndex(int index, Function(int) updateFn) =>
      winnerListNumb[index] = updateFn(winnerListNumb[index]);

  int winnerOce = 0;

  int etapa = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for tres widget.
  PageController? tresController;

  int get tresCurrentIndex => tresController != null &&
          tresController!.hasClients &&
          tresController!.page != null
      ? tresController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
