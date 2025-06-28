import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "saldo" field.
  int? _saldo;
  int get saldo => _saldo ?? 0;
  bool hasSaldo() => _saldo != null;

  // "starturl" field.
  String? _starturl;
  String get starturl => _starturl ?? '';
  bool hasStarturl() => _starturl != null;

  // "joinurl" field.
  String? _joinurl;
  String get joinurl => _joinurl ?? '';
  bool hasJoinurl() => _joinurl != null;

  // "data_nesci" field.
  String? _dataNesci;
  String get dataNesci => _dataNesci ?? '';
  bool hasDataNesci() => _dataNesci != null;

  // "cpf" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  // "nomeendereco" field.
  String? _nomeendereco;
  String get nomeendereco => _nomeendereco ?? '';
  bool hasNomeendereco() => _nomeendereco != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  bool hasCep() => _cep != null;

  // "numeroendereco" field.
  String? _numeroendereco;
  String get numeroendereco => _numeroendereco ?? '';
  bool hasNumeroendereco() => _numeroendereco != null;

  // "rua_avenida" field.
  String? _ruaAvenida;
  String get ruaAvenida => _ruaAvenida ?? '';
  bool hasRuaAvenida() => _ruaAvenida != null;

  // "complemento" field.
  String? _complemento;
  String get complemento => _complemento ?? '';
  bool hasComplemento() => _complemento != null;

  // "bairro" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  bool hasBairro() => _bairro != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "pais" field.
  String? _pais;
  String get pais => _pais ?? '';
  bool hasPais() => _pais != null;

  // "administrador_check" field.
  bool? _administradorCheck;
  bool get administradorCheck => _administradorCheck ?? false;
  bool hasAdministradorCheck() => _administradorCheck != null;

  // "professor" field.
  bool? _professor;
  bool get professor => _professor ?? false;
  bool hasProfessor() => _professor != null;

  // "professores" field.
  DocumentReference? _professores;
  DocumentReference? get professores => _professores;
  bool hasProfessores() => _professores != null;

  // "prof_completou_cadastro" field.
  bool? _profCompletouCadastro;
  bool get profCompletouCadastro => _profCompletouCadastro ?? false;
  bool hasProfCompletouCadastro() => _profCompletouCadastro != null;

  // "ddi" field.
  String? _ddi;
  String get ddi => _ddi ?? '';
  bool hasDdi() => _ddi != null;

  // "roles" field.
  List<String>? _roles;
  List<String> get roles => _roles ?? const [];
  bool hasRoles() => _roles != null;

  // "Logs" field.
  List<DocumentReference>? _logs;
  List<DocumentReference> get logs => _logs ?? const [];
  bool hasLogs() => _logs != null;

  // "saldo_verificado" field.
  bool? _saldoVerificado;
  bool get saldoVerificado => _saldoVerificado ?? false;
  bool hasSaldoVerificado() => _saldoVerificado != null;

  // "saldo_confirmado_em" field.
  DateTime? _saldoConfirmadoEm;
  DateTime? get saldoConfirmadoEm => _saldoConfirmadoEm;
  bool hasSaldoConfirmadoEm() => _saldoConfirmadoEm != null;

  // "solicitou_suporte" field.
  DateTime? _solicitouSuporte;
  DateTime? get solicitouSuporte => _solicitouSuporte;
  bool hasSolicitouSuporte() => _solicitouSuporte != null;

  // "fecharTutorial" field.
  bool? _fecharTutorial;
  bool get fecharTutorial => _fecharTutorial ?? false;
  bool hasFecharTutorial() => _fecharTutorial != null;

  // "ip" field.
  String? _ip;
  String get ip => _ip ?? '';
  bool hasIp() => _ip != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "country_name" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  bool hasCountryName() => _countryName != null;

  // "region_name" field.
  String? _regionName;
  String get regionName => _regionName ?? '';
  bool hasRegionName() => _regionName != null;

  // "city_name" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "wpp_verify" field.
  bool? _wppVerify;
  bool get wppVerify => _wppVerify ?? false;
  bool hasWppVerify() => _wppVerify != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _saldo = castToType<int>(snapshotData['saldo']);
    _starturl = snapshotData['starturl'] as String?;
    _joinurl = snapshotData['joinurl'] as String?;
    _dataNesci = snapshotData['data_nesci'] as String?;
    _cpf = snapshotData['cpf'] as String?;
    _genero = snapshotData['genero'] as String?;
    _nomeendereco = snapshotData['nomeendereco'] as String?;
    _cep = snapshotData['cep'] as String?;
    _numeroendereco = snapshotData['numeroendereco'] as String?;
    _ruaAvenida = snapshotData['rua_avenida'] as String?;
    _complemento = snapshotData['complemento'] as String?;
    _bairro = snapshotData['bairro'] as String?;
    _cidade = snapshotData['cidade'] as String?;
    _estado = snapshotData['estado'] as String?;
    _pais = snapshotData['pais'] as String?;
    _administradorCheck = snapshotData['administrador_check'] as bool?;
    _professor = snapshotData['professor'] as bool?;
    _professores = snapshotData['professores'] as DocumentReference?;
    _profCompletouCadastro = snapshotData['prof_completou_cadastro'] as bool?;
    _ddi = snapshotData['ddi'] as String?;
    _roles = getDataList(snapshotData['roles']);
    _logs = getDataList(snapshotData['Logs']);
    _saldoVerificado = snapshotData['saldo_verificado'] as bool?;
    _saldoConfirmadoEm = snapshotData['saldo_confirmado_em'] as DateTime?;
    _solicitouSuporte = snapshotData['solicitou_suporte'] as DateTime?;
    _fecharTutorial = snapshotData['fecharTutorial'] as bool?;
    _ip = snapshotData['ip'] as String?;
    _countryCode = snapshotData['country_code'] as String?;
    _countryName = snapshotData['country_name'] as String?;
    _regionName = snapshotData['region_name'] as String?;
    _cityName = snapshotData['city_name'] as String?;
    _wppVerify = snapshotData['wpp_verify'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? saldo,
  String? starturl,
  String? joinurl,
  String? dataNesci,
  String? cpf,
  String? genero,
  String? nomeendereco,
  String? cep,
  String? numeroendereco,
  String? ruaAvenida,
  String? complemento,
  String? bairro,
  String? cidade,
  String? estado,
  String? pais,
  bool? administradorCheck,
  bool? professor,
  DocumentReference? professores,
  bool? profCompletouCadastro,
  String? ddi,
  bool? saldoVerificado,
  DateTime? saldoConfirmadoEm,
  DateTime? solicitouSuporte,
  bool? fecharTutorial,
  String? ip,
  String? countryCode,
  String? countryName,
  String? regionName,
  String? cityName,
  bool? wppVerify,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'saldo': saldo,
      'starturl': starturl,
      'joinurl': joinurl,
      'data_nesci': dataNesci,
      'cpf': cpf,
      'genero': genero,
      'nomeendereco': nomeendereco,
      'cep': cep,
      'numeroendereco': numeroendereco,
      'rua_avenida': ruaAvenida,
      'complemento': complemento,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
      'pais': pais,
      'administrador_check': administradorCheck,
      'professor': professor,
      'professores': professores,
      'prof_completou_cadastro': profCompletouCadastro,
      'ddi': ddi,
      'saldo_verificado': saldoVerificado,
      'saldo_confirmado_em': saldoConfirmadoEm,
      'solicitou_suporte': solicitouSuporte,
      'fecharTutorial': fecharTutorial,
      'ip': ip,
      'country_code': countryCode,
      'country_name': countryName,
      'region_name': regionName,
      'city_name': cityName,
      'wpp_verify': wppVerify,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.saldo == e2?.saldo &&
        e1?.starturl == e2?.starturl &&
        e1?.joinurl == e2?.joinurl &&
        e1?.dataNesci == e2?.dataNesci &&
        e1?.cpf == e2?.cpf &&
        e1?.genero == e2?.genero &&
        e1?.nomeendereco == e2?.nomeendereco &&
        e1?.cep == e2?.cep &&
        e1?.numeroendereco == e2?.numeroendereco &&
        e1?.ruaAvenida == e2?.ruaAvenida &&
        e1?.complemento == e2?.complemento &&
        e1?.bairro == e2?.bairro &&
        e1?.cidade == e2?.cidade &&
        e1?.estado == e2?.estado &&
        e1?.pais == e2?.pais &&
        e1?.administradorCheck == e2?.administradorCheck &&
        e1?.professor == e2?.professor &&
        e1?.professores == e2?.professores &&
        e1?.profCompletouCadastro == e2?.profCompletouCadastro &&
        e1?.ddi == e2?.ddi &&
        listEquality.equals(e1?.roles, e2?.roles) &&
        listEquality.equals(e1?.logs, e2?.logs) &&
        e1?.saldoVerificado == e2?.saldoVerificado &&
        e1?.saldoConfirmadoEm == e2?.saldoConfirmadoEm &&
        e1?.solicitouSuporte == e2?.solicitouSuporte &&
        e1?.fecharTutorial == e2?.fecharTutorial &&
        e1?.ip == e2?.ip &&
        e1?.countryCode == e2?.countryCode &&
        e1?.countryName == e2?.countryName &&
        e1?.regionName == e2?.regionName &&
        e1?.cityName == e2?.cityName &&
        e1?.wppVerify == e2?.wppVerify;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.saldo,
        e?.starturl,
        e?.joinurl,
        e?.dataNesci,
        e?.cpf,
        e?.genero,
        e?.nomeendereco,
        e?.cep,
        e?.numeroendereco,
        e?.ruaAvenida,
        e?.complemento,
        e?.bairro,
        e?.cidade,
        e?.estado,
        e?.pais,
        e?.administradorCheck,
        e?.professor,
        e?.professores,
        e?.profCompletouCadastro,
        e?.ddi,
        e?.roles,
        e?.logs,
        e?.saldoVerificado,
        e?.saldoConfirmadoEm,
        e?.solicitouSuporte,
        e?.fecharTutorial,
        e?.ip,
        e?.countryCode,
        e?.countryName,
        e?.regionName,
        e?.cityName,
        e?.wppVerify
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
