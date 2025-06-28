const axios = require("axios").default;
const qs = require("qs");

/// Start Notificaes Group Code

function createNotificaesGroup() {
  return {
    baseUrl: `https://webhooks.audracs.com.br/data`,
    headers: {},
  };
}

async function _cadastroProfessoresCall(context, ffVariables) {
  var phone = ffVariables["phone"];
  var email = ffVariables["email"];
  var password = ffVariables["password"];
  var firstname = ffVariables["firstname"];
  var lastname = ffVariables["lastname"];
  const notificaesGroup = createNotificaesGroup();

  var url = `${notificaesGroup.baseUrl}/2d8bb9b1-8c71-48a8-b33c-f3563eca5019`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "phone": "${phone}",
  "name": "${firstname} ${lastname}",
  "email": "${email}",
  "password": "${password}",
  "firtname": "${firstname}",
  "lastname": "${lastname}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _notifyAulasStatusCall(context, ffVariables) {
  var telAluno = ffVariables["telAluno"];
  var telProf = ffVariables["telProf"];
  var dataAula = ffVariables["dataAula"];
  var linkInfo = ffVariables["linkInfo"];
  var typeNotify = ffVariables["typeNotify"];
  const notificaesGroup = createNotificaesGroup();

  var url = `${notificaesGroup.baseUrl}/71adbb9f-2ce7-4ee6-8ed3-2d8777654fc4`;
  var headers = {};
  var params = {
    type_notify: typeNotify,
    tel_aluno: telAluno,
    tel_prof: telProf,
    data_aula: dataAula,
    link_info: linkInfo,
  };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

/// End Notificaes Group Code

async function _criaLinksDeConviteDeReuniaoCall(context, ffVariables) {
  var url = `https://api.zoom.us/v2/meetings/88692388658/invite_links`;
  var headers = {
    Authorization: `Bearer eyJzdiI6IjAwMDAwMSIsImFsZyI6IkhTNTEyIiwidiI6IjIuMCIsImtpZCI6IjEyMzY3OTFlLWI1MDItNGNiNi1hMTcyLTBiOTc2ZDcwNmY4ZSJ9.eyJ2ZXIiOjksImF1aWQiOiI5NmQ4ZDIzY2ZhZjcxZjA5MTYxNDM2MWE0NzEyMzllZCIsImNvZGUiOiI2NHdGM21FR2I4NGw4TkJKQ1liVE9HU2RDVDNXRmhyNFEiLCJpc3MiOiJ6bTpjaWQ6ZFJJODJmUTFUZzJPd1AwQTV1UXZRdyIsImdubyI6MCwidHlwZSI6MCwidGlkIjowLCJhdWQiOiJodHRwczovL29hdXRoLnpvb20udXMiLCJ1aWQiOiIwelk0SEx6alFHaVUzUGV3UVNjME1nIiwibmJmIjoxNjk1NjkxNjc0LCJleHAiOjE2OTU2OTUyNzQsImlhdCI6MTY5NTY5MTY3NCwiYWlkIjoib19UMHUzUUZRREdCTlVxOVdsamRIdyJ9.qiCaB5HiaqqGx5Wjo-muSZKzIk9-DHdqmwlMA4pG2CDmaTdjqnC9Ounxom2kaFrSXe-J7WEtxQlsXfetFDSrKA`,
    "Content-Length": `0`,
    Accept: `*/*`,
    "Accept-Encoding": `gzip, deflate, br`,
    Connection: `keep-alive`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "attendees": [
    {
      "name": "Mauricio Jr"
    }
  ],
  "ttl": 1000
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _deletarReuniaoCall(context, ffVariables) {
  var idreuniao = ffVariables["idreuniao"];

  var url = `https://api.zoom.us/v2/meetings/${idreuniao}`;
  var headers = {
    Authorization: `Bearer eyJzdiI6IjAwMDAwMSIsImFsZyI6IkhTNTEyIiwidiI6IjIuMCIsImtpZCI6IjEyMzY3OTFlLWI1MDItNGNiNi1hMTcyLTBiOTc2ZDcwNmY4ZSJ9.eyJ2ZXIiOjksImF1aWQiOiI5NmQ4ZDIzY2ZhZjcxZjA5MTYxNDM2MWE0NzEyMzllZCIsImNvZGUiOiI2NHdGM21FR2I4NGw4TkJKQ1liVE9HU2RDVDNXRmhyNFEiLCJpc3MiOiJ6bTpjaWQ6ZFJJODJmUTFUZzJPd1AwQTV1UXZRdyIsImdubyI6MCwidHlwZSI6MCwidGlkIjowLCJhdWQiOiJodHRwczovL29hdXRoLnpvb20udXMiLCJ1aWQiOiIwelk0SEx6alFHaVUzUGV3UVNjME1nIiwibmJmIjoxNjk1NjkxNjc0LCJleHAiOjE2OTU2OTUyNzQsImlhdCI6MTY5NTY5MTY3NCwiYWlkIjoib19UMHUzUUZRREdCTlVxOVdsamRIdyJ9.qiCaB5HiaqqGx5Wjo-muSZKzIk9-DHdqmwlMA4pG2CDmaTdjqnC9Ounxom2kaFrSXe-J7WEtxQlsXfetFDSrKA`,
    "Content-Length": `0`,
    Accept: `*/*`,
    "Accept-Encoding": `gzip, deflate, br`,
    Connection: `keep-alive`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _atualizarTokenCall(context, ffVariables) {
  var token = ffVariables["token"];

  var url = `https://zoom.us/oauth/token`;
  var headers = {
    Authorization: `Basic ZFJJODJmUTFUZzJPd1AwQTV1UXZRdzpxaHNWc200TnY4cWdKRkJsOTd0djg2dXZjMlV1d1lDNw==`,
    "Content-Type": `application/x-www-form-urlencoded`,
  };
  var params = { grant_type: `refresh_token`, refresh_token: token };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "X_WWW_FORM_URL_ENCODED",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _webhookCall(context, ffVariables) {
  var idReuniao = ffVariables["idReuniao"];
  var urlReuniao = ffVariables["urlReuniao"];
  var data = ffVariables["data"];
  var hora = ffVariables["hora"];
  var nomeAluno = ffVariables["nomeAluno"];
  var nomeProfessor = ffVariables["nomeProfessor"];
  var telefoneAluno = ffVariables["telefoneAluno"];
  var telefoneProfessor = ffVariables["telefoneProfessor"];

  var url = `https://n8n.nowsystem.com.br/webhook/4ae157b0-68be-4e93-97c1-ff6b5a0fd49f`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "id_reunião": "${idReuniao}",
  "url_reuniao": "${urlReuniao}",
  "data": "${data}",
  "hora": "${hora}",
  "nome_aluno": "${nomeAluno}",
  "nome_professor": "${nomeProfessor}",
  "telefone_aluno": "${telefoneAluno}",
  "telefone_professor": "${telefoneProfessor}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _testeZOOMCall(context, ffVariables) {
  var topic = ffVariables["topic"];
  var data = ffVariables["data"];
  var duracao = ffVariables["duracao"];
  var agenda = ffVariables["agenda"];
  var token = ffVariables["token"];

  var url = `https://api.zoom.us/v2/users/me/meetings`;
  var headers = {
    Authorization: `Bearer ${token}`,
    Accept: `*/*`,
    "Content-Type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "topic": "agenda",
  "type": 2,
  "duration": 40,
  "timezone": "America/Sao_Paulo",
  "agenda": "teste",
  "recurrence": {
    "type": 1,
    "repeat_interval": 1
  },
  "settings": {
    "host_video": true,
    "participant_video": true,
    "join_before_host": false,
    "mute_upon_entry": false,
    "watermark": true,
    "audio": "voip",
    "auto_recording": "cloud"
  }
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _atualizaEGeraReuniaoCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }

  var url = `https://n8n.nowsystem.com.br/webhook/7428472742834729747024042438`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _tranferirAlunoCall(context, ffVariables) {
  var telefone = ffVariables["telefone"];
  var email = ffVariables["email"];
  var nome = ffVariables["nome"];
  var textoinicio = ffVariables["textoinicio"];
  var textofinal = ffVariables["textofinal"];

  var url = `https://webhooks.audracs.com.br/data/c456278f-877a-4d5a-9878-4e38a475a135`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "telefone": "${telefone}",
  "email": "${email}",
  "nome": "${nome}",
  "textoinicio": ${textoinicio},
  "textofinal": ${textofinal}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _agendaCloudCall(context, ffVariables) {
  var nomeAluno = ffVariables["nomeAluno"];
  var telefoneAluno = ffVariables["telefoneAluno"];
  var telefoneProfessor = ffVariables["telefoneProfessor"];
  var data = ffVariables["data"];
  var hora = ffVariables["hora"];
  var nomeProfessor = ffVariables["nomeProfessor"];
  var idAula = ffVariables["idAula"];

  var url = `https://workflows.audracs.com.br/data/59b4d6f6-baad-4795-9ff8-17d7c55a5b60`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "id_aula": "${idAula}",
  "nome_aluno": "${nomeAluno}",
  "telefone_aluno": "${telefoneAluno}",
  "nome_professor": "${nomeProfessor}",
  "telefone_professor": "${telefoneProfessor}",
  "data": "${data}",
  "hora": "${hora}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _deletaAgendamentoCall(context, ffVariables) {
  var idAula = ffVariables["idAula"];

  var url = `https://southamerica-east1-triplo-ingles.cloudfunctions.net/deletaagendamento`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "job_id": "${idAula}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    CriaLinksDeConviteDeReuniaoCall: _criaLinksDeConviteDeReuniaoCall,
    DeletarReuniaoCall: _deletarReuniaoCall,
    AtualizarTokenCall: _atualizarTokenCall,
    WebhookCall: _webhookCall,
    TesteZOOMCall: _testeZOOMCall,
    AtualizaEGeraReuniaoCall: _atualizaEGeraReuniaoCall,
    TranferirAlunoCall: _tranferirAlunoCall,
    AgendaCloudCall: _agendaCloudCall,
    DeletaAgendamentoCall: _deletaAgendamentoCall,
    CadastroProfessoresCall: _cadastroProfessoresCall,
    NotifyAulasStatusCall: _notifyAulasStatusCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return val
    .replace(/[\\]/g, "\\\\")
    .replace(/["]/g, '\\"')
    .replace(/[\n]/g, "\\n")
    .replace(/[\t]/g, "\\t");
}

module.exports = { makeApiCall };
