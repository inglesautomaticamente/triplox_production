import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VersionsRecord extends FirestoreRecord {
  VersionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "alunos_version" field.
  String? _alunosVersion;
  String get alunosVersion => _alunosVersion ?? '';
  bool hasAlunosVersion() => _alunosVersion != null;

  // "professores_version" field.
  String? _professoresVersion;
  String get professoresVersion => _professoresVersion ?? '';
  bool hasProfessoresVersion() => _professoresVersion != null;

  // "em_manutencao" field.
  bool? _emManutencao;
  bool get emManutencao => _emManutencao ?? false;
  bool hasEmManutencao() => _emManutencao != null;

  void _initializeFields() {
    _alunosVersion = snapshotData['alunos_version'] as String?;
    _professoresVersion = snapshotData['professores_version'] as String?;
    _emManutencao = snapshotData['em_manutencao'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('versions');

  static Stream<VersionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VersionsRecord.fromSnapshot(s));

  static Future<VersionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VersionsRecord.fromSnapshot(s));

  static VersionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VersionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VersionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VersionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VersionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VersionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVersionsRecordData({
  String? alunosVersion,
  String? professoresVersion,
  bool? emManutencao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'alunos_version': alunosVersion,
      'professores_version': professoresVersion,
      'em_manutencao': emManutencao,
    }.withoutNulls,
  );

  return firestoreData;
}

class VersionsRecordDocumentEquality implements Equality<VersionsRecord> {
  const VersionsRecordDocumentEquality();

  @override
  bool equals(VersionsRecord? e1, VersionsRecord? e2) {
    return e1?.alunosVersion == e2?.alunosVersion &&
        e1?.professoresVersion == e2?.professoresVersion &&
        e1?.emManutencao == e2?.emManutencao;
  }

  @override
  int hash(VersionsRecord? e) => const ListEquality()
      .hash([e?.alunosVersion, e?.professoresVersion, e?.emManutencao]);

  @override
  bool isValidKey(Object? o) => o is VersionsRecord;
}
