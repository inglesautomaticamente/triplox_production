import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AulasRecord extends FirestoreRecord {
  AulasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "aluno" field.
  DocumentReference? _aluno;
  DocumentReference? get aluno => _aluno;
  bool hasAluno() => _aluno != null;

  // "professor" field.
  DocumentReference? _professor;
  DocumentReference? get professor => _professor;
  bool hasProfessor() => _professor != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "credito" field.
  int? _credito;
  int get credito => _credito ?? 0;
  bool hasCredito() => _credito != null;

  // "describe" field.
  String? _describe;
  String get describe => _describe ?? '';
  bool hasDescribe() => _describe != null;

  // "idzoom" field.
  String? _idzoom;
  String get idzoom => _idzoom ?? '';
  bool hasIdzoom() => _idzoom != null;

  // "observacao" field.
  String? _observacao;
  String get observacao => _observacao ?? '';
  bool hasObservacao() => _observacao != null;

  // "cancelar" field.
  bool? _cancelar;
  bool get cancelar => _cancelar ?? false;
  bool hasCancelar() => _cancelar != null;

  // "observacao_add" field.
  bool? _observacaoAdd;
  bool get observacaoAdd => _observacaoAdd ?? false;
  bool hasObservacaoAdd() => _observacaoAdd != null;

  // "link_zoom" field.
  String? _linkZoom;
  String get linkZoom => _linkZoom ?? '';
  bool hasLinkZoom() => _linkZoom != null;

  // "nome_aluno" field.
  String? _nomeAluno;
  String get nomeAluno => _nomeAluno ?? '';
  bool hasNomeAluno() => _nomeAluno != null;

  // "telefone_aluno" field.
  String? _telefoneAluno;
  String get telefoneAluno => _telefoneAluno ?? '';
  bool hasTelefoneAluno() => _telefoneAluno != null;

  // "data_zoom" field.
  String? _dataZoom;
  String get dataZoom => _dataZoom ?? '';
  bool hasDataZoom() => _dataZoom != null;

  // "link_zoom_professor" field.
  String? _linkZoomProfessor;
  String get linkZoomProfessor => _linkZoomProfessor ?? '';
  bool hasLinkZoomProfessor() => _linkZoomProfessor != null;

  // "verificada" field.
  bool? _verificada;
  bool get verificada => _verificada ?? false;
  bool hasVerificada() => _verificada != null;

  // "nome_professor" field.
  String? _nomeProfessor;
  String get nomeProfessor => _nomeProfessor ?? '';
  bool hasNomeProfessor() => _nomeProfessor != null;

  // "tel_professor" field.
  String? _telProfessor;
  String get telProfessor => _telProfessor ?? '';
  bool hasTelProfessor() => _telProfessor != null;

  // "horario" field.
  String? _horario;
  String get horario => _horario ?? '';
  bool hasHorario() => _horario != null;

  // "data_agandado" field.
  DateTime? _dataAgandado;
  DateTime? get dataAgandado => _dataAgandado;
  bool hasDataAgandado() => _dataAgandado != null;

  // "finalizada" field.
  bool? _finalizada;
  bool get finalizada => _finalizada ?? false;
  bool hasFinalizada() => _finalizada != null;

  // "removerhorarioaula" field.
  bool? _removerhorarioaula;
  bool get removerhorarioaula => _removerhorarioaula ?? false;
  bool hasRemoverhorarioaula() => _removerhorarioaula != null;

  // "agendado_page" field.
  String? _agendadoPage;
  String get agendadoPage => _agendadoPage ?? '';
  bool hasAgendadoPage() => _agendadoPage != null;

  // "cancelado_em" field.
  DateTime? _canceladoEm;
  DateTime? get canceladoEm => _canceladoEm;
  bool hasCanceladoEm() => _canceladoEm != null;

  void _initializeFields() {
    _aluno = snapshotData['aluno'] as DocumentReference?;
    _professor = snapshotData['professor'] as DocumentReference?;
    _data = snapshotData['data'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _credito = castToType<int>(snapshotData['credito']);
    _describe = snapshotData['describe'] as String?;
    _idzoom = snapshotData['idzoom'] as String?;
    _observacao = snapshotData['observacao'] as String?;
    _cancelar = snapshotData['cancelar'] as bool?;
    _observacaoAdd = snapshotData['observacao_add'] as bool?;
    _linkZoom = snapshotData['link_zoom'] as String?;
    _nomeAluno = snapshotData['nome_aluno'] as String?;
    _telefoneAluno = snapshotData['telefone_aluno'] as String?;
    _dataZoom = snapshotData['data_zoom'] as String?;
    _linkZoomProfessor = snapshotData['link_zoom_professor'] as String?;
    _verificada = snapshotData['verificada'] as bool?;
    _nomeProfessor = snapshotData['nome_professor'] as String?;
    _telProfessor = snapshotData['tel_professor'] as String?;
    _horario = snapshotData['horario'] as String?;
    _dataAgandado = snapshotData['data_agandado'] as DateTime?;
    _finalizada = snapshotData['finalizada'] as bool?;
    _removerhorarioaula = snapshotData['removerhorarioaula'] as bool?;
    _agendadoPage = snapshotData['agendado_page'] as String?;
    _canceladoEm = snapshotData['cancelado_em'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('aulas');

  static Stream<AulasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AulasRecord.fromSnapshot(s));

  static Future<AulasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AulasRecord.fromSnapshot(s));

  static AulasRecord fromSnapshot(DocumentSnapshot snapshot) => AulasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AulasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AulasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AulasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AulasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAulasRecordData({
  DocumentReference? aluno,
  DocumentReference? professor,
  DateTime? data,
  String? title,
  int? credito,
  String? describe,
  String? idzoom,
  String? observacao,
  bool? cancelar,
  bool? observacaoAdd,
  String? linkZoom,
  String? nomeAluno,
  String? telefoneAluno,
  String? dataZoom,
  String? linkZoomProfessor,
  bool? verificada,
  String? nomeProfessor,
  String? telProfessor,
  String? horario,
  DateTime? dataAgandado,
  bool? finalizada,
  bool? removerhorarioaula,
  String? agendadoPage,
  DateTime? canceladoEm,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'aluno': aluno,
      'professor': professor,
      'data': data,
      'title': title,
      'credito': credito,
      'describe': describe,
      'idzoom': idzoom,
      'observacao': observacao,
      'cancelar': cancelar,
      'observacao_add': observacaoAdd,
      'link_zoom': linkZoom,
      'nome_aluno': nomeAluno,
      'telefone_aluno': telefoneAluno,
      'data_zoom': dataZoom,
      'link_zoom_professor': linkZoomProfessor,
      'verificada': verificada,
      'nome_professor': nomeProfessor,
      'tel_professor': telProfessor,
      'horario': horario,
      'data_agandado': dataAgandado,
      'finalizada': finalizada,
      'removerhorarioaula': removerhorarioaula,
      'agendado_page': agendadoPage,
      'cancelado_em': canceladoEm,
    }.withoutNulls,
  );

  return firestoreData;
}

class AulasRecordDocumentEquality implements Equality<AulasRecord> {
  const AulasRecordDocumentEquality();

  @override
  bool equals(AulasRecord? e1, AulasRecord? e2) {
    return e1?.aluno == e2?.aluno &&
        e1?.professor == e2?.professor &&
        e1?.data == e2?.data &&
        e1?.title == e2?.title &&
        e1?.credito == e2?.credito &&
        e1?.describe == e2?.describe &&
        e1?.idzoom == e2?.idzoom &&
        e1?.observacao == e2?.observacao &&
        e1?.cancelar == e2?.cancelar &&
        e1?.observacaoAdd == e2?.observacaoAdd &&
        e1?.linkZoom == e2?.linkZoom &&
        e1?.nomeAluno == e2?.nomeAluno &&
        e1?.telefoneAluno == e2?.telefoneAluno &&
        e1?.dataZoom == e2?.dataZoom &&
        e1?.linkZoomProfessor == e2?.linkZoomProfessor &&
        e1?.verificada == e2?.verificada &&
        e1?.nomeProfessor == e2?.nomeProfessor &&
        e1?.telProfessor == e2?.telProfessor &&
        e1?.horario == e2?.horario &&
        e1?.dataAgandado == e2?.dataAgandado &&
        e1?.finalizada == e2?.finalizada &&
        e1?.removerhorarioaula == e2?.removerhorarioaula &&
        e1?.agendadoPage == e2?.agendadoPage &&
        e1?.canceladoEm == e2?.canceladoEm;
  }

  @override
  int hash(AulasRecord? e) => const ListEquality().hash([
        e?.aluno,
        e?.professor,
        e?.data,
        e?.title,
        e?.credito,
        e?.describe,
        e?.idzoom,
        e?.observacao,
        e?.cancelar,
        e?.observacaoAdd,
        e?.linkZoom,
        e?.nomeAluno,
        e?.telefoneAluno,
        e?.dataZoom,
        e?.linkZoomProfessor,
        e?.verificada,
        e?.nomeProfessor,
        e?.telProfessor,
        e?.horario,
        e?.dataAgandado,
        e?.finalizada,
        e?.removerhorarioaula,
        e?.agendadoPage,
        e?.canceladoEm
      ]);

  @override
  bool isValidKey(Object? o) => o is AulasRecord;
}
