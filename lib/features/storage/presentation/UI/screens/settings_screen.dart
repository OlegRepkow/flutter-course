import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/app/screens/home_screen.dart';
import 'package:flutter_lab/features/storage/presentation/UI/widgets/pin_dialog.dart';
import 'package:flutter_lab/features/storage/presentation/cubit/settings_cubit.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocSelector<SettingsCubit, SettingsState, bool>(
              selector: (state) => state.isSettingsLocked,
              builder: (context, isLocked) => SwitchListTile(
                title: const Text('🔒 Lock Settings'),
                value: isLocked,
                onChanged: (value) {
                  _showPINDialog(
                    context,
                    title: value ? 'Enter PIN Code' : 'Set a PIN Code',
                    subtitle: value
                        ? 'Enter your PIN to unlock settings'
                        : 'Enter a PIN to lock settings',
                    isEnableMode: value,
                  );
                },
                activeThumbColor: Colors.red,
              ),
            ),
            const Divider(height: 32),
            _LessonSwitcher(
              title: FeatureNames.widgets.title,
              lesson: FeatureNames.widgets.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.navigation.title,
              lesson: FeatureNames.navigation.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.stateManagement.title,
              lesson: FeatureNames.stateManagement.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.animations.title,
              lesson: FeatureNames.animations.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.errorHandling.title,
              lesson: FeatureNames.errorHandling.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.restApi.title,
              lesson: FeatureNames.restApi.name,
            ),
            _LessonSwitcher(
              title: FeatureNames.topNews.title,
              lesson: FeatureNames.topNews.name,
            ),
          ],
        ),
      ),
    );
  }

  void _showPINDialog(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool isEnableMode,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => PinDialog(
        title: title,
        subtitle: subtitle,
        isEnableMode: isEnableMode,
        onSubmit: (pin) async {
          context.pop();

          final cubit = context.read<SettingsCubit>();

          final parsedPin = int.parse(pin);

          isEnableMode
              ? await cubit.enableLockedMode(parsedPin)
              : await cubit.disableLockedMode(parsedPin);
        },
      ),
    );
  }
}

class _LessonSwitcher extends StatelessWidget {
  const _LessonSwitcher({
    required this.title,
    required this.lesson,
  });
  final String title;
  final String lesson;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) => SwitchListTile(
            title: Text(title),
            value: state.isFeatureEnabled(lesson),
            onChanged: state.isSettingsLocked
                ? null
                : (value) => _onChanged(context, lesson, value),
            activeThumbColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  void _onChanged(BuildContext context, String lesson, bool value) {
    context.read<SettingsCubit>().toggleFeature(
      lesson: lesson,
      isEnabled: value,
    );
  }
}
