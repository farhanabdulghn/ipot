# iPot

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Platform](https://img.shields.io/badge/Platform-Android-green)
![License](https://img.shields.io/badge/License-MIT-orange)

A modern Flutter-based ordering application designed to simplify table ordering and customer interactions through QR code scanning.

## Features

- QR table scanning
- Digital ordering system
- Multi-language support (l10n)
- Responsive UI
- Riverpod state management
- API integration
- Real-time order handling

## Tech Stack

- Flutter
- Dart
- Riverpod
- REST API
- WebSocket

## Getting Started

### Prerequisites

Make sure you have installed:

- Flutter SDK
- Dart SDK
- Android Studio or VS Code

### Installation

Clone the repository:

```bash
git clone <repository-url>
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## API Collection

Download the Postman collection below:

- [IPOT Backend API Collection](./IPOT%20Backend%20API.postman_collection.json)

Backend repository:

- https://github.com/farhanabdulghn/ipot-backend

## QR Table

Example QR table for customer table scanning:

### Table T001

<img src="./T001.png" alt="Table T001 QR" width="250" />

## Project Structure

```text
lib/
├── api/
├── components/
├── extensions/
├── l10n/
├── screens/
├── state/
├── utils/
└── main.dart
```

## License

This project is licensed under the MIT License.
