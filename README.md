# iPot

![Flutter](https://img.shields.io/badge/Flutter-3.41.9-blue?logo=flutter)
![Platform](https://img.shields.io/badge/Platform-Android-green)
![License](https://img.shields.io/badge/License-MIT-orange)

A modern Flutter-based ordering application designed to simplify restaurant table ordering through QR code scanning, real-time order updates, and a seamless digital menu experience.

## Features

- QR table scanning
- Digital restaurant menu
- Cart and order management
- Real-time order updates with Pusher
- Multi-language support (l10n)
- Responsive UI
- Riverpod state management
- REST API integration
- Railway backend deployment

## Tech Stack

### Core

- Flutter 3.41.9
- Dart
- Riverpod
- REST API
- WebSocket
- Railway

### Main Packages

| Package | Purpose |
|---|---|
| `flutter_riverpod` | State management |
| `riverpod_annotation` | Riverpod code generation |
| `freezed` / `freezed_annotation` | Immutable model generation |
| `json_serializable` / `json_annotation` | JSON serialization |
| `dio` | HTTP client |
| `mobile_scanner` | QR code scanning |
| `phosphor_flutter` | Icon library |
| `cached_network_image` | Network image caching |
| `pusher_channels_flutter` | Real-time communication |
| `google_fonts` | Custom typography |
| `intl` | Internationalization |

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

## Application Flow

1. Scan the QR code on the table.
2. Browse the available restaurant menu.
3. Add menu items to the cart.
4. Review selected items inside the cart screen.
5. Place and monitor orders in real-time.
6. Receive live updates powered by Pusher.

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
