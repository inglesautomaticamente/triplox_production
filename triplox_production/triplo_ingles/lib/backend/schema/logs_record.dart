import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogsRecord extends FirestoreRecord {
  LogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "email_user" field.
  String? _emailUser;
  String get emailUser => _emailUser ?? '';
  bool hasEmailUser() => _emailUser != null;

  // "describe" field.
  String? _describe;
  String get describe => _describe ?? '';
  bool hasDescribe() => _describe != null;

  // "where" field.
  String? _where;
  String get where => _where ?? '';
  bool hasWhere() => _where != null;

  // "saldo_anterior" field.
  int? _saldoAnterior;
  int get saldoAnterior => _saldoAnterior ?? 0;
  bool hasSaldoAnterior() => _saldoAnterior != null;

  // "saldo_agora" field.
  int? _saldoAgora;
  int get saldoAgora => _saldoAgora ?? 0;
  bool hasSaldoAgora() => _saldoAgora != null;

  // "professor_id" field.
  DocumentReference? _professorId;
  DocumentReference? get professorId => _professorId;
  bool hasProfessorId() => _professorId != null;

  // "aula_ref" field.
  DocumentReference? _aulaRef;
  DocumentReference? get aulaRef => _aulaRef;
  bool hasAulaRef() => _aulaRef != null;

  void _initializeFields() {
    _dateTime = snapshotData['date_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _emailUser = snapshotData['email_user'] as String?;
    _describe = snapshotData['describe'] as String?;
    _where = snapshotData['where'] as String?;
    _saldoAnterior = castToType<int>(snapshotData['saldo_anterior']);
    _saldoAgora = castToType<int>(snapshotData['saldo_agora']);
    _professorId = snapshotData['professor_id'] as DocumentReference?;
    _aulaRef = snapshotData['aula_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('logs');

  static Stream<LogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogsRecord.fromSnapshot(s));

  static Future<LogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LogsRecord.fromSnapshot(s));

  static LogsRecord fromSnapshot(DocumentSnapshot snapshot) => LogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLogsRecordData({
  DateTime? dateTime,
  DocumentReference? user,
  String? emailUser,
  String? describe,
  String? where,
  int? saldoAnterior,
  int? saldoAgora,
  DocumentReference? professorId,
  DocumentReference? aulaRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_time': dateTime,
      'user': user,
      'email_user': emailUser,
      'describe': describe,
      'where': where,
      'saldo_anterior': saldoAnterior,
      'saldo_agora': saldoAgora,
      'professor_id': professorId,
      'aula_ref': aulaRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class LogsRecordDocumentEquality implements Equality<LogsRecord> {
  const LogsRecordDocumentEquality();

  @override
  bool equals(LogsRecord? e1, LogsRecord? e2) {
    return e1?.dateTime == e2?.dateTime &&
        e1?.user == e2?.user &&
        e1?.emailUser == e2?.emailUser &&
        e1?.describe == e2?.describe &&
        e1?.where == e2?.where &&
        e1?.saldoAnterior == e2?.saldoAnterior &&
        e1?.saldoAgora == e2?.saldoAgora &&
        e1?.professorId == e2?.professorId &&
        e1?.aulaRef == e2?.aulaRef;
  }

  @override
  int hash(LogsRecord? e) => const ListEquality().hash([
        e?.dateTime,
        e?.user,
        e?.emailUser,
        e?.describe,
        e?.where,
        e?.saldoAnterior,
        e?.saldoAgora,
        e?.professorId,
        e?.aulaRef
      ]);

  @override
  bool isValidKey(Object? o) => o is LogsRecord;
}
