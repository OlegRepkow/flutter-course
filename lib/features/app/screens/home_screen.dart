import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/state_managment/bloc_couter_example/bloc/counter_bloc.dart';
import 'package:flutter_lab/features/state_managment/cubit_counter_example/cubit/counter_cubit.dart';
import 'package:flutter_lab/features/state_managment/simple_example.dart/providers/counter_provider.dart';
import 'package:flutter_lab/features/storage/presentation/cubit/settings_cubit.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Playground'),
        backgroundColor: Colors.blue.shade100,
        leading: IconButton(
          onPressed: () => _showDialog(context),
          icon: const Icon(Icons.numbers),
        ),
        actions: [
          IconButton(
            onPressed: () => context.goNamed(ScreenNames.mainPageSettings),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FeatureCard(
                title: FeatureNames.widgets.title,
                isVisible: state.isFeatureEnabled(FeatureNames.widgets.name),
                onTap: () => context.goNamed(ScreenNames.widgets),
              ),
              FeatureCard(
                title: FeatureNames.navigation.title,
                isVisible: state.isFeatureEnabled(FeatureNames.navigation.name),
                onTap: () => context.goNamed(ScreenNames.baseNavigation),
              ),
              FeatureCard(
                title: FeatureNames.stateManagement.title,
                isVisible: state.isFeatureEnabled(
                  FeatureNames.stateManagement.name,
                ),
                onTap: () => context.goNamed(ScreenNames.stateManagement),
              ),
              FeatureCard(
                title: FeatureNames.animations.title,
                isVisible: state.isFeatureEnabled(FeatureNames.animations.name),
                onTap: () => context.goNamed(ScreenNames.animations),
              ),
              FeatureCard(
                title: FeatureNames.errorHandling.title,
                isVisible: state.isFeatureEnabled(
                  FeatureNames.errorHandling.name,
                ),
                onTap: () => context.goNamed(ScreenNames.errorHandling),
              ),
              FeatureCard(
                title: FeatureNames.restApi.title,
                isVisible: state.isFeatureEnabled(FeatureNames.restApi.name),
                onTap: () => context.goNamed(ScreenNames.restApi),
              ),
              FeatureCard(
                title: FeatureNames.topNews.title,
                isVisible: state.isFeatureEnabled(FeatureNames.topNews.name),
                onTap: () => context.goNamed(ScreenNames.topNews),
              ),
              FeatureCard(
                title: FeatureNames.storage.title,
                isVisible: state.isFeatureEnabled(FeatureNames.storage.name),
                onTap: () => context.goNamed(ScreenNames.storage),
              ),
              FeatureCard(
                title: FeatureNames.localPushNotif.title,
                isVisible: state.isFeatureEnabled(
                  FeatureNames.localPushNotif.name,
                ),
                onTap: () => context.goNamed(ScreenNames.pushNotifications),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum FeatureNames {
  widgets('Widgets'),
  navigation('Navigation'),
  stateManagement('State Management'),
  animations('Animations'),
  errorHandling('Error Handling'),
  restApi('Rest API'),
  topNews('Top News'),
  storage('Storage'),
  localPushNotif('Local Push Notifications')
  ;

  const FeatureNames(this.title);
  final String title;
}

void _showDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Counter Bloc: ', style: TextStyle(fontSize: 20)),
                  Text(
                    '${context.watch<CounterBloc>().state.counter}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Counter Provider: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${context.watch<CounterProvider>().counter}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Counter Cubit: ', style: TextStyle(fontSize: 20)),
                  Text(
                    '${context.watch<CounterCubit>().state.counter}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Favorite Number: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${context.watch<CounterCubit>().state.favoriteNumber}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    required this.title,
    required this.onTap,
    this.isVisible = true,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
