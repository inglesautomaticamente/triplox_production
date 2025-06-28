import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnimalRecord extends FirestoreRecord {
  AnimalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pergunta1" field.
  String? _pergunta1;
  String get pergunta1 => _pergunta1 ?? '';
  bool hasPergunta1() => _pergunta1 != null;

  // "pergunta2" field.
  String? _pergunta2;
  String get pergunta2 => _pergunta2 ?? '';
  bool hasPergunta2() => _pergunta2 != null;

  // "pergunta3" field.
  String? _pergunta3;
  String get pergunta3 => _pergunta3 ?? '';
  bool hasPergunta3() => _pergunta3 != null;

  // "pergunta4" field.
  String? _pergunta4;
  String get pergunta4 => _pergunta4 ?? '';
  bool hasPergunta4() => _pergunta4 != null;

  // "pergunta5" field.
  String? _pergunta5;
  String get pergunta5 => _pergunta5 ?? '';
  bool hasPergunta5() => _pergunta5 != null;

  // "pergunta6" field.
  String? _pergunta6;
  String get pergunta6 => _pergunta6 ?? '';
  bool hasPergunta6() => _pergunta6 != null;

  // "pergunta7" field.
  String? _pergunta7;
  String get pergunta7 => _pergunta7 ?? '';
  bool hasPergunta7() => _pergunta7 != null;

  // "pergunta8" field.
  String? _pergunta8;
  String get pergunta8 => _pergunta8 ?? '';
  bool hasPergunta8() => _pergunta8 != null;

  // "pergunta9" field.
  String? _pergunta9;
  String get pergunta9 => _pergunta9 ?? '';
  bool hasPergunta9() => _pergunta9 != null;

  // "pergunta10" field.
  String? _pergunta10;
  String get pergunta10 => _pergunta10 ?? '';
  bool hasPergunta10() => _pergunta10 != null;

  // "pergunta11" field.
  String? _pergunta11;
  String get pergunta11 => _pergunta11 ?? '';
  bool hasPergunta11() => _pergunta11 != null;

  // "pergunta12" field.
  String? _pergunta12;
  String get pergunta12 => _pergunta12 ?? '';
  bool hasPergunta12() => _pergunta12 != null;

  // "pergunta13" field.
  String? _pergunta13;
  String get pergunta13 => _pergunta13 ?? '';
  bool hasPergunta13() => _pergunta13 != null;

  // "pergunta14" field.
  String? _pergunta14;
  String get pergunta14 => _pergunta14 ?? '';
  bool hasPergunta14() => _pergunta14 != null;

  // "pergunta15" field.
  String? _pergunta15;
  String get pergunta15 => _pergunta15 ?? '';
  bool hasPergunta15() => _pergunta15 != null;

  // "pergunta16" field.
  String? _pergunta16;
  String get pergunta16 => _pergunta16 ?? '';
  bool hasPergunta16() => _pergunta16 != null;

  // "pergunta17" field.
  String? _pergunta17;
  String get pergunta17 => _pergunta17 ?? '';
  bool hasPergunta17() => _pergunta17 != null;

  // "pergunta18" field.
  String? _pergunta18;
  String get pergunta18 => _pergunta18 ?? '';
  bool hasPergunta18() => _pergunta18 != null;

  // "pergunta19" field.
  String? _pergunta19;
  String get pergunta19 => _pergunta19 ?? '';
  bool hasPergunta19() => _pergunta19 != null;

  // "pergunta20" field.
  String? _pergunta20;
  String get pergunta20 => _pergunta20 ?? '';
  bool hasPergunta20() => _pergunta20 != null;

  // "pergunta21" field.
  String? _pergunta21;
  String get pergunta21 => _pergunta21 ?? '';
  bool hasPergunta21() => _pergunta21 != null;

  // "pergunta22" field.
  String? _pergunta22;
  String get pergunta22 => _pergunta22 ?? '';
  bool hasPergunta22() => _pergunta22 != null;

  // "pergunta23" field.
  String? _pergunta23;
  String get pergunta23 => _pergunta23 ?? '';
  bool hasPergunta23() => _pergunta23 != null;

  // "pergunta24" field.
  String? _pergunta24;
  String get pergunta24 => _pergunta24 ?? '';
  bool hasPergunta24() => _pergunta24 != null;

  // "pergunta25" field.
  String? _pergunta25;
  String get pergunta25 => _pergunta25 ?? '';
  bool hasPergunta25() => _pergunta25 != null;

  // "resultadoaustraliano" field.
  double? _resultadoaustraliano;
  double get resultadoaustraliano => _resultadoaustraliano ?? 0.0;
  bool hasResultadoaustraliano() => _resultadoaustraliano != null;

  // "resultadocanadence" field.
  double? _resultadocanadence;
  double get resultadocanadence => _resultadocanadence ?? 0.0;
  bool hasResultadocanadence() => _resultadocanadence != null;

  // "resultadoamericano" field.
  double? _resultadoamericano;
  double get resultadoamericano => _resultadoamericano ?? 0.0;
  bool hasResultadoamericano() => _resultadoamericano != null;

  // "resultadobritanico" field.
  double? _resultadobritanico;
  double get resultadobritanico => _resultadobritanico ?? 0.0;
  bool hasResultadobritanico() => _resultadobritanico != null;

  // "resultadofinal" field.
  String? _resultadofinal;
  String get resultadofinal => _resultadofinal ?? '';
  bool hasResultadofinal() => _resultadofinal != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _pergunta1 = snapshotData['pergunta1'] as String?;
    _pergunta2 = snapshotData['pergunta2'] as String?;
    _pergunta3 = snapshotData['pergunta3'] as String?;
    _pergunta4 = snapshotData['pergunta4'] as String?;
    _pergunta5 = snapshotData['pergunta5'] as String?;
    _pergunta6 = snapshotData['pergunta6'] as String?;
    _pergunta7 = snapshotData['pergunta7'] as String?;
    _pergunta8 = snapshotData['pergunta8'] as String?;
    _pergunta9 = snapshotData['pergunta9'] as String?;
    _pergunta10 = snapshotData['pergunta10'] as String?;
    _pergunta11 = snapshotData['pergunta11'] as String?;
    _pergunta12 = snapshotData['pergunta12'] as String?;
    _pergunta13 = snapshotData['pergunta13'] as String?;
    _pergunta14 = snapshotData['pergunta14'] as String?;
    _pergunta15 = snapshotData['pergunta15'] as String?;
    _pergunta16 = snapshotData['pergunta16'] as String?;
    _pergunta17 = snapshotData['pergunta17'] as String?;
    _pergunta18 = snapshotData['pergunta18'] as String?;
    _pergunta19 = snapshotData['pergunta19'] as String?;
    _pergunta20 = snapshotData['pergunta20'] as String?;
    _pergunta21 = snapshotData['pergunta21'] as String?;
    _pergunta22 = snapshotData['pergunta22'] as String?;
    _pergunta23 = snapshotData['pergunta23'] as String?;
    _pergunta24 = snapshotData['pergunta24'] as String?;
    _pergunta25 = snapshotData['pergunta25'] as String?;
    _resultadoaustraliano =
        castToType<double>(snapshotData['resultadoaustraliano']);
    _resultadocanadence =
        castToType<double>(snapshotData['resultadocanadence']);
    _resultadoamericano =
        castToType<double>(snapshotData['resultadoamericano']);
    _resultadobritanico =
        castToType<double>(snapshotData['resultadobritanico']);
    _resultadofinal = snapshotData['resultadofinal'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('animal')
          : FirebaseFirestore.instance.collectionGroup('animal');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('animal').doc(id);

  static Stream<AnimalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnimalRecord.fromSnapshot(s));

  static Future<AnimalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnimalRecord.fromSnapshot(s));

  static AnimalRecord fromSnapshot(DocumentSnapshot snapshot) => AnimalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnimalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnimalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnimalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnimalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnimalRecordData({
  String? pergunta1,
  String? pergunta2,
  String? pergunta3,
  String? pergunta4,
  String? pergunta5,
  String? pergunta6,
  String? pergunta7,
  String? pergunta8,
  String? pergunta9,
  String? pergunta10,
  String? pergunta11,
  String? pergunta12,
  String? pergunta13,
  String? pergunta14,
  String? pergunta15,
  String? pergunta16,
  String? pergunta17,
  String? pergunta18,
  String? pergunta19,
  String? pergunta20,
  String? pergunta21,
  String? pergunta22,
  String? pergunta23,
  String? pergunta24,
  String? pergunta25,
  double? resultadoaustraliano,
  double? resultadocanadence,
  double? resultadoamericano,
  double? resultadobritanico,
  String? resultadofinal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pergunta1': pergunta1,
      'pergunta2': pergunta2,
      'pergunta3': pergunta3,
      'pergunta4': pergunta4,
      'pergunta5': pergunta5,
      'pergunta6': pergunta6,
      'pergunta7': pergunta7,
      'pergunta8': pergunta8,
      'pergunta9': pergunta9,
      'pergunta10': pergunta10,
      'pergunta11': pergunta11,
      'pergunta12': pergunta12,
      'pergunta13': pergunta13,
      'pergunta14': pergunta14,
      'pergunta15': pergunta15,
      'pergunta16': pergunta16,
      'pergunta17': pergunta17,
      'pergunta18': pergunta18,
      'pergunta19': pergunta19,
      'pergunta20': pergunta20,
      'pergunta21': pergunta21,
      'pergunta22': pergunta22,
      'pergunta23': pergunta23,
      'pergunta24': pergunta24,
      'pergunta25': pergunta25,
      'resultadoaustraliano': resultadoaustraliano,
      'resultadocanadence': resultadocanadence,
      'resultadoamericano': resultadoamericano,
      'resultadobritanico': resultadobritanico,
      'resultadofinal': resultadofinal,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnimalRecordDocumentEquality implements Equality<AnimalRecord> {
  const AnimalRecordDocumentEquality();

  @override
  bool equals(AnimalRecord? e1, AnimalRecord? e2) {
    return e1?.pergunta1 == e2?.pergunta1 &&
        e1?.pergunta2 == e2?.pergunta2 &&
        e1?.pergunta3 == e2?.pergunta3 &&
        e1?.pergunta4 == e2?.pergunta4 &&
        e1?.pergunta5 == e2?.pergunta5 &&
        e1?.pergunta6 == e2?.pergunta6 &&
        e1?.pergunta7 == e2?.pergunta7 &&
        e1?.pergunta8 == e2?.pergunta8 &&
        e1?.pergunta9 == e2?.pergunta9 &&
        e1?.pergunta10 == e2?.pergunta10 &&
        e1?.pergunta11 == e2?.pergunta11 &&
        e1?.pergunta12 == e2?.pergunta12 &&
        e1?.pergunta13 == e2?.pergunta13 &&
        e1?.pergunta14 == e2?.pergunta14 &&
        e1?.pergunta15 == e2?.pergunta15 &&
        e1?.pergunta16 == e2?.pergunta16 &&
        e1?.pergunta17 == e2?.pergunta17 &&
        e1?.pergunta18 == e2?.pergunta18 &&
        e1?.pergunta19 == e2?.pergunta19 &&
        e1?.pergunta20 == e2?.pergunta20 &&
        e1?.pergunta21 == e2?.pergunta21 &&
        e1?.pergunta22 == e2?.pergunta22 &&
        e1?.pergunta23 == e2?.pergunta23 &&
        e1?.pergunta24 == e2?.pergunta24 &&
        e1?.pergunta25 == e2?.pergunta25 &&
        e1?.resultadoaustraliano == e2?.resultadoaustraliano &&
        e1?.resultadocanadence == e2?.resultadocanadence &&
        e1?.resultadoamericano == e2?.resultadoamericano &&
        e1?.resultadobritanico == e2?.resultadobritanico &&
        e1?.resultadofinal == e2?.resultadofinal;
  }

  @override
  int hash(AnimalRecord? e) => const ListEquality().hash([
        e?.pergunta1,
        e?.pergunta2,
        e?.pergunta3,
        e?.pergunta4,
        e?.pergunta5,
        e?.pergunta6,
        e?.pergunta7,
        e?.pergunta8,
        e?.pergunta9,
        e?.pergunta10,
        e?.pergunta11,
        e?.pergunta12,
        e?.pergunta13,
        e?.pergunta14,
        e?.pergunta15,
        e?.pergunta16,
        e?.pergunta17,
        e?.pergunta18,
        e?.pergunta19,
        e?.pergunta20,
        e?.pergunta21,
        e?.pergunta22,
        e?.pergunta23,
        e?.pergunta24,
        e?.pergunta25,
        e?.resultadoaustraliano,
        e?.resultadocanadence,
        e?.resultadoamericano,
        e?.resultadobritanico,
        e?.resultadofinal
      ]);

  @override
  bool isValidKey(Object? o) => o is AnimalRecord;
}
