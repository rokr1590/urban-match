import 'dart:io';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

// Interceptors (if you still want to keep them)
// import 'package:your_app/core/services/api/interceptors/curl.interceptor.dart';

class ApiService {
  final Dio _dio;

  ApiService({
    required String baseUrl,
    Duration connectTimeout = const Duration(minutes: 2),
    Duration receiveTimeout = const Duration(minutes: 2),
    Map<String, dynamic>? additionalHeaders,
  }) : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
          headers: {
            'channel': _getChannelName(),
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            ...?additionalHeaders,
          },
        )) {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    // Add curl interceptor if you want to keep it for debugging
    // _dio.interceptors.add(DioInterceptToCurl());

    // Add request interceptor to automatically add build number to headers
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add build number to all requests
          options.headers['build-number'] = await _getBuildNumber();
          handler.next(options);
        },
        onError: (error, handler) {
          // Handle general errors if needed
          print('API Error: ${error.message}');
          handler.next(error);
        },
      ),
    );
  }

  // Getter to access the Dio instance
  Dio get dio => _dio;

  // Get standard headers (without auth)
  Future<Map<String, String>> getStandardHeaders() async {
    return {
      'channel': _getChannelName(),
      'build-number': await _getBuildNumber(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  // Helper method to determine platform channel
  static String _getChannelName() {
    if (Platform.isIOS) {
      return 'ios';
    } else if (Platform.isAndroid) {
      return 'android';
    } else {
      return 'web'; // or 'desktop' depending on your needs
    }
  }

  // Helper method to get build number
  static Future<String> _getBuildNumber() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.buildNumber;
    } catch (e) {
      print('Error getting build number: $e');
      return '0'; // fallback value
    }
  }

  // Convenience methods for common HTTP operations
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  // Method to update base headers if needed
  void updateHeaders(Map<String, dynamic> headers) {
    _dio.options.headers.addAll(headers);
  }

  // Method to clear all custom headers
  void clearCustomHeaders() {
    _dio.options.headers.clear();
    _dio.options.headers.addAll({
      'channel': _getChannelName(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }
}
