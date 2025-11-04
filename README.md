# Gaadhi Hel

A cross-platform vehicle management helper application built with Flutter. Gaadhi Hel helps users manage their vehicles, track important information, and streamline day-to-day transportation tasks across mobile and desktop platforms.

## Features
- Cross-platform: Android, iOS, Web, Windows, macOS, Linux
- Clean, responsive UI
- Vehicle information management
- Fast and reliable Flutter tooling

## Getting Started
Follow the steps below to set up the project locally.

### Prerequisites
- Flutter SDK (includes Dart)
- Android Studio, Xcode, or VS Code for platform-specific development
- Supported device/emulator/simulator for your target platform

Verify Flutter is installed and configured:
```bash
flutter --version
flutter doctor
```

### Installation
```bash
git clone https://github.com/hamse122/Gadhi_Hel-.git
cd Gadhi_Hel-
flutter pub get
```

### Run
- Android / iOS (device/emulator):
```bash
flutter run
```
- Web (Chrome):
```bash
flutter run -d chrome
```
- Windows / macOS / Linux (where enabled):
```bash
flutter run -d windows   # or macos / linux
```

## Project Structure
- `lib/`: Dart source code
- `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/`: Platform projects
- `test/`: Unit and widget tests

## Scripts
Common Flutter commands you may find useful:
```bash
flutter clean
flutter test
flutter build apk        # Android
flutter build ios        # iOS (on macOS)
flutter build web        # Web
```

## Contributing
Contributions are welcome. To get started:
1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "feat: add your feature"`
4. Push to your fork: `git push origin feature/your-feature`
5. Open a pull request

Please follow the existing code style and include relevant tests where possible.

## License
This project is licensed under the MIT License. See the [`LICENSE`](LICENSE) file for details.


