// api_calls.dart completo atualizado com os novos webhooks do n8n

import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall123';

/// Início dos Webhooks n8n

class EvertonCompraDeCursoCall {
  static Future<ApiCallResponse> call({
    Map<String, dynamic>? body,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'EvertonCompraDeCurso',
      apiUrl:
          'https://plataforma-aulas-particulares-n8n.9jlknb.easypanel.host/webhook/f6725694-fa39-4573-813a-003a015df605',
      callType: ApiCallType.POST,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: jsonEncode(body ?? {}),
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

class EvertonEnviaRabbitCall {
  static Future<ApiCallResponse> call({
    Map<String, dynamic>? body,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'EvertonEnviaRabbit',
      apiUrl:
          'https://plataforma-aulas-particulares-n8n.9jlknb.easypanel.host/webhook/2d9fda74-ee25-4588-a381-2bf0b141806c',
      callType: ApiCallType.POST,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: jsonEncode(body ?? {}),
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

class EvertonTransferenciaWebhookCall {
  static Future<ApiCallResponse> call({
    Map<String, dynamic>? body,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'EvertonTransferenciaWebhook',
      apiUrl:
          'https://plataforma-aulas-particulares-n8n.9jlknb.easypanel.host/webhook/c456278f-877a-4d5a-9878-4e38a475a135',
      callType: ApiCallType.POST,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: jsonEncode(body ?? {}),
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

class EvertonConfirmaECancelaAulaCall {
  static Future<ApiCallResponse> call({
    Map<String, dynamic>? body,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'EvertonConfirmaECancelaAula',
      apiUrl:
          'https://plataforma-aulas-particulares-n8n.9jlknb.easypanel.host/webhook/71adbb9f-2ce7-4ee6-8ed3-2d8777654fc4',
      callType: ApiCallType.POST,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: jsonEncode(body ?? {}),
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

class EvertonVerifyWhatsappCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
  }) async {
    final ffApiRequestBody = '{"phone":"${escapeStringForJson(phone)}"}';
    return ApiManager.instance.makeApiCall(
      callName: 'EvertonVerifyWhatsapp',
      apiUrl:
          'https://plataforma-aulas-particulares-n8n.9jlknb.easypanel.host/webhook/46cb1e0f-43fa-4e67-bcba-c46asdasddad',
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
}

class TriploxGetGeoCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'TriploxGetGeo',
      apiUrl:
          'https://plataforma-aulas-particulares-n8n.9jlknb.easypanel.host/webhook/27280b1a-d166-4ad4-95f2-a307839a8e76',
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
}

class EvertonPrincipiaPagamentosCall {
  static Future<ApiCallResponse> call({
    Map<String, dynamic>? body,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'EvertonPrincipiaPagamentos',
      apiUrl:
          'https://plataforma-aulas-particulares-n8n.9jlknb.easypanel.host/webhook/1a25f83f-5b77-4d2b-a582-8fe7f0be5710',
      callType: ApiCallType.POST,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: jsonEncode(body ?? {}),
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

/// Fim dos Webhooks n8n
