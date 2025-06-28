import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FuncionamentoRecord extends FirestoreRecord {
  FuncionamentoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dia" field.
  String? _dia;
  String get dia => _dia ?? '';
  bool hasDia() => _dia != null;

  // "horarios" field.
  List<String>? _horarios;
  List<String> get horarios => _horarios ?? const [];
  bool hasHorarios() => _horarios != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dia = snapshotData['dia'] as String?;
    _horarios = getDataList(snapshotData['horarios']);
    _id = castToType<int>(snapshotData['id']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('funcionamento')
          : FirebaseFirestore.instance.collectionGroup('funcionamento');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('funcionamento').doc(id);

  static Stream<FuncionamentoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FuncionamentoRecord.fromSnapshot(s));

  static Future<FuncionamentoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FuncionamentoRecord.fromSnapshot(s));

  static FuncionamentoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FuncionamentoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FuncionamentoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FuncionamentoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FuncionamentoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FuncionamentoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFuncionamentoRecordData({
  String? dia,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dia': dia,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class FuncionamentoRecordDocumentEquality
    implements Equality<FuncionamentoRecord> {
  const FuncionamentoRecordDocumentEquality();

  @override
  bool equals(FuncionamentoRecord? e1, FuncionamentoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dia == e2?.dia &&
        listEquality.equals(e1?.horarios, e2?.horarios) &&
        e1?.id == e2?.id;
  }

  @override
  int hash(FuncionamentoRecord? e) =>
      const ListEquality().hash([e?.dia, e?.horarios, e?.id]);

  @override
  bool isValidKey(Object? o) => o is FuncionamentoRecord;
}
