# Flutter Course

Навчальний проєкт курсу Flutter. Одна програма збирає приклади з усіх тем курсу:
від базових віджетів до роботи з мережею, станом, анімаціями та пуш-сповіщеннями.
Кожна тема — окремий розділ з головним екраном і набором живих прикладів, які
можна відкрити й покрутити прямо в застосунку.

Головний екран (`HomeScreen`) — це меню тем. Навігація між усіма екранами
побудована на `go_router` і зібрана в одному місці — `lib/router/app_router.dart`.

## Запуск

```bash
flutter pub get
flutter run
```

> Проєкт містить приклад інтеграції з Firebase (Cloud Messaging). Конфігураційні
> файли вже додані, тому базові сценарії працюють «з коробки». Для власного
> Firebase-проєкту замініть `firebase_options.dart`, `google-services.json`
> (Android) та `GoogleService-Info.plist` (iOS).

## Структура проєкту

```
lib/
├── main.dart                 # Точка входу: ініціалізація сервісів і запуск застосунку
├── firebase_options.dart     # Згенерована конфігурація Firebase для платформ
│
├── router/                   # Єдина мапа навігації застосунку (go_router)
│   └── app_router.dart
│
├── core/                     # Спільна інфраструктура, не прив'язана до окремої теми
│   ├── firebase/             #   Ініціалізація Firebase та обробка push-повідомлень
│   ├── network/              #   Доступ до API (кілька реалізацій: fake / http / dio / retrofit)
│   └── storage/              #   Локальне сховище: SharedPreferences, secure storage, файли
│
└── features/                 # Теми курсу — кожна у власній папці
    ├── app/                  #   Головний екран-меню та імена маршрутів
    ├── widgets/              #   Базові віджети, кастомні віджети, constraints (part1–part3)
    ├── navigation/           #   Навігація: базова, передача даних, іменовані маршрути
    ├── state_managment/      #   Управління станом: Provider, Cubit, BLoC, типові помилки
    ├── animations/           #   Анімації: implicit (готові) та explicit (контрольовані)
    ├── error_handling/       #   Обробка помилок на прикладі завантаження товарів
    ├── rest_api/             #   REST API: кодування/декодування JSON, DTO ↔ Entity
    ├── top_news/             #   Повний приклад фічі: API → repository → cubit → UI
    ├── storage/              #   Збереження налаштувань і великих даних на пристрої
    └── push_notifications/   #   Локальні та Firebase push-сповіщення
```

### Як влаштована фіча

Складніші теми (`top_news`, `error_handling`) показують типову шарувату архітектуру:

```
feature/
├── data/
│   ├── data_source/   # Отримання «сирих» даних і DTO-моделі (формат API)
│   └── repository/    # Перетворення DTO у Entity та бізнес-правила
└── presentation/
    ├── bloc / cubit   # Стан екрана та логіка переходів між станами
    └── ui             # Віджети екрана
```

Такий поділ показує, навіщо потрібні окремі моделі для API (DTO) і для застосунку
(Entity), і де має жити логіка завантаження та обробки помилок.

## Теми курсу

| Розділ | Що демонструє |
|---|---|
| Widgets | Layout-віджети, кастомні віджети, робота з constraints |
| Navigation | Переходи між екранами, передача та повернення даних, іменовані маршрути |
| State Management | Provider, Cubit і BLoC на прикладі лічильника; типові помилки |
| Animations | Implicit- та explicit-анімації, `AnimationController`, `Tween` |
| Error Handling | Стани завантаження/помилки/успіху та їх відображення в UI |
| REST API | Серіалізація JSON, розділення DTO та Entity |
| Top News | Наскрізний приклад фічі з повною архітектурою data → presentation |
| Storage | SharedPreferences, secure storage, збереження файлів |
| Push Notifications | Локальні сповіщення та інтеграція з Firebase Cloud Messaging |
