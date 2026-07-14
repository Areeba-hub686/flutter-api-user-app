# Flutter API User App 🚀

![Flutter](https://img.shields.io/badge/Flutter-Mobile%20Development-blue)
![Dart](https://img.shields.io/badge/Dart-Programming%20Language-blue)
![API](https://img.shields.io/badge/API-REST%20Integration-green)

A Flutter mobile application that demonstrates REST API integration, asynchronous data handling, JSON parsing, and clean user interface development.

The application fetches user information from a remote API, converts JSON responses into Dart objects, and presents user data through an interactive user listing screen and detailed profile interface.

---

# 📱 About The Project

**Flutter API User App** is a mobile application built with Flutter to demonstrate practical concepts of API-based application development.

The project focuses on:

- Consuming REST APIs
- Handling JSON responses
- Creating structured Dart models
- Managing asynchronous operations
- Building responsive user interfaces
- Organizing Flutter application code efficiently

---

# ✨ Features

## 👥 User Listing

- Fetches users from a REST API
- Displays users in clean card-based layouts
- Shows user name, email, and username
- Interactive user cards with profile navigation


## 👤 User Profile

- Detailed profile screen for individual users
- Displays:
  - Username
  - Email
  - Phone number
  - Website
- Dynamic profile avatar generation
- Hero animation transition between screens


## 🌐 REST API Integration

- HTTP-based API communication
- JSON response processing
- Converts API data into Dart objects
- Organized API service layer
- Handles failed requests with user-friendly error messages


## 🔄 User Experience

- Animated splash screen
- Loading state while retrieving data
- Error handling interface
- Retry functionality after failed requests
- Pull-to-refresh user data
- Empty state handling


## 🎨 UI Design

- Custom teal and cyan color theme
- Gradient app bars
- Rounded card layouts
- Modern profile header
- Clean spacing and typography
- Responsive mobile interface

---

# 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| Flutter | Cross-platform mobile development |
| Dart | Application programming language |
| HTTP Package | API communication |
| REST API | Remote data fetching |
| JSON | Data serialization |
| Flutter Widgets | User interface development |

---

# 🏗️ Project Structure

```
lib/
│
├── models/
│   └── user_model.dart          # User data model and JSON conversion
│
├── services/
│   └── api_service.dart         # REST API communication
│
├── screens/
│   ├── splash_screen.dart       # Animated splash screen
│   ├── home_screen.dart         # User listing screen
│   └── profile_screen.dart      # User details screen
│
└── main.dart                    # Application entry point
```

---

# 🔌 API Integration

This project uses:

```
https://jsonplaceholder.typicode.com/users
```

### Data Flow

```
REST API
      ↓
HTTP GET Request
      ↓
JSON Response
      ↓
Dart Model Conversion
      ↓
Flutter UI Rendering
```

---

# ⚙️ Application Flow

```
Application Launch
        ↓
Animated Splash Screen
        ↓
Fetch Users From API
        ↓
Display User List
        ↓
Select User Profile
        ↓
View Detailed Information
```

---

# 📚 Concepts Demonstrated

This project demonstrates:

- REST API integration in Flutter
- HTTP requests
- JSON decoding
- Dart factory constructors
- Object-oriented programming
- Future and async/await
- Stateful widgets
- Widget composition
- Navigation between screens
- Hero animations
- Loading and error state management
- Custom UI development

---

# 🚀 Getting Started

## Prerequisites

Make sure you have:

- Flutter SDK installed
- Android Studio or VS Code
- Android emulator or physical device

Check Flutter setup:

```bash
flutter doctor
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/Areeba-hub686/flutter-api-user-app.git
```

Navigate to the project directory:

```bash
cd flutter-api-user-app
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

# 🔮 Future Improvements

Possible enhancements:

- Add user search functionality
- Add favorite users feature
- Implement local data caching
- Add offline support
- Add pagination for large datasets
- Improve API loading animations
- Implement state management using Provider, Riverpod, or BLoC
- Add unit and widget testing

---

# 👨‍💻 Developer

**Areeba Fatima**

GitHub:  
https://github.com/Areeba-hub686




