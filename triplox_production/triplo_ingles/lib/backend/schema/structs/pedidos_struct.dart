// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosStruct extends FFFirebaseStruct {
  PedidosStruct({
    String? id,
    DocumentReference? cliente,
    List<PedidosItensStruct>? itens,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _cliente = cliente,
        _itens = itens,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "cliente" field.
  DocumentReference? _cliente;
  DocumentReference? get cliente => _cliente;
  set cliente(DocumentReference? val) => _cliente = val;

  bool hasCliente() => _cliente != null;

  // "itens" field.
  List<PedidosItensStruct>? _itens;
  List<PedidosItensStruct> get itens => _itens ?? const [];
  set itens(List<PedidosItensStruct>? val) => _itens = val;

  void updateItens(Function(List<PedidosItensStruct>) updateFn) {
    updateFn(_itens ??= []);
  }

  bool hasItens() => _itens != null;

  static PedidosStruct fromMap(Map<String, dynamic> data) => PedidosStruct(
        id: data['id'] as String?,
        cliente: data['cliente'] as DocumentReference?,
        itens: getStructList(
          data['itens'],
          PedidosItensStruct.fromMap,
        ),
      );

  static PedidosStruct? maybeFromMap(dynamic data) =>
      data is Map ? PedidosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'cliente': _cliente,
        'itens': _itens?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'cliente': serializeParam(
          _cliente,
          ParamType.DocumentReference,
        ),
        'itens': serializeParam(
          _itens,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PedidosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PedidosStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        cliente: deserializeParam(
          data['cliente'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['professores'],
        ),
        itens: deserializeStructParam<PedidosItensStruct>(
          data['itens'],
          ParamType.DataStruct,
          true,
          structBuilder: PedidosItensStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PedidosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PedidosStruct &&
        id == other.id &&
        cliente == other.cliente &&
        listEquality.equals(itens, other.itens);
  }

  @override
  int get hashCode => const ListEquality().hash([id, cliente, itens]);
}

PedidosStruct createPedidosStruct({
  String? id,
  DocumentReference? cliente,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PedidosStruct(
      id: id,
      cliente: cliente,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PedidosStruct? updatePedidosStruct(
  PedidosStruct? pedidos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pedidos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPedidosStructData(
  Map<String, dynamic> firestoreData,
  PedidosStruct? pedidos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pedidos == null) {
    return;
  }
  if (pedidos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pedidos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pedidosData = getPedidosFirestoreData(pedidos, forFieldValue);
  final nestedData = pedidosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pedidos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPedidosFirestoreData(
  PedidosStruct? pedidos, [
  bool forFieldValue = false,
]) {
  if (pedidos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pedidos.toMap());

  // Add any Firestore field values
  pedidos.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPedidosListFirestoreData(
  List<PedidosStruct>? pedidoss,
) =>
    pedidoss?.map((e) => getPedidosFirestoreData(e, true)).toList() ?? [];
