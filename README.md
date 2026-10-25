# Mobile Game Tracker

A Flutter application for organizing and tracking a personal video game library. This project was developed as part of mobile development coursework.

## Features

- **Dashboard:** overview of the library, including game count, total playtime, platforms and average rating.
- **Random suggestion:** choose a game from the library when you are not sure what to play.
- **Library:** browse the available games and open their details.
- **Game details:** view a game's information and adjust its recorded playtime and rating.
- **Statistics:** view total playtime, average ratings and a chart of hours played per game.

The current application interface is in Portuguese.

## Tech stack

- [Flutter](https://flutter.dev/) and Dart
- Material Design widgets
- [fl_chart](https://pub.dev/packages/fl_chart) for charts
- [google_fonts](https://pub.dev/packages/google_fonts) for typography
- JSON bundled as an application asset for the initial game catalogue
- Git and GitHub for version control and collaboration
- GitHub Actions for continuous integration (CI)

## Requirements

Install the following tools before running the project:

- Flutter SDK on the stable channel, with the Dart SDK included
- Git
- A supported platform toolchain for the target you want to run or build
- Java 21 for the Android build workflow

Check your Flutter installation and available toolchains with:

```bash
flutter doctor
```

## Getting started

Clone the repository and enter the project directory:

```bash
git clone https://github.com/gfloriano11/mobile-game-tracker.git
cd mobile-game-tracker
```

Install the Dart and Flutter dependencies:

```bash
flutter pub get
```

Run the application on a connected device, emulator or supported desktop target:

```bash
flutter run
```

List available targets with:

```bash
flutter devices
```

## Development checks

Run the same analysis and test commands used by the CI workflow:

```bash
flutter analyze
flutter test
```

## Build commands

The repository's CI workflow currently builds Android, Windows and Web targets. You can run the corresponding build commands locally:

```bash
# Android APK
flutter build apk --release

# Windows desktop
flutter build windows

# Web
flutter build web
```

Platform-specific setup may be required for Windows desktop and Android builds. See the [Flutter documentation](https://docs.flutter.dev/) for installation and platform setup instructions.

## Project structure

```text
lib/
├── app/          # Application setup and JSON loading
├── models/       # Game model
├── screens/      # Dashboard, library, game details and statistics
├── widgets/      # Reusable UI components
└── main.dart     # Application entry point

assets/
├── games.json    # Initial game data
└── games/        # Game images

test/               # Automated tests
.github/
├── ISSUE_TEMPLATE/ # Issue templates
└── workflows/      # GitHub Actions workflows
```

## Data and current limitations

- The initial catalogue is loaded from `assets/games.json`; game images are bundled in `assets/games/`.
- The project currently uses local asset data and does not provide a backend, account system or remote database.
- Changes to playtime and ratings are held in application memory. They are not persisted after the app is restarted.
- The Store page is being developed separately and is not described as an available feature until it is integrated into the application.
- Automated release artifact publication and continuous delivery (CD) are not configured yet.

## Contribution and change workflow

The project uses GitHub Issues to track work and Pull Requests (PRs) to review changes.

1. Create or select an Issue describing the feature, bug or task.
2. Create a short-lived branch. Use prefixes such as `feat/`, `fix/` or `docs/` (for example, `feat/store-page`).
3. Make the change and run the relevant analysis and tests.
4. Open a PR, link the related Issue when applicable, and request a peer review.
5. Merge after the required review and automated checks have passed, according to the repository's active rules.

## Continuous integration

The GitHub Actions workflow in `.github/workflows/ci.yaml` runs on pushes and on Pull Requests targeting `main` or `dev`. It:

- Installs project dependencies with `flutter pub get`
- Runs `flutter analyze`
- Runs `flutter test`
- Builds the Android APK, Windows desktop application and Web application

The workflow validates and builds the project, but it does **not** currently publish build artifacts or create GitHub Releases. Those steps remain future work; this repository does not currently have a configured CD pipeline.

## License

No license has been specified for this repository yet.
