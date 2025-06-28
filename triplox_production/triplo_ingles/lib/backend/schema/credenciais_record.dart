import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CredenciaisRecord extends FirestoreRecord {
  CredenciaisRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "acess_token" field.
  String? _acessToken;
  String get acessToken => _acessToken ?? '';
  bool hasAcessToken() => _acessToken != null;

  // "refresh_token" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  bool hasRefreshToken() => _refreshToken != null;

  void _initializeFields() {
    _acessToken = snapshotData['acess_token'] as String?;
    _refreshToken = snapshotData['refresh_token'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('credenciais');

  static Stream<CredenciaisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CredenciaisRecord.fromSnapshot(s));

  static Future<CredenciaisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CredenciaisRecord.fromSnapshot(s));

  static CredenciaisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CredenciaisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CredenciaisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CredenciaisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CredenciaisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CredenciaisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCredenciaisRecordData({
  String? acessToken,
  String? refreshToken,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'acess_token': acessToken,
      'refresh_token': refreshToken,
    }.withoutNulls,
  );

  return firestoreData;
}

class CredenciaisRecordDocumentEquality implements Equality<CredenciaisRecord> {
  const CredenciaisRecordDocumentEquality();

  @override
  bool equals(CredenciaisRecord? e1, CredenciaisRecord? e2) {
    return e1?.acessToken == e2?.acessToken &&
        e1?.refreshToken == e2?.refreshToken;
  }

  @override
  int hash(CredenciaisRecord? e) =>
      const ListEquality().hash([e?.acessToken, e?.refreshToken]);

  @override
  bool isValidKey(Object? o) => o is CredenciaisRecord;
}
