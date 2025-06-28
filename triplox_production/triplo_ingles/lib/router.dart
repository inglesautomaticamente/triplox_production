import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth/firebase_auth/auth_util.dart';
import 'flutter_flow/app_state.dart';

// Importação das páginas
import '/done/agendamentos/agendamentos_widget.dart';
import '/done/agend_a33/agend_a33_widget.dart';
import '/done/alteraremail/alteraremail_widget.dart';
import '/done/cadastrode_aluno_teste/cadastrode_aluno_teste_widget.dart';
import '/done/cadastrode_aluno_teste_copy/cadastrode_aluno_teste_copy_widget.dart';
import '/done/cadastro_professor/cadastro_professor_widget.dart';
import '/done/confimaula/confimaula_widget.dart';
import '/done/histualas/histaulas_widget.dart';
import '/done/home/home_widget.dart';
import '/done/lista_logs/lista_logs_widget.dart';
import '/done/lista_usuarios/lista_usuarios_widget.dart';
import '/done/login/login_widget.dart';
import '/done/perfil/perfil_widget.dart';
import '/done/planos/planos_widget.dart';
import '/done/precompra/precompra_widget.dart';
import '/done/transferir/transferir_widget.dart';

// Importar a página do menu
import '/menu_page.dart';

// Importar a página de busca de usuários
import '/pages/admin/lista_usuarios_search/search_usuarios_widget.dart';

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/menu',
      refreshListenable: appStateNotifier,
      routes: [
        GoRoute(
          name: 'menu',
          path: '/menu',
          builder: (context, state) => MenuPage(),
        ),
        GoRoute(
          name: 'agendamentos',
          path: '/agendamentos',
          builder: (context, state) => AgendamentosWidget(),
        ),
        GoRoute(
          name: 'AgendA33',
          path: '/agendaa2',
          builder: (context, state) => AgendA33Widget(),
        ),
        GoRoute(
          name: 'alteraremail',
          path: '/alteraremail',
          builder: (context, state) => AlteraremailWidget(),
        ),
        GoRoute(
          name: 'CadastrodeAlunoTeste',
          path: '/cadastrodeAlunoTeste',
          builder: (context, state) => CadastrodeAlunoTesteWidget(),
        ),
        GoRoute(
          name: 'CadastrodeAlunoTesteCopy',
          path: '/cadastrodeAluno',
          builder: (context, state) => CadastrodeAlunoTesteCopyWidget(),
        ),
        GoRoute(
          name: 'CadastroProfessor',
          path: '/cadastroProfessorAcessoRestrito',
          builder: (context, state) => CadastroProfessorWidget(),
        ),
        GoRoute(
          name: 'confimaula',
          path: '/confimaula',
          builder: (context, state) => ConfimaulaWidget(),
        ),
        GoRoute(
          name: 'histaulas',
          path: '/histaulas',
          builder: (context, state) => HistaulasWidget(),
        ),
        GoRoute(
          name: 'home',
          path: '/home2',
          builder: (context, state) => HomeWidget(),
        ),
        GoRoute(
          name: 'ListaLogs',
          path: '/listaLogs',
          builder: (context, state) => ListaLogsWidget(),
        ),
        GoRoute(
          name: 'ListaUsuarios',
          path: '/listaUsuarios',
          builder: (context, state) => ListaUsuariosWidget(),
        ),
        GoRoute(
          name: 'Login',
          path: '/login',
          builder: (context, state) => LoginWidget(),
        ),
        GoRoute(
          name: 'perfil',
          path: '/perfil',
          builder: (context, state) => PerfilWidget(),
        ),
        GoRoute(
          name: 'Planos',
          path: '/planos',
          builder: (context, state) => PlanosWidget(),
        ),
        GoRoute(
          name: 'Precompra',
          path: '/precompra',
          builder: (context, state) => PrecompraWidget(),
        ),
        GoRoute(
          name: 'Transferir',
          path: '/fffftransferir0000000',
          builder: (context, state) => TransferirWidget(),
        ),
        GoRoute(
          name: 'SearchUsuarios',
          path: '/searchUsuarios',
          builder: (context, state) => SearchUsuariosWidget(),
        ),
      ],
    );
