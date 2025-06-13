import 'package:dio/dio.dart';
import 'package:urban_match/core/config/api.config.dart';
import 'package:urban_match/core/config/api.service.dart';
import 'package:urban_match/core/models/events/events.dtos.dart';
import 'package:urban_match/core/utils/logger.utils.dart';

class EventRepository {
  final _apiService = ApiService(
      baseUrl: ApiEndpointConfig().getCustomCosUrl(
    version: 'v1',
  ));

  Future<List<EventsDto>> fetchEvents() async {
    final authHeaders = await _apiService.getStandardHeaders();
    try {
      final response = await _apiService.dio.get(
        '/events',
        options: Options(headers: authHeaders),
      );

      final result = response.data;
      print("result ${result}");
      final List<dynamic> data = result;
      return data.map((json) {
        final event = EventsDto.fromJson(json);
        final now = DateTime.now();

        // Dummy out additional fields not provided by API
        return event.copyWith(
          id: DateTime.now().millisecondsSinceEpoch.toString() +
              event.name.hashCode.toString(),
          isUpcoming: event.time.isAfter(now),
          description: _generateDummyDescription(event.name),
          location: _generateDummyLocation(),
          imageUrl: _generateDummyImageUrl(),
        );
      }).toList();
    } on DioException catch (e) {
      logger.e('Failed to report user: ${e.response?.data}');
      rethrow;
    }
  }

  String _generateDummyDescription(String eventName) {
    final descriptions = [
      'Join us for an amazing experience! This event promises to be fun and engaging.',
      'Don\'t miss out on this exciting opportunity to connect with like-minded people.',
      'A wonderful gathering for everyone to enjoy. Come and be part of something special.',
      'Experience something unique and memorable. Perfect for meeting new people.',
      'An event you won\'t want to miss! Great atmosphere and fantastic company.',
    ];
    return descriptions[eventName.hashCode.abs() % descriptions.length];
  }

  String _generateDummyLocation() {
    final locations = [
      'Golden Gate Park, San Francisco',
      'Union Square, San Francisco',
      'Dolores Park, San Francisco',
      'Mission District, San Francisco',
      'Fisherman\'s Wharf, San Francisco',
      'Castro District, San Francisco',
      'North Beach, San Francisco',
    ];
    final random = DateTime.now().millisecondsSinceEpoch % locations.length;
    return locations[random];
  }

  String? _generateDummyImageUrl() {
    final images = [
      'https://picsum.photos/400/300?random=1',
      'https://picsum.photos/400/300?random=2',
      'https://picsum.photos/400/300?random=3',
      'https://picsum.photos/400/300?random=4',
      'https://picsum.photos/400/300?random=5',
      null, // Some events without images
    ];
    final random = DateTime.now().millisecondsSinceEpoch % images.length;
    return images[random];
  }
}
