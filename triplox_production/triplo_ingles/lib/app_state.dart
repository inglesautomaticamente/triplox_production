import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Alunoversion = prefs.getString('ff_Alunoversion') ?? _Alunoversion;
    });
    _safeInit(() {
      _Professorversion =
          prefs.getString('ff_Professorversion') ?? _Professorversion;
    });
    _safeInit(() {
      _versionref = prefs.getString('ff_versionref')?.ref ?? _versionref;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _dataAPI;
  DateTime? get dataAPI => _dataAPI;
  set dataAPI(DateTime? value) {
    _dataAPI = value;
  }

  DocumentReference? _professorSelecionado;
  DocumentReference? get professorSelecionado => _professorSelecionado;
  set professorSelecionado(DocumentReference? value) {
    _professorSelecionado = value;
  }

  String _diadaSemana = '';
  String get diadaSemana => _diadaSemana;
  set diadaSemana(String value) {
    _diadaSemana = value;
  }

  int _botaoAgendar = 0;
  int get botaoAgendar => _botaoAgendar;
  set botaoAgendar(int value) {
    _botaoAgendar = value;
  }

  String _dataCriarReuniao = '';
  String get dataCriarReuniao => _dataCriarReuniao;
  set dataCriarReuniao(String value) {
    _dataCriarReuniao = value;
  }

  List<String> _horarios = [];
  List<String> get horarios => _horarios;
  set horarios(List<String> value) {
    _horarios = value;
  }

  void addToHorarios(String value) {
    horarios.add(value);
  }

  void removeFromHorarios(String value) {
    horarios.remove(value);
  }

  void removeAtIndexFromHorarios(int index) {
    horarios.removeAt(index);
  }

  void updateHorariosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    horarios[index] = updateFn(_horarios[index]);
  }

  void insertAtIndexInHorarios(int index, String value) {
    horarios.insert(index, value);
  }

  int _voltar = 0;
  int get voltar => _voltar;
  set voltar(int value) {
    _voltar = value;
  }

  List<PedidosStruct> _pedidos = [];
  List<PedidosStruct> get pedidos => _pedidos;
  set pedidos(List<PedidosStruct> value) {
    _pedidos = value;
  }

  void addToPedidos(PedidosStruct value) {
    pedidos.add(value);
  }

  void removeFromPedidos(PedidosStruct value) {
    pedidos.remove(value);
  }

  void removeAtIndexFromPedidos(int index) {
    pedidos.removeAt(index);
  }

  void updatePedidosAtIndex(
    int index,
    PedidosStruct Function(PedidosStruct) updateFn,
  ) {
    pedidos[index] = updateFn(_pedidos[index]);
  }

  void insertAtIndexInPedidos(int index, PedidosStruct value) {
    pedidos.insert(index, value);
  }

  String _Alunoversion = 'v16.0.1';
  String get Alunoversion => _Alunoversion;
  set Alunoversion(String value) {
    _Alunoversion = value;
    prefs.setString('ff_Alunoversion', value);
  }

  String _Professorversion = 'v16.0.1';
  String get Professorversion => _Professorversion;
  set Professorversion(String value) {
    _Professorversion = value;
    prefs.setString('ff_Professorversion', value);
  }

  DocumentReference? _versionref =
      FirebaseFirestore.instance.doc('/versions/W5RtkM0gBemSqkFjU4ZZ');
  DocumentReference? get versionref => _versionref;
  set versionref(DocumentReference? value) {
    _versionref = value;
    value != null
        ? prefs.setString('ff_versionref', value.path)
        : prefs.remove('ff_versionref');
  }

  List<String> _HorariosDisponiveisParaAgendar = [];
  List<String> get HorariosDisponiveisParaAgendar =>
      _HorariosDisponiveisParaAgendar;
  set HorariosDisponiveisParaAgendar(List<String> value) {
    _HorariosDisponiveisParaAgendar = value;
  }

  void addToHorariosDisponiveisParaAgendar(String value) {
    HorariosDisponiveisParaAgendar.add(value);
  }

  void removeFromHorariosDisponiveisParaAgendar(String value) {
    HorariosDisponiveisParaAgendar.remove(value);
  }

  void removeAtIndexFromHorariosDisponiveisParaAgendar(int index) {
    HorariosDisponiveisParaAgendar.removeAt(index);
  }

  void updateHorariosDisponiveisParaAgendarAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    HorariosDisponiveisParaAgendar[index] =
        updateFn(_HorariosDisponiveisParaAgendar[index]);
  }

  void insertAtIndexInHorariosDisponiveisParaAgendar(int index, String value) {
    HorariosDisponiveisParaAgendar.insert(index, value);
  }

  String _HoraiosStatus = '';
  String get HoraiosStatus => _HoraiosStatus;
  set HoraiosStatus(String value) {
    _HoraiosStatus = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
