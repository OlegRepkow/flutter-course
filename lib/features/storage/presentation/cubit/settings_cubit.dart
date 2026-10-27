import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/core/storage/prefs_storage/prefs_storage.dart';
import 'package:flutter_lab/core/storage/secure_storage/secure_storage.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.prefs, this.secureStorage)
    : super(
        SettingsState(
          disabledFeatures: prefs.getDisabledFeatures(),
          isSettingsLocked: false,
        ),
      ) {
    _initializeLockStatus();
  }

  final PrefsStorage prefs;
  final SecureStorage secureStorage;

  Future<void> _initializeLockStatus() async {
    final hasPin = await secureStorage.hasSettingsPin();

    emit(state.copyWith(isSettingsLocked: hasPin));
  }

  void toggleFeature({required String lesson, required bool isEnabled}) {
    final updatedSet = {...state.disabledFeatures};

    isEnabled ? updatedSet.remove(lesson) : updatedSet.add(lesson);

    prefs.setDisabledFeatures(updatedSet);

    emit(state.copyWith(disabledFeatures: updatedSet));
  }

  Future<void> enableLockedMode(int pin) async {
    await secureStorage.saveSettingsPin(pin);

    emit(state.copyWith(isSettingsLocked: true));
  }

  Future<void> disableLockedMode(int pin) async {
    final storedPin = await secureStorage.getSettingsPin();

    if (storedPin == pin) {
      await secureStorage.removeSettingsPin();

      emit(state.copyWith(isSettingsLocked: false));
    }
  }
}

class SettingsState extends Equatable {
  const SettingsState({
    required this.disabledFeatures,
    required this.isSettingsLocked,
  });

  bool isFeatureEnabled(String feature) => !disabledFeatures.contains(feature);

  final Set<String> disabledFeatures;
  final bool isSettingsLocked;

  SettingsState copyWith({
    Set<String>? disabledFeatures,
    bool? isSettingsLocked,
  }) => SettingsState(
    disabledFeatures: disabledFeatures ?? this.disabledFeatures,
    isSettingsLocked: isSettingsLocked ?? this.isSettingsLocked,
  );

  @override
  List<Object?> get props => [disabledFeatures, isSettingsLocked];
}
