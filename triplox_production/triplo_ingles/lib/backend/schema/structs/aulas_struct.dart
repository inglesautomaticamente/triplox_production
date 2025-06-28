// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AulasStruct extends FFFirebaseStruct {
  AulasStruct({
    DocumentReference? aula,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _aula = aula,
        super(firestoreUtilData);

  // "aula" field.
  DocumentReference? _aula;
  DocumentReference? get aula => _aula;
  set aula(DocumentReference? val) => _aula = val;

  bool hasAula() => _aula != null;

  static AulasStruct fromMap(Map<String, dynamic> data) => AulasStruct(
        aula: data['aula'] as DocumentReference?,
      );

  static AulasStruct? maybeFromMap(dynamic data) =>
      data is Map ? AulasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'aula': _aula,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'aula': serializeParam(
          _aula,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static AulasStruct fromSerializableMap(Map<String, dynamic> data) =>
      AulasStruct(
        aula: deserializeParam(
          data['aula'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['aulas'],
        ),
      );

  @override
  String toString() => 'AulasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AulasStruct && aula == other.aula;
  }

  @override
  int get hashCode => const ListEquality().hash([aula]);
}

AulasStruct createAulasStruct({
  DocumentReference? aula,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AulasStruct(
      aula: aula,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AulasStruct? updateAulasStruct(
  AulasStruct? aulas, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    aulas
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAulasStructData(
  Map<String, dynamic> firestoreData,
  AulasStruct? aulas,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (aulas == null) {
    return;
  }
  if (aulas.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && aulas.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final aulasData = getAulasFirestoreData(aulas, forFieldValue);
  final nestedData = aulasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = aulas.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAulasFirestoreData(
  AulasStruct? aulas, [
  bool forFieldValue = false,
]) {
  if (aulas == null) {
    return {};
  }
  final firestoreData = mapToFirestore(aulas.toMap());

  // Add any Firestore field values
  aulas.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAulasListFirestoreData(
  List<AulasStruct>? aulass,
) =>
    aulass?.map((e) => getAulasFirestoreData(e, true)).toList() ?? [];
