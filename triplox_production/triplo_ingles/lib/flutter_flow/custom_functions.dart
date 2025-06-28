import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? criarListadeDias() {
  // crie uma lista de dias de segunda a domingo
  final List<String> dias = [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
    'Domingo'
  ];
  return dias;
}

List<String>? criarListadeHoras() {
  // criar lista de horas com base nas variaveis
  List<String> hoursList = [];
  for (int i = 0; i < 24; i++) {
    for (int j = 0; j < 60; j += 5) {
      String hour = i.toString().padLeft(2, '0');
      String minute = j.toString().padLeft(2, '0');
      hoursList.add('$hour:$minute');
    }
  }
  return hoursList;
}

DateTime? montarData(
  String horario,
  DateTime data,
) {
  //Essa função pega o dia + horario e transforma em datetime com os segundos zerados
  print(horario);
  print(data);

  try {
    if (horario == null || data == null) {
      return null; // ou retorne um valor padrão, se apropriado
    }

    // Divida o horário pelo hífen e pegue apenas a primeira parte
    final partesHorario = horario.split('-');
    final horarioValido = partesHorario[0].trim();
    print(partesHorario);
    print(horarioValido);

    // Essa função pega o dia + horario e transforma em datetime com os segundos zerados

    final horaMinuto = horarioValido.split(':');
    if (horaMinuto.length != 2) {
      throw FormatException('Horário deve estar no formato HH:mm');
    }

    final hora = int.tryParse(horaMinuto[0]);
    final minuto = int.tryParse(horaMinuto[1]);

    if (hora == null || minuto == null) {
      return null; // ou retorne um valor padrão, se apropriado
    }
    print('hora: $hora');
    print('minuto: $minuto');
    print(data.year);
    print(data.month);
    print(data.day);

    final novoDateTime =
        DateTime(data.year, data.month, data.day, hora, minuto);
    print('Data retornada: $novoDateTime');
    return novoDateTime;
  } catch (e, stackTrace) {
    print('Erro ao montar a data: $e');
    print('StackTrace: $stackTrace');
    return null; // ou retorne um valor padrão, se apropriado
  }
}

String? diadaSemana(DateTime data) {
  final diasSemana = [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
    'Domingo'
  ];
  final diaSemana = diasSemana[data.weekday - 1];
  return diaSemana;
}

List<String>? ordenarHorarios(List<String> horarios) {
  horarios.sort((a, b) => a.compareTo(b));
  return horarios;
}

DateTime? dATAcorrigidaCopy(DateTime dataMount) {
  // current time zone  + 3 hours, dataselected  plus the results
  DateTime now = DateTime.now();
  Duration offset = now.timeZoneOffset;
  DateTime correctedTime = dataMount.add(Duration(hours: 3)).add(offset);
  print('DT MON DATA MOUNT = $dataMount');
  print('DT MON OFFSET= $offset');
  print('DT MON Data Corrigida: $correctedTime');
  return correctedTime;
}

bool h24H(DateTime dataselected) {
  // Obtém a data e hora atuais.
  DateTime now = DateTime.now();

  Duration offset = now.timeZoneOffset;

  // Adiciona 3 horas ao horário atual para obter 'nowPlus3Hours'.
  DateTime nowPlus3Hours = now.add(Duration(hours: 3)).add(offset);

  // Obtem o offset do fuso horário atual.

  // Ajusta 'dataselected' adicionando 3 horas e também o offset do fuso horário.
  // Isso assegura que a comparação entre 'dataselected' e o horário atual seja feita corretamente,
  // levando em consideração o fuso horário local.
  DateTime correctedTime = dataselected.add(Duration(hours: 3)).add(offset);

  // Calcula a diferença de tempo entre 'nowPlus3Hours' e 'correctedTime'.
  final Duration diferenca = nowPlus3Hours.difference(correctedTime).abs();

  // Verifica se a diferença é menor que 24 horas.
  // Retorna false se for menor que 24 horas, indicando que está "dentro de 24 horas".
  // Retorna true caso contrário, indicando que está "fora de 24 horas".
  return diferenca >= Duration(hours: 24);
}

List<String>? removerhorarios(
  List<String>? remover,
  List<String> horario,
) {
  // retorne a lista da variavel horarios sem os itens da variavel remover
  horario.removeWhere((element) => remover!.contains(element));
  return horario;
}

bool cancelarAgendamento(DateTime data) {
  // If the date is less than six hours from the current date, return false
  final now = DateTime.now();
  final diff = data.difference(now);
  if (diff.inHours < 6) {
    return false;
  }
  return true;
}

DateTime subtrairHoras(DateTime dataMarcada) {
  // Subtract 12 hours from the scheduled date
  return dataMarcada.subtract(Duration(hours: 12));
}

String removerAspas(String token) {
  // remove quotes from words
  return token.replaceAll('"', '');
}

bool h1HCopy(DateTime dataselected) {
  // Obtém a data e hora atuais.
  DateTime now = DateTime.now();

  Duration offset = now.timeZoneOffset;

  // Adiciona 3 horas ao horário atual para obter 'nowPlus3Hours'.
  DateTime nowPlus3Hours = now.add(Duration(hours: 3)).add(offset);

  // Obtem o offset do fuso horário atual.

  // Ajusta 'dataselected' adicionando 3 horas e também o offset do fuso horário.
  // Isso assegura que a comparação entre 'dataselected' e o horário atual seja feita corretamente,
  // levando em consideração o fuso horário local.
  DateTime correctedTime = dataselected.add(Duration(hours: 3)).add(offset);

  // Calcula a diferença de tempo entre 'nowPlus3Hours' e 'correctedTime'.
  final Duration diferenca = nowPlus3Hours.difference(correctedTime).abs();

  // Verifica se a diferença é menor que 24 horas.
  // Retorna false se for menor que 24 horas, indicando que está "dentro de 24 horas".
  // Retorna true caso contrário, indicando que está "fora de 24 horas".
  return diferenca >= Duration(hours: 1);
}

String formatarData(String data) {
  // Return in format 2023-10-22T15:05:41Z
  DateTime dateTime = DateTime.parse(data);
  String formattedDate = DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(dateTime);
  return formattedDate;
}

String? das(String? horario) {
  if (horario == null) {
    return null;
  }
  final index = horario.indexOf('-');
  if (index == -1) {
    return null;
  }
  return horario.substring(0, index);
}

String? as(String? horario) {
  if (horario == null) return null;
  final parts = horario.split('-');
  return parts.length > 1 ? parts[1] : null;
}

String? montarHorario(
  String? das,
  String? as,
) {
  if (das == null || as == null) {
    return null;
  }
  return '$das-$as';
}

DateTime? dATAcorrigida(DateTime dataselected) {
  DateTime now = DateTime.now();
  Duration offset = now.timeZoneOffset;

  // Check if daylight saving time is active
  bool isDaylightSaving =
      now.timeZoneOffset != DateTime(now.year, 1, 1).timeZoneOffset;

  // If DST is active, reduce 1 hour from the corrected time
  DateTime correctedTime = dataselected.add(Duration(hours: 3)).add(offset);
  if (isDaylightSaving) {
    correctedTime = correctedTime.subtract(Duration(hours: 1));
  }

  print('OFFSET= $offset');
  print('Data Corrigida: $correctedTime');

  return correctedTime;
}

int valizQuizAll(
  String? a1,
  String? a2,
  String? a3,
  String? a4,
  String? a5,
  String? a6,
  String? a7,
  String? a8,
  String? a9,
  String? a10,
  String? a11,
  String? a12,
  String? a13,
  String? a14,
  String? a15,
  String? a16,
  String? a17,
  String? a18,
  String? a19,
  String? a20,
  String? a21,
  String? a22,
  String? a23,
  String? a24,
  String? a25,
) {
  // Iterate over the arguments to find the first empty argument
  for (int i = 1; i <= 25; i++) {
    String? arg = Function.apply(() {
      switch (i) {
        case 1:
          return a1;
        case 2:
          return a2;
        case 3:
          return a3;
        case 4:
          return a4;
        case 5:
          return a5;
        case 6:
          return a6;
        case 7:
          return a7;
        case 8:
          return a8;
        case 9:
          return a9;
        case 10:
          return a10;
        case 11:
          return a11;
        case 12:
          return a12;
        case 13:
          return a13;
        case 14:
          return a14;
        case 15:
          return a15;
        case 16:
          return a16;
        case 17:
          return a17;
        case 18:
          return a18;
        case 19:
          return a19;
        case 20:
          return a20;
        case 21:
          return a21;
        case 22:
          return a22;
        case 23:
          return a23;
        case 24:
          return a24;
        case 25:
          return a25;
        default:
          return null;
      }
    }, []);

    if (arg == null || arg.isEmpty) {
      // Extract the number from the argument name
      RegExp regex = RegExp(r"a(\d+)");
      Match? match = regex.firstMatch('a$i');
      if (match != null) {
        String number = match.group(1)!;
        return int.parse(number) - 1;
      }
    }
  }

  // If all arguments are filled, return 0
  return 0;
}

int valizQuizAustraliano(
  String? a1,
  String? a2,
  String? a3,
  String? a4,
  String? a5,
  String? a6,
  String? a7,
  String? a8,
  String? a9,
  String? a10,
  String? a11,
  String? a12,
  String? a13,
  String? a14,
  String? a15,
  String? a16,
  String? a17,
  String? a18,
  String? a19,
  String? a20,
  String? a21,
  String? a22,
  String? a23,
  String? a24,
  String? a25,
) {
  // Variable to store the count of the word "Australiano"
  int countAustraliano = 0;

  // Iterate over the arguments to find the word "Australiano"
  for (int i = 1; i <= 25; i++) {
    String? arg = Function.apply(() {
      switch (i) {
        case 1:
          return a1;
        case 2:
          return a2;
        case 3:
          return a3;
        case 4:
          return a4;
        case 5:
          return a5;
        case 6:
          return a6;
        case 7:
          return a7;
        case 8:
          return a8;
        case 9:
          return a9;
        case 10:
          return a10;
        case 11:
          return a11;
        case 12:
          return a12;
        case 13:
          return a13;
        case 14:
          return a14;
        case 15:
          return a15;
        case 16:
          return a16;
        case 17:
          return a17;
        case 18:
          return a18;
        case 19:
          return a19;
        case 20:
          return a20;
        case 21:
          return a21;
        case 22:
          return a22;
        case 23:
          return a23;
        case 24:
          return a24;
        case 25:
          return a25;
        default:
          return null;
      }
    }, []);

    // Check if the argument contains the word "Australiano"
    if (arg != null && arg.contains("Australiano")) {
      countAustraliano++;
    }
  }

  // Return the count of the word "Australiano"
  return countAustraliano;
}

int valizQuizCanadense(
  String? a1,
  String? a2,
  String? a3,
  String? a4,
  String? a5,
  String? a6,
  String? a7,
  String? a8,
  String? a9,
  String? a10,
  String? a11,
  String? a12,
  String? a13,
  String? a14,
  String? a15,
  String? a16,
  String? a17,
  String? a18,
  String? a19,
  String? a20,
  String? a21,
  String? a22,
  String? a23,
  String? a24,
  String? a25,
) {
  // Variable to store the count of the word "Australiano"
  int countAustraliano = 0;

  // Iterate over the arguments to find the word "Australiano"
  for (int i = 1; i <= 25; i++) {
    String? arg = Function.apply(() {
      switch (i) {
        case 1:
          return a1;
        case 2:
          return a2;
        case 3:
          return a3;
        case 4:
          return a4;
        case 5:
          return a5;
        case 6:
          return a6;
        case 7:
          return a7;
        case 8:
          return a8;
        case 9:
          return a9;
        case 10:
          return a10;
        case 11:
          return a11;
        case 12:
          return a12;
        case 13:
          return a13;
        case 14:
          return a14;
        case 15:
          return a15;
        case 16:
          return a16;
        case 17:
          return a17;
        case 18:
          return a18;
        case 19:
          return a19;
        case 20:
          return a20;
        case 21:
          return a21;
        case 22:
          return a22;
        case 23:
          return a23;
        case 24:
          return a24;
        case 25:
          return a25;
        default:
          return null;
      }
    }, []);

    // Check if the argument contains the word "Australiano"
    if (arg != null && arg.contains("Canadense")) {
      countAustraliano++;
    }
  }

  // Return the count of the word "Australiano"
  return countAustraliano;
}

int valizQuizBritnico(
  String? a1,
  String? a2,
  String? a3,
  String? a4,
  String? a5,
  String? a6,
  String? a7,
  String? a8,
  String? a9,
  String? a10,
  String? a11,
  String? a12,
  String? a13,
  String? a14,
  String? a15,
  String? a16,
  String? a17,
  String? a18,
  String? a19,
  String? a20,
  String? a21,
  String? a22,
  String? a23,
  String? a24,
  String? a25,
) {
  // Variable to store the count of the word "Australiano"
  int countAustraliano = 0;

  // Iterate over the arguments to find the word "Australiano"
  for (int i = 1; i <= 25; i++) {
    String? arg = Function.apply(() {
      switch (i) {
        case 1:
          return a1;
        case 2:
          return a2;
        case 3:
          return a3;
        case 4:
          return a4;
        case 5:
          return a5;
        case 6:
          return a6;
        case 7:
          return a7;
        case 8:
          return a8;
        case 9:
          return a9;
        case 10:
          return a10;
        case 11:
          return a11;
        case 12:
          return a12;
        case 13:
          return a13;
        case 14:
          return a14;
        case 15:
          return a15;
        case 16:
          return a16;
        case 17:
          return a17;
        case 18:
          return a18;
        case 19:
          return a19;
        case 20:
          return a20;
        case 21:
          return a21;
        case 22:
          return a22;
        case 23:
          return a23;
        case 24:
          return a24;
        case 25:
          return a25;
        default:
          return null;
      }
    }, []);

    // Check if the argument contains the word "Australiano"
    if (arg != null && arg.contains("Britânico")) {
      countAustraliano++;
    }
  }

  // Return the count of the word "Australiano"
  return countAustraliano;
}

int valizQuizAmericano(
  String? a1,
  String? a2,
  String? a3,
  String? a4,
  String? a5,
  String? a6,
  String? a7,
  String? a8,
  String? a9,
  String? a10,
  String? a11,
  String? a12,
  String? a13,
  String? a14,
  String? a15,
  String? a16,
  String? a17,
  String? a18,
  String? a19,
  String? a20,
  String? a21,
  String? a22,
  String? a23,
  String? a24,
  String? a25,
) {
  // Variable to store the count of the word "Australiano"
  int countAustraliano = 0;

  // Iterate over the arguments to find the word "Australiano"
  for (int i = 1; i <= 25; i++) {
    String? arg = Function.apply(() {
      switch (i) {
        case 1:
          return a1;
        case 2:
          return a2;
        case 3:
          return a3;
        case 4:
          return a4;
        case 5:
          return a5;
        case 6:
          return a6;
        case 7:
          return a7;
        case 8:
          return a8;
        case 9:
          return a9;
        case 10:
          return a10;
        case 11:
          return a11;
        case 12:
          return a12;
        case 13:
          return a13;
        case 14:
          return a14;
        case 15:
          return a15;
        case 16:
          return a16;
        case 17:
          return a17;
        case 18:
          return a18;
        case 19:
          return a19;
        case 20:
          return a20;
        case 21:
          return a21;
        case 22:
          return a22;
        case 23:
          return a23;
        case 24:
          return a24;
        case 25:
          return a25;
        default:
          return null;
      }
    }, []);

    // Check if the argument contains the word "Australiano"
    if (arg != null && arg.contains("Americano")) {
      countAustraliano++;
    }
  }

  // Return the count of the word "Australiano"
  return countAustraliano;
}

int winnerQuiz(
  int australiano,
  int canadense,
  int britnico,
  int americano,
) {
  // check which of the arguments has the highest value and returns its index
  List<int> scores = [australiano, canadense, britnico, americano];
  int maxScore = scores.reduce(math.max);
  return scores.indexOf(maxScore);
}

List<int> winnerQuizListNumber(
  int australiano,
  int canadense,
  int britnico,
  int americano,
) {
  // return a list of each argument
  return [australiano, canadense, britnico, americano];
}

List<String> winnerQuizListName(
  String australiano,
  String canadense,
  String britnico,
  String americano,
) {
  // return a list of each argument
  return [australiano, canadense, britnico, americano];
}

List<String> habilidadesCanadence() {
  return [
    "Sensível, ",
    "Relacionamentos, ",
    "Time, ",
    "Tradicionalistas, ",
    "Contribuição, ",
    "Busca Harmonia, ",
    "Delega autoridade."
  ];
}

List<String> habilidadesAmericano() {
  return [
    "Senso de urgência,",
    "Ação, ",
    " Iniciativa, ",
    "Impulsivo, ",
    "Prático, ",
    "Vence desafios, ",
    "Aqui e agora, ",
    "Autossuficiente, ",
    "Não delega o poder."
  ];
}

List<String> habilidadesAustraliano() {
  return [
    "Criativo, ",
    "Intuitivo, ",
    "Foco no futuro, ",
    "Distraído, ",
    "Curioso, ",
    "Informal, ",
    "Casual, ",
    "Flexível."
  ];
}

List<String> habilidadesBritnico() {
  return [
    "Detalhista, ",
    "Organizado, ",
    "Estrategista, ",
    "Busca do Conhecimento, ",
    "Pontual, ",
    "Conservador, ",
    "Previsível."
  ];
}

List<String> motivacaoBritnico() {
  return [
    "Organização, ",
    "Visão de passado, presente e futuro, ",
    "Consistência, ",
    "Lealdade, ",
    "Segurança, ",
    "Regras e Responsabilidade."
  ];
}

List<String> melhoriaBritnico() {
  return [
    "Pode impedir o progresso, ",
    "Perfeccionista, ",
    "Dificuldade de se adaptar às mudanças, ",
    "Demasia em Estruturação, ",
    "Procrastinação."
  ];
}

List<String> motivacaoAustraliano() {
  return [
    "Provoca mudanças radicais, ",
    "Criatividade, ",
    "Liberdade para criar, ",
    "Ausência de burocracias, ",
    "Descentralização, ",
    "Flexibilidade, ",
    "Aberto a exceções, ",
    "Delegar."
  ];
}

List<String> melhoriaAustraliano() {
  return [
    "Falta de atenção para o aqui e agora, ",
    "Rebeldia, ",
    "Impaciência, ",
    "Defende o novo pelo novo, ",
    "Esquece dos pequenos detalhes."
  ];
}

List<String> motivacaoCanadense() {
  return [
    "Manter a comunicação harmoniosa, ",
    "Desenvolver e manter a cultura do grupo, ",
    "Comunicação aberta, ",
    "Felicidade, ",
    "Igualdade, ",
    "Segurança, ",
    "Aceitação social, ",
    "Reconhecimento da equipe, ",
    "Ambiente harmônico, ",
    "Trabalho em equipe."
  ];
}

List<String> melhoriaCanadense() {
  return [
    "Esconder conflitos, ",
    "Felicidades imediatas são mais importantes, ",
    "Antes o grupo que eu, ",
    "Falta de foco nos objetivos individuais, ",
    "Manipulação através de sentimentos."
  ];
}

List<String> motivacaoAmericano() {
  return [
    "Fazer acontecer, ",
    "Parar com a burocracia, ",
    "Motivação, ",
    "Liberdade para agir individualmente, ",
    "Resiliência, ",
    "Controle das próprias atividades, ",
    "Competição individual, ",
    "Variedade de atividades, ",
    "Não repetir tarefas."
  ];
}

List<String> melhoriaAmericano() {
//
  return [
    "Socialmente, ",
    "Difícil relacionamento, ",
    "Faz do modo mais fácil."
  ];
}

bool dataPassada(
  DateTime current,
  DateTime selectdate,
) {
  // if selectdate pass current, return false , if selectdate future current, return true
  if (selectdate.isBefore(current)) {
    return false;
  } else {
    return true;
  }
}

bool verifyCancelAula(DateTime? dataAgendado) {
  // if now minus dataAgendado , is minus 1 hours, true, else false
  if (dataAgendado == null) {
    return false;
  }

  DateTime now = DateTime.now();

  Duration offset = now.timeZoneOffset;

  // Adiciona 3 horas ao horário atual para obter 'nowPlus3Hours'.
  DateTime nowPlus3Hours = now.add(Duration(hours: 3)).add(offset);

  DateTime oneHourBefore = nowPlus3Hours.subtract(Duration(hours: 1));

  return dataAgendado.isBefore(oneHourBefore);
}
