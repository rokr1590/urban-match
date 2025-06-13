import 'dart:ui';
import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_match/core/components/generic.error.icon.dart';
import 'package:urban_match/core/config/api.config.dart';
import 'package:urban_match/routes/routes.dart';

void main() async {
  // Required to ensure before the FCM is setup
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize ApiConfig
  ApiEndpointConfig().initialize();

  PlatformDispatcher.instance.onError = (error, stack) {
    /// Capture any global exceptions to track any native errors

    //Sentry.captureException(error, stackTrace: stack);
    // Return true to indicate the error has been handled
    return true;
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    /// Capture any flutter level exceptions and log it to Sentry
    return const GenericErrorIcon();
  };

  runApp(
    ProviderScope(
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.read(routerProvider);
    //final connectivityState = ref.watch(connectivityProvider);
    return MaterialApp.router(
      routerConfig: router.config(),
      title: 'Urban Match',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
    // return MaterialApp.router(
    //   routerConfig: router.config(),
    //   themeMode: ThemeMode.dark,
    //   builder: (context, child) {
    //     final upgrader = _getUpgraderConfig();
    //     final isUpdateAvailable = upgrader.shouldDisplayUpgrade();

    //     handleTerminatedNotification(); // Checks if app opened via notification from terminated state and launches deeplink

    //     return UpgradeAlert(
    //       upgrader: upgrader,
    //       child: _buildChild(
    //           child: child,
    //           isUpdateAvailable: isUpdateAvailable,
    //           isOnline: connectivityState),
    //       navigatorKey: router.navigatorKey,
    //       dialogStyle: _getDialogStyle(),
    //       showIgnore: false,
    //       showLater: false,
    //       showReleaseNotes: false,
    //     );
    //   },
    // );
  }
}
