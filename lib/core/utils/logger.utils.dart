import 'package:logger/logger.dart';

/// Logger instance used throughout the app
/// to log messages to the console.
Logger logger = Logger(
  printer: PrettyPrinter(printEmojis: false),
);
