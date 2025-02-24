<p align="center">
  <img src="https://private-user-images.githubusercontent.com/86840994/416116811-5125ccf4-5ed5-4763-8da9-1a49a37656a2.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDAzODczNjYsIm5iZiI6MTc0MDM4NzA2NiwicGF0aCI6Ii84Njg0MDk5NC80MTYxMTY4MTEtNTEyNWNjZjQtNWVkNS00NzYzLThkYTktMWE0OWEzNzY1NmEyLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAyMjQlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMjI0VDA4NTEwNlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWQ1ZjFkZjJkZDM4MTUxNzEzN2VkYzNiNGJmZTYyNWJkNjVjNGRlOWE5NzE5N2FjMGQ2MTNjOTdmNGFiMzk3ZmQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.LThAFT6HpN1W5a5k6lvmFuWPMP1NOx7Ou29VjXSlk7c" height="150" alt="auto_route_logo">
</p>

<p align="center" style="font-size: 20px; font-weight: bold; margin: 0 auto; width: 80%; margin-bottom: 10px;">
More powerful when working with FCM.
</p>

<p align="center">
  <a href="https://buymeacoffee.com/techmind" target="_blank">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="30px" width= "108px">
  </a>
</p>

### The plugin has been upgraded and extended with additional features for working with FCM (Firebase Cloud Messaging). It supports deleting all notifications or specific ones using TAGs and setting the badge count on iOS.

## 🔧 Installation

Add the library to `pubspec.yaml`:

```yaml
dependencies:
  fcm_eraser_plus: latest_version
```

Then, run:

```sh
flutter pub get
```

## ✨ Supported Features

| Feature                                                        | Android   | iOS   | Description                                                  |
| -------------------------------------------------------------- | --------- | ----- | -------------                                                |
| [Clear all notifications](#1️⃣-clear-all-notifications)         | ✅        | ✅    | Removes all active notifications from the system tray.      |
| [Clear notification by TAGS](#2️⃣-clear-notification-by-tags)     | ✅        | ✅    | Delete multiple notifications using a list of their tag identifiers. |
| [Set badge count](#3️⃣-set-badge-count-on-ios)               | ❌        | ✅    | Sets the badge number on the app icon for iOS.               |
| [Get active tag notifications](#4️⃣-get-active-tag-notifications) | ✅        | ✅    | Get the list of tags for active notifications.  |

## 📌 Usage Guide

### **1️⃣ Clear All Notifications**

```dart
import 'package:fcm_eraser_plus/fcm_eraser_plus.dart';

  Future<void> clearAll() async {
    await FcmEraserPlus.instance.clearAllNotifications();
  }
```

### **2️⃣ Clear Notification by TAGS**

```dart
  Future<void> clearByTags({required List<String> tags}) async {
    await FcmEraserPlus.instance.clearByTags(tags: tags);
  }
```

### **3️⃣ Set Badge Count on iOS**

<span>Set <b style="font-size: 16px;">isClear = true</b> to delete all active notifications simultaneously. Set it to <b style="font-size: 16px;">false</b> to skip.</span>

```dart
  Future<void> setBadge({required int count, bool isClear = true}) async {
    await FcmEraserPlus.instance.setBadge(count: count, isClear: isClear);
  }
```

### **4️⃣ Get Active Tag Notifications**

```dart
  Future<void> getActiveTags() async {
    final activeTags = await FcmEraserPlus.instance.getActiveTags();

    log('Active tags:\n$activeTags');
  }
```

## 📡 Sending FCM Messages

Easily send Firebase Cloud Messages (FCM) to your app using the steps below:

### 📥 Step 1: Setup Firebase Admin SDK
Download a service account key (JSON file) from your Firebase console and place it inside the `example/lib/fcm_admin` directory.

```javascript
var serviceAccount = require('./service-acc.json');
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});
```

### 🔑 Step 2: Get Your Device Token
Run your Flutter app (`flutter run`) and copy the device token printed in the console:

```javascript
const token = 'YOUR_FCM_TOKEN';
```

### 📦 Step 3: Install Dependencies
Navigate to the `example/lib/fcm_admin` directory and install the required Node.js dependencies:

```sh
npm install
```

### 🚀 Step 4: Send a Test Notification
Run the following command from the `example/scripts` directory to send a message to your app:

```sh
npm run send-message
```

Your app will receive messages in all states: **background, or terminated**.

> **Note:** If messages stop arriving, the platform may be throttling them. iOS, in particular, has strict throttling policies.

## 📜 License

This library is released under the **MIT** license. You can view the full license text [here](https://github.com/AnhPhon/fcm_eraser_plus/blob/master/LICENSE).



