import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall123';

/// Start Notificaes Group Code

class NotificaesGroup {
  static CadastroProfessoresCall cadastroProfessoresCall =
      CadastroProfessoresCall();
  static NotifyAulasStatusCall notifyAulasStatusCall = NotifyAulasStatusCall();
}

class CadastroProfessoresCall {
  Future<ApiCallResponse> call({
    String? phone = '',
    String? email = '',
    String? password = '',
    String? firstname = '',
    String? lastname = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CadastroProfessoresCall',
        'variables': {
          'phone': phone,
          'email': email,
          'password': password,
          'firstname': firstname,
          'lastname': lastname,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class NotifyAulasStatusCall {
  Future<ApiCallResponse> call({
    String? telAluno = '',
    String? telProf = '',
    String? dataAula = '',
    String? linkInfo = '',
    String? typeNotify = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'NotifyAulasStatusCall',
        'variables': {
          'telAluno': telAluno,
          'telProf': telProf,
          'dataAula': dataAula,
          'linkInfo': linkInfo,
          'typeNotify': typeNotify,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End Notificaes Group Code

class CriaLinksDeConviteDeReuniaoCall {
  static Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CriaLinksDeConviteDeReuniaoCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeletarReuniaoCall {
  static Future<ApiCallResponse> call({
    String? idreuniao = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeletarReuniaoCall',
        'variables': {
          'idreuniao': idreuniao,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AtualizarTokenCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AtualizarTokenCall',
        'variables': {
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? acessToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  static String? refreshToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.refresh_token''',
      ));
}

class WebhookCall {
  static Future<ApiCallResponse> call({
    String? idReuniao = '',
    String? urlReuniao = '',
    String? data = '',
    String? hora = '',
    String? nomeAluno = '',
    String? nomeProfessor = '',
    String? telefoneAluno = '',
    String? telefoneProfessor = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'WebhookCall',
        'variables': {
          'idReuniao': idReuniao,
          'urlReuniao': urlReuniao,
          'data': data,
          'hora': hora,
          'nomeAluno': nomeAluno,
          'nomeProfessor': nomeProfessor,
          'telefoneAluno': telefoneAluno,
          'telefoneProfessor': telefoneProfessor,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class TesteZOOMCall {
  static Future<ApiCallResponse> call({
    String? topic = '',
    String? data = '',
    int? duracao,
    String? agenda = '',
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'TesteZOOMCall',
        'variables': {
          'topic': topic,
          'data': data,
          'duracao': duracao,
          'agenda': agenda,
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.start_url''',
      ));
}

class AtualizaEGeraReuniaoCall {
  static Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AtualizaEGeraReuniaoCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? uuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uuid''',
      ));
  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? hostid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.host_id''',
      ));
  static String? hostemail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.host_email''',
      ));
  static String? topic(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.topic''',
      ));
  static int? type(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.type''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? starttime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.start_time''',
      ));
  static int? duraction(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.duration''',
      ));
  static String? timezone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timezone''',
      ));
  static String? agenda(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.agenda''',
      ));
  static String? criadoem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.created_at''',
      ));
  static String? starturl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.start_url''',
      ));
  static String? joinurl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.join_url''',
      ));
}

class NovoUserTesteCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? senha = '',
    String? nome = '',
    String? telefone = '',
    String? cpf = '',
    int? saldo,
  }) async {
    final ffApiRequestBody = '''
{
  "data": {
    "email": "${email}",
    "password": "${senha}",
    "displaynamee": "${nome}",
    "phonenumberr": "+55${telefone}",
    "phonenumberoffddi": "${telefone}",
    "cpf": "${cpf}",
    "saldo": ${saldo}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'NovoUserTeste',
      apiUrl: 'https://us-central1-triplo-ingles.cloudfunctions.net/createUser',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TranferirAlunoCall {
  static Future<ApiCallResponse> call({
    String? telefone = '27993160804',
    String? email = 'testeproducao377@pedroscardua.com.br',
    String? nome = 'Pedro Producao Teste77',
    String? textoinicio = '1',
    String? textofinal = '1',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'TranferirAlunoCall',
        'variables': {
          'telefone': telefone,
          'email': email,
          'nome': nome,
          'textoinicio': textoinicio,
          'textofinal': textofinal,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
}

class AgendaCloudCall {
  static Future<ApiCallResponse> call({
    String? nomeAluno = '',
    String? telefoneAluno = '',
    String? telefoneProfessor = '',
    String? data = '',
    String? hora = '',
    String? nomeProfessor = '',
    String? idAula = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AgendaCloudCall',
        'variables': {
          'nomeAluno': nomeAluno,
          'telefoneAluno': telefoneAluno,
          'telefoneProfessor': telefoneProfessor,
          'data': data,
          'hora': hora,
          'nomeProfessor': nomeProfessor,
          'idAula': idAula,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeletaAgendamentoCall {
  static Future<ApiCallResponse> call({
    String? idAula = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeletaAgendamentoCall',
        'variables': {
          'idAula': idAula,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetGeoCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetGeo',
      apiUrl:
          'https://webhooks.audracs.com.br/data/27280b1a-d166-4ad4-95f2-a307839a8e76',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? ip(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ip''',
      ));
  static String? countrycode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.country_code''',
      ));
  static String? countryname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.country_name''',
      ));
  static String? regionname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.region_name''',
      ));
  static String? cityname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.city_name''',
      ));
}

class VerifywhatsCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
  }) async {
    final ffApiRequestBody = '''
{"phone":"${escapeStringForJson(phone)}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'verifywhats',
      apiUrl:
          'https://webhooks.audracs.com.br/data/46cb1e0f-43fa-4e67-bcba-c46asdasddad',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? exists(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.exists''',
      ));
  static String? jid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.jid''',
      ));
  static String? number(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.number''',
      ));
}

class BuscaHorariosDisponiveisCall {
  static Future<ApiCallResponse> call({
    String? data = '',
    String? professorId = '',
    String? diaSemana = '',
  }) async {
    final ffApiRequestBody = '''
{
  "data": "${escapeStringForJson(data)}",
  "professorId": "${escapeStringForJson(professorId)}",
  "diaSemana": "${escapeStringForJson(diaSemana)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BuscaHorariosDisponiveis',
      apiUrl:
          'https://webhooks.audracs.com.br/data/d8b9ac5c-c142-42c2-9a00-b00bf319db16',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? listHorarios(dynamic response) => (getJsonField(
        response,
        r'''$.funcionamentolist''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AgendarHorarioCall {
  static Future<ApiCallResponse> call({
    String? data = '',
    String? professorId = '',
    String? diaSemana = '',
    String? horario = '',
    String? idAluno = '',
    String? nomeProfessor = '',
    String? nomeAluno = '',
    String? telefoneAluno = '',
    String? telefoneProfressor = '',
    String? page = '',
  }) async {
    final ffApiRequestBody = '''
{
  "data": "${escapeStringForJson(data)}",
  "professorId": "${escapeStringForJson(professorId)}",
  "diaSemana": "${escapeStringForJson(diaSemana)}",
"horario":"${escapeStringForJson(horario)}",
"idAluno":"${escapeStringForJson(idAluno)}",
"nomeProfessor":"${escapeStringForJson(nomeProfessor)}",
"nomeAluno":"${escapeStringForJson(nomeAluno)}",
"telefoneAluno":"${escapeStringForJson(telefoneAluno)}",
"telefoneProfressor":"${escapeStringForJson(telefoneProfressor)}",
"page":"${escapeStringForJson(page)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AgendarHorario',
      apiUrl:
          'https://webhooks.audracs.com.br/data/e0cd1a89-1ce5-427f-a862-6169cd1e533b',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class AdicionarObservacaoCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "id": "${escapeStringForJson(id)}",
"text":"${escapeStringForJson(text)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AdicionarObservacao',
      apiUrl:
          'https://webhooks.audracs.com.br/data/bcf3226d-896e-4ca6-b0e6-ccbf27e75792',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
