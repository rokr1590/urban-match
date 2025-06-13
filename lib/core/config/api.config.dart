import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpointConfig {
  static ApiEndpointConfig? _instance;
  static EndpointConfig? _config;
  static String? _environment;

  ApiEndpointConfig._privateConstructor();

  factory ApiEndpointConfig() {
    return _instance ??= ApiEndpointConfig._privateConstructor();
  }

  void initialize() {
    final environment = dotenv.get('APP_ENV');
    switch (environment) {
      case 'development':
        _config = DevelopmentEndpointConfig();
        break;
      // case 'staging':
      //   _config = StagingEndpointConfig();
      //   break;
      // case 'production':
      //   _config = ProductionEndpointConfig();
      //   break;
      // case 'pre-prod':
      //   _config = PreProductionEndpointConfig();
      //   break;
      default:
        throw Exception('Invalid environment: $environment');
    }
    _environment = environment;
  }

  EndpointConfig get config {
    if (_config == null) {
      throw Exception(
        'ApiEndpointConfig not initialized. No config found',
      );
    }
    return _config!;
  }

  String get cosBaseUrl {
    return '${config.cos}/${config.cosVersion}';
  }

  String getCustomCosUrl({String? version, String? slug}) {
    final baseUrl = '${config.cos}/${version ?? config.cosVersion}';
    return slug != null ? '$baseUrl/$slug' : baseUrl;
  }

  //Local mocking setup
  String getPrismMockUrl({
    required String port,
    String? version,
    String? slug,
  }) {
    final baseUrl = 'http://127.0.0.1:$port/$version';
    return slug != null ? '$baseUrl/$slug' : baseUrl;
  }

  String get environment {
    if (_environment == null) {
      throw Exception(
        'ApiEndpointConfig not initialized. No environment found',
      );
    }
    return _environment!;
  }
}

abstract class EndpointConfig {
  final String cos;
  final String cosVersion;

  EndpointConfig({
    required this.cos,
    required this.cosVersion,
  });
}

class DevelopmentEndpointConfig extends EndpointConfig {
  DevelopmentEndpointConfig()
      : super(
          cos:
              'https://6847d529ec44b9f3493e5f06.mockapi.io/api', // TODO: Change back to cos: 'https://staging.cos.8club.co',
          cosVersion: 'v1',
        );
}

/// [ApiEndpointConfig] Base template for different environments configured through env

// class StagingEndpointConfig extends EndpointConfig {
//   StagingEndpointConfig()
//       : super(
//           cos:
//               '',
//           cosVersion: 'v1',
//         );
// }

// class ProductionEndpointConfig extends EndpointConfig {
//   ProductionEndpointConfig()
//       : super(
//           cos: '',
//           cosVersion: 'v1',
//         );
// }

// class PreProductionEndpointConfig extends EndpointConfig {
//   PreProductionEndpointConfig()
//       : super(
//           cos:
//               '',
//           cosVersion: 'v1',
//         );
// }
