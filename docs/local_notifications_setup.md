# Налаштування Local Notifications на Android (Flutter)

Покрокова інструкція на основі пакету `flutter_local_notifications: ^21.0.0`.

---

## Крок 1. Додати залежності

```yaml
# pubspec.yaml
dependencies:
  flutter_local_notifications: ^21.0.0
  timezone: ^0.11.0  # потрібен для scheduled notifications
```

```bash
flutter pub get
```

---

## Крок 2. Налаштувати Gradle

Відкрийте папку `android/app/` і подивіться, який файл у вас є: `build.gradle` чи `build.gradle.kts`. Це два різних формати — Groovy та Kotlin DSL відповідно. Синтаксис відрізняється, тому використовуйте приклад саме для вашого файлу.

### Якщо у вас `android/app/build.gradle` (Groovy):

Додайте/змініть наступне в блоці `android`:

```groovy
android {
    compileOptions {
        coreLibraryDesugaringEnabled true
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // ...
        multiDexEnabled true
    }
}

dependencies {
    coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:2.1.4'
    implementation 'androidx.window:window:1.0.0'
    implementation 'androidx.window:window-java:1.0.0'
}
```

### Якщо у вас `android/app/build.gradle.kts` (Kotlin DSL):

```kotlin
android {
    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // ...
        multiDexEnabled = true
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("androidx.window:window:1.0.0")
    implementation("androidx.window:window-java:1.0.0")
}
```

### Оновлення версії Gradle

Відкрийте `android/gradle/wrapper/gradle-wrapper.properties` і переконайтесь, що версія Gradle 8.13 або вище:

```properties
distributionUrl=https\://services.gradle.org/distributions/gradle-8.13-all.zip
```

### Оновлення Android Gradle Plugin

Відкрийте файл `android/settings.gradle` (або `settings.gradle.kts`) і оновіть версію плагіну.

Якщо у вас `settings.gradle` (Groovy):

```groovy
plugins {
    id 'com.android.application' version '8.11.1' apply false
}
```

Якщо у вас `settings.gradle.kts` (Kotlin DSL):

```kotlin
plugins {
    id("com.android.application") version "8.11.1" apply false
}
```

---

## Крок 3. Налаштувати AndroidManifest.xml

`android/app/src/main/AndroidManifest.xml`

### Permissions (між тегами `<manifest>`):

```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />
```

### Receivers (між тегами `<application>`):

```xml
<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver" />
<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED"/>
        <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
        <action android:name="android.intent.action.QUICKBOOT_POWERON" />
        <action android:name="com.htc.intent.action.QUICKBOOT_POWERON"/>
    </intent-filter>
</receiver>
```

- `ScheduledNotificationReceiver` — відповідає за показ запланованої нотифікації
- `ScheduledNotificationBootReceiver` — перепланує нотифікації після перезавантаження пристрою

---

## Крок 4. Ініціалізація плагіну

```dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Ініціалізація timezone
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Europe/Kiev'));

  // 2. Налаштування плагіну
  const initializationSettingsAndroid = AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );

  const initializationSettingsDarwin = DarwinInitializationSettings();

  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  // 3. Запит дозволів (Android 13+)
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.requestNotificationsPermission();

  // 4. Запит дозволу на exact alarms (Android 14+)
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.requestExactAlarmsPermission();

  // 5. Ініціалізація
  await flutterLocalNotificationsPlugin.initialize(
    settings: initializationSettings,
  );

  runApp(const MyApp());
}
```

---

## Крок 5. Показати звичайну нотифікацію

```dart
Future<void> showNotification() async {
  const androidNotificationDetails = AndroidNotificationDetails(
    'support',                          // channel id
    'Support channel',                  // channel name
    channelDescription: 'Support channel description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  const notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    id: 1,
    title: 'Заголовок',
    body: 'Текст нотифікації',
    notificationDetails: notificationDetails,
  );
}
```

---

## Крок 6. Показати відкладену (scheduled) нотифікацію

```dart
import 'package:timezone/timezone.dart' as tz;

Future<void> showScheduledNotification() async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    id: 3333,
    title: 'Scheduled title',
    body: 'Scheduled body',
    scheduledDate: tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
    notificationDetails: const NotificationDetails(
      android: AndroidNotificationDetails(
        'support',
        'Support channel',
        channelDescription: 'Support channel description',
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  );
}
```

### Параметри `androidScheduleMode`:
| Режим | Опис |
|-------|------|
| `exactAllowWhileIdle` | Точний час, навіть у Doze mode |
| `exact` | Точний час, але не в Doze mode |
| `inexact` | Приблизний час (не потребує SCHEDULE_EXACT_ALARM) |
| `inexactAllowWhileIdle` | Приблизний час, навіть у Doze mode |

---

## Важливі нюанси

1. **Timezone** — `zonedSchedule` працює з `TZDateTime`, а не зі звичайним `DateTime`. Обов'язково ініціалізуй timezone перед використанням.

2. **Exact Alarms на Android 14+** — потрібен дозвіл `SCHEDULE_EXACT_ALARM` + виклик `requestExactAlarmsPermission()`. Без цього scheduled нотифікації не спрацюють.

3. **OEM обмеження** — на Xiaomi, Huawei та інших пристроях scheduled нотифікації можуть не працювати у фоні через агресивне вбивання процесів. Див. [dontkillmyapp.com](https://dontkillmyapp.com).

4. **iOS ліміт** — максимум 64 запланованих нотифікації одночасно.

5. **Channel ID** — на Android 8.0+ звук та вібрація прив'язані до каналу і встановлюються лише при першому створенні каналу.



# Налаштування Local Notifications на iOS (Flutter)

Майже все вже налаштовано. Просто додайте в AppDelegate.swift


UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate


Приклад

override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate // <-- Додайте ось цю стрічку коду
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }