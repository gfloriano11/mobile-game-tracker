# Mobile Game Tracker

Aplicativo desenvolvido em Flutter para organizar e acompanhar uma biblioteca pessoal de jogos. O projeto faz parte das atividades acadêmicas de desenvolvimento mobile.

## Funcionalidades

- **Início:** resumo da biblioteca, com quantidade de jogos, horas jogadas, plataformas e média das avaliações.
- **Sugestão de jogo:** sorteia um jogo da biblioteca para ajudar a decidir o que jogar.
- **Biblioteca:** permite visualizar os jogos cadastrados e acessar seus detalhes.
- **Detalhes do jogo:** exibe informações do jogo e permite ajustar as horas jogadas e a avaliação registrada.
- **Estatísticas:** apresenta o total de horas jogadas, a média das avaliações e um gráfico de horas por jogo.

A interface atual do aplicativo está em português.

## Tecnologias

- [Flutter](https://flutter.dev/) e Dart
- Widgets do Material Design
- [fl_chart](https://pub.dev/packages/fl_chart) para gráficos
- [google_fonts](https://pub.dev/packages/google_fonts) para tipografia
- Arquivo JSON incluído nos assets para carregar o catálogo inicial de jogos
- Git e GitHub para controle de versão e colaboração
- GitHub Actions para integração contínua (CI)

## Pré-requisitos

Antes de executar o projeto, instale:

- Flutter SDK no canal stable, que inclui o SDK do Dart
- Git
- As ferramentas de desenvolvimento necessárias para a plataforma em que pretende executar ou compilar o aplicativo
- Java 21 para o workflow de build Android

Verifique a instalação do Flutter e as ferramentas disponíveis com:

```bash
flutter doctor
```

## Como executar

Clone o repositório e entre na pasta do projeto:

```bash
git clone https://github.com/gfloriano11/mobile-game-tracker.git
cd mobile-game-tracker
```

Instale as dependências:

```bash
flutter pub get
```

Execute o aplicativo em um dispositivo conectado, emulador ou plataforma desktop compatível:

```bash
flutter run
```

Para listar os dispositivos e destinos disponíveis:

```bash
flutter devices
```

## Análise e testes

Execute os mesmos comandos de análise estática e testes utilizados pelo CI:

```bash
flutter analyze
flutter test
```

## Compilação

O workflow de CI compila atualmente as versões Android, Windows e Web. Os comandos correspondentes são:

```bash
# APK para Android
flutter build apk --release

# Aplicativo desktop para Windows
flutter build windows

# Aplicativo Web
flutter build web
```

A compilação pode exigir configurações específicas da plataforma. Consulte a [documentação oficial do Flutter](https://docs.flutter.dev/) para obter instruções de instalação e configuração.

## Estrutura do projeto

```text
lib/
├── app/          # Configuração do aplicativo e carregamento do JSON
├── models/       # Modelo de jogo
├── screens/      # Início, biblioteca, detalhes e estatísticas
├── widgets/      # Componentes reutilizáveis da interface
└── main.dart     # Ponto de entrada do aplicativo

assets/
├── games.json    # Dados iniciais dos jogos
└── games/        # Imagens dos jogos

test/               # Testes automatizados
.github/
├── ISSUE_TEMPLATE/ # Modelos de Issues
└── workflows/      # Workflows do GitHub Actions
```

## Dados e limitações atuais

- O catálogo inicial é carregado de `assets/games.json`; as imagens dos jogos ficam em `assets/games/`.
- O projeto utiliza dados locais e ainda não possui backend, sistema de contas ou banco de dados remoto.
- As alterações nas horas jogadas e nas avaliações ficam apenas na memória durante a execução. Elas não são persistidas após reiniciar o aplicativo.
- A página Store está sendo desenvolvida separadamente e não é descrita como funcionalidade disponível antes de ser integrada ao aplicativo.
- A publicação automatizada de artefatos e a entrega contínua (CD) ainda não estão configuradas.

## Fluxo de contribuição

O projeto utiliza GitHub Issues para organizar o trabalho e Pull Requests (PRs) para revisar as alterações.

1. Crie ou selecione uma Issue que descreva a funcionalidade, correção ou tarefa.
2. Crie uma branch de curta duração. Utilize prefixos como `feat/`, `fix/` ou `docs/` (por exemplo, `feat/store-page`).
3. Implemente a alteração e execute a análise e os testes pertinentes.
4. Abra um PR, vincule a Issue relacionada quando aplicável e solicite a revisão de um colega.
5. Faça o merge após a revisão e a aprovação das verificações automatizadas, respeitando as regras ativas do repositório.

## Integração contínua (CI)

O workflow do GitHub Actions em `.github/workflows/ci.yaml` é executado em pushes e em Pull Requests direcionados às branches `main` ou `dev`. Ele:

- Instala as dependências com `flutter pub get`
- Executa `flutter analyze`
- Executa `flutter test`
- Compila o APK Android, o aplicativo desktop para Windows e a versão Web

O workflow valida e compila o projeto, mas **não** publica artefatos de build nem cria GitHub Releases. Essas etapas permanecem como trabalho futuro; o repositório ainda não possui um pipeline de CD configurado.

## Licença

Nenhuma licença foi especificada para este repositório até o momento.
