// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PedidosItensStruct extends FFFirebaseStruct {
  PedidosItensStruct({
    String? id,
    String? nomeproduto,
    double? valor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _nomeproduto = nomeproduto,
        _valor = valor,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "nomeproduto" field.
  String? _nomeproduto;
  String get nomeproduto => _nomeproduto ?? '';
  set nomeproduto(String? val) => _nomeproduto = val;

  bool hasNomeproduto() => _nomeproduto != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  static PedidosItensStruct fromMap(Map<String, dynamic> data) =>
      PedidosItensStruct(
        id: data['id'] as String?,
        nomeproduto: data['nomeproduto'] as String?,
        valor: castToType<double>(data['valor']),
      );

  static PedidosItensStruct? maybeFromMap(dynamic data) => data is Map
      ? PedidosItensStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nomeproduto': _nomeproduto,
        'valor': _valor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'nomeproduto': serializeParam(
          _nomeproduto,
          ParamType.String,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
      }.withoutNulls;

  static PedidosItensStruct fromSerializableMap(Map<String, dynamic> data) =>
      PedidosItensStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        nomeproduto: deserializeParam(
          data['nomeproduto'],
          ParamType.String,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PedidosItensStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PedidosItensStruct &&
        id == other.id &&
        nomeproduto == other.nomeproduto &&
        valor == other.valor;
  }

  @override
  int get hashCode => const ListEquality().hash([id, nomeproduto, valor]);
}

PedidosItensStruct createPedidosItensStruct({
  String? id,
  String? nomeproduto,
  double? valor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PedidosItensStruct(
      id: id,
      nomeproduto: nomeproduto,
      valor: valor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PedidosItensStruct? updatePedidosItensStruct(
  PedidosItensStruct? pedidosItens, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pedidosItens
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPedidosItensStructData(
  Map<String, dynamic> firestoreData,
  PedidosItensStruct? pedidosItens,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pedidosItens == null) {
    return;
  }
  if (pedidosItens.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pedidosItens.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pedidosItensData =
      getPedidosItensFirestoreData(pedidosItens, forFieldValue);
  final nestedData =
      pedidosItensData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pedidosItens.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPedidosItensFirestoreData(
  PedidosItensStruct? pedidosItens, [
  bool forFieldValue = false,
]) {
  if (pedidosItens == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pedidosItens.toMap());

  // Add any Firestore field values
  pedidosItens.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPedidosItensListFirestoreData(
  List<PedidosItensStruct>? pedidosItenss,
) =>
    pedidosItenss?.map((e) => getPedidosItensFirestoreData(e, true)).toList() ??
    [];
