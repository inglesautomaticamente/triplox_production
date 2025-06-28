import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RemoverHorariosRecord extends FirestoreRecord {
  RemoverHorariosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "horario" field.
  List<String>? _horario;
  List<String> get horario => _horario ?? const [];
  bool hasHorario() => _horario != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _horario = getDataList(snapshotData['horario']);
    _data = snapshotData['data'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Remover_Horarios')
          : FirebaseFirestore.instance.collectionGroup('Remover_Horarios');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Remover_Horarios').doc(id);

  static Stream<RemoverHorariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RemoverHorariosRecord.fromSnapshot(s));

  static Future<RemoverHorariosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RemoverHorariosRecord.fromSnapshot(s));

  static RemoverHorariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RemoverHorariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RemoverHorariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RemoverHorariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RemoverHorariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RemoverHorariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRemoverHorariosRecordData({
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class RemoverHorariosRecordDocumentEquality
    implements Equality<RemoverHorariosRecord> {
  const RemoverHorariosRecordDocumentEquality();

  @override
  bool equals(RemoverHorariosRecord? e1, RemoverHorariosRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.horario, e2?.horario) &&
        e1?.data == e2?.data;
  }

  @override
  int hash(RemoverHorariosRecord? e) =>
      const ListEquality().hash([e?.horario, e?.data]);

  @override
  bool isValidKey(Object? o) => o is RemoverHorariosRecord;
}
