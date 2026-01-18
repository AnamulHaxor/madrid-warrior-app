# Madrid Warrior - Flutter App

A production-ready Flutter application for the Real Madrid fan community in Bangladesh.

## Features

### ✅ Core Sections
- **Home**: Breaking news slider, match center, quick access buttons
- **News**: Admin-controlled news management with approve/decline functionality
- **Community**: Embedded Facebook page and group feeds
- **Blood Bank**: Humanitarian donor registration and emergency requests
- **Profile**: User information, settings, notifications

### ✅ Admin Features
- Post approval and decline with mandatory feedback
- Pin important posts
- Content moderation
- User management

### ✅ Technical Features
- Dark/Light mode support
- Facebook SDK integration
- Push notifications ready
- SQLite database
- Material Design 3
- English language support

## Getting Started

### Requirements
- Flutter 3.0+
- Dart 3.0+
- Android SDK (API 21+)

### Installation

```bash
# Clone repository
git clone https://github.com/AnamulHaxor/madrid-warrior-app.git
cd madrid-warrior-app

# Get dependencies
flutter pub get

# Run app
flutter run
```

### Build APK

```bash
flutter build apk --release
```

The APK will be available at: `build/app/outputs/apk/release/app-release.apk`

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/                  # UI screens
│   ├── home_screen.dart
│   ├── news_screen.dart
│   ├── community_screen.dart
│   ├── blood_bank_screen.dart
│   └── profile_screen.dart
├── models/                   # Data models
│   └── models.dart
├── providers/                # State management
│   └── theme_provider.dart
├── services/                 # API & database services
├── widgets/                  # Reusable widgets
├── utils/                    # Utilities
│   └── theme.dart
└── db/                       # Database

```

## Configuration

### Facebook Integration
- Update Facebook App ID in AndroidManifest.xml
- Configure Facebook SDK in build.gradle

### API Endpoints
Update API base URLs in services/api_service.dart

## Admin Panel

Access admin features by logging in with admin credentials.

- Post approval/decline
- Content moderation
- User management
- Statistics dashboard

## Blood Bank Module

"Warrior Blood Bank – A Part of Madrid Warrior™ Community"

- Donor registration
- Blood group and location filters
- Emergency blood requests
- Direct call/WhatsApp integration

## Contributing

This is a closed-source community app. For feature requests or bug reports, contact the admin.

## License

Copyright © 2024 Madrid Warrior. All rights reserved.

## Contact

- Website: https://madridwarrior.com
- Facebook: https://facebook.com/madridwarriorofficial
- Admin: Contact via app
