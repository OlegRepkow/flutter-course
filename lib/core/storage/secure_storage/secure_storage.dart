import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'secure_storage_keys.dart';

class SecureStorage {
  SecureStorage._();

  static final SecureStorage instance = SecureStorage._();

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  final _secureStorage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: SecureStorageKeys.token, value: token);
  }

  Future<String> getToken() async {
    return await _secureStorage.read(key: SecureStorageKeys.token) ?? '';
  }

  Future<void> saveSettingsPin(int pin) async {
    await _secureStorage.write(
      key: SecureStorageKeys.settingsPin,
      value: pin.toString(),
    );
  }

  Future<int?> getSettingsPin() async {
    final pinString = await _secureStorage.read(
      key: SecureStorageKeys.settingsPin,
    );
    if (pinString != null && pinString.isNotEmpty) {
      return int.tryParse(pinString);
    }
    return null;
  }

  Future<bool> hasSettingsPin() async {
    final pin = await getSettingsPin();
    return pin != null;
  }

  Future<void> removeSettingsPin() async {
    await _secureStorage.delete(key: SecureStorageKeys.settingsPin);
  }
}
