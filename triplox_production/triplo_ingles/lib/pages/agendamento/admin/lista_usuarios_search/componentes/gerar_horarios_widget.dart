import 'package:flutter/material.dart';

class GerarHorariosWidget extends StatefulWidget {
  const GerarHorariosWidget({super.key});

  @override
  State<GerarHorariosWidget> createState() => _GerarHorariosWidgetState();
}

class _GerarHorariosWidgetState extends State<GerarHorariosWidget> {
  final List<String> dias = [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
    'Domingo'
  ];

  final Map<String, List<Map<String, String>>> horarios = {};

  @override
  void initState() {
    super.initState();
    for (var dia in dias) {
      horarios[dia] = [
        {'inicio': '08:00', 'fim': '09:00'}
      ];
    }
  }

  void adicionarHorario(String dia) {
    setState(() {
      horarios[dia]!.add({'inicio': '08:00', 'fim': '09:00'});
    });
  }

  void removerHorario(String dia, int index) {
    setState(() {
      horarios[dia]!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Selecione os dias e horários de Funcionamento',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ...dias.map((dia) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dia,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    ...List.generate(horarios[dia]!.length, (index) {
                      return Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: horarios[dia]![index]['inicio'],
                              dropdownColor: Colors.black,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[900],
                                border: OutlineInputBorder(),
                              ),
                              items: _gerarHorariosLista(),
                              onChanged: (value) {
                                setState(() {
                                  horarios[dia]![index]['inicio'] = value!;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '-',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: horarios[dia]![index]['fim'],
                              dropdownColor: Colors.black,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[900],
                                border: OutlineInputBorder(),
                              ),
                              items: _gerarHorariosLista(),
                              onChanged: (value) {
                                setState(() {
                                  horarios[dia]![index]['fim'] = value!;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            onPressed: () => removerHorario(dia, index),
                            icon: Icon(Icons.delete, color: Colors.white),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () => adicionarHorario(dia),
                      child: Text('+ Adicionar Horário',
                          style: TextStyle(color: Colors.blueAccent)),
                    ),
                    Divider(color: Colors.grey),
                  ],
                ),
              );
            }).toList(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ação final
                  print(horarios);
                },
                child: Text('Concluído'),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _gerarHorariosLista() {
    List<String> horariosLista = [];
    for (int h = 0; h < 24; h++) {
      for (int m = 0; m < 60; m += 15) {
        final hora = '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
        horariosLista.add(hora);
      }
    }
    return horariosLista
        .map((hora) => DropdownMenuItem(
              value: hora,
              child: Text(hora),
            ))
        .toList();
  }
}
