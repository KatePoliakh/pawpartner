import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pawpartner/core/network/network_info.dart';
import 'package:pawpartner/core/sync/sync_service.dart';
import 'package:pawpartner/di/service_locator.dart';
import 'package:pawpartner/presentation/screens/home_screen/home_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  try {
    await setupServiceLocator();
    getIt<SyncService>();
    runApp(const PawPartnerApp());
  } catch (e) {
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Ошибка инициализации: ${e.toString()}')),
        ),
      ),
    );
  }
}

class PawPartnerApp extends StatelessWidget {
  const PawPartnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final networkInfo = getIt<NetworkInfo>();

    return MaterialApp(
      title: 'Paw Partner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 4),
      ),
      home: StreamBuilder<ConnectivityResult>(
        stream: networkInfo.connectivity.onConnectivityChanged,
        builder: (context, snapshot) {
          final connectivityResult = snapshot.data;
          final isOnline = connectivityResult != ConnectivityResult.none;

          if (connectivityResult != null && !isOnline) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Работаем в оффлайн-режиме'),
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.amber[700],
                  behavior: SnackBarBehavior.floating,
                ),
              );
            });
          }

          return const HomeScreen();
        },
      ),
    );
  }
}
