import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/core/firebase/firebase_service.dart';
import 'package:flutter_lab/core/storage/prefs_storage/prefs_storage.dart';
import 'package:flutter_lab/core/storage/secure_storage/secure_storage.dart';
import 'package:flutter_lab/features/push_notifications/local_push_notif_service.dart';
import 'package:flutter_lab/features/state_managment/bloc_couter_example/bloc/counter_bloc.dart';
import 'package:flutter_lab/features/state_managment/cubit_counter_example/cubit/counter_cubit.dart';
import 'package:flutter_lab/features/state_managment/simple_example.dart/providers/counter_provider.dart';
import 'package:flutter_lab/features/storage/presentation/cubit/settings_cubit.dart';
import 'package:flutter_lab/router/app_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebasePushNotificationService.instance.init();

  await LocalPushNotifService.instance.init();

  await PrefsStorage.instance.init();

  runApp(const FlutterWidgetsApp());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(
          create: (context) =>
              SettingsCubit(PrefsStorage.instance, SecureStorage.instance),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: MaterialApp.router(routerConfig: router),
      ),
    );
  }
}
