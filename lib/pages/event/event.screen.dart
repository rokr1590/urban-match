import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_match/core/models/events/events.dtos.dart';
import 'package:urban_match/core/theme/colors.dart';
import 'package:urban_match/pages/event/components/event.bottom.sheet.dart';
import 'package:urban_match/pages/event/components/event.filter.chips.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:urban_match/pages/event/event.logic.dart';
import 'package:urban_match/pages/event/event.view.model.dart';

@RoutePage()
class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EventsScreen> createState() => _EventsPageState();
}

class _EventsPageState extends ConsumerState<EventsScreen>
    with TickerProviderStateMixin {
  GoogleMapController? mapController;
  late AnimationController _bottomSheetController;
  late Animation<double> bottomSheetAnimation;

  @override
  void initState() {
    super.initState();
    _bottomSheetController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    bottomSheetAnimation = Tween<double>(
      begin: 0.3,
      end: 0.9,
    ).animate(CurvedAnimation(
      parent: _bottomSheetController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _bottomSheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eventsAsync = ref.watch(eventsLogicProvider);

    return Scaffold(
      body: eventsAsync.when(
        loading: () => Container(
            color: AppColors.obsidian98,
            child: Center(child: CircularProgressIndicator.adaptive())),
        error: (error, stack) => _buildErrorWidget(error.toString()),
        data: (state) => _buildMapWithBottomSheet(state),
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'Error loading events',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            error,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () =>
                ref.read(eventsLogicProvider.notifier).refreshEvents(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildMapWithBottomSheet(EventsState state) {
    return Stack(
      children: [
        _buildMap(state.filteredEvents),
        _buildBottomSheet(state),
      ],
    );
  }

  Widget _buildMap(List<EventsDto> events) {
    final markers = events
        .where((event) => event.latitude != null && event.longitude != null)
        .map((event) => Marker(
              markerId: MarkerId(event.id ?? event.name),
              position: LatLng(event.latitude!, event.longitude!),
              infoWindow: InfoWindow(
                title: event.name,
                snippet: event.location ?? 'No location',
              ),
              onTap: () {
                // Animate to show event details
                _showEventDetails(event);
              },
            ))
        .toSet();

    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
      initialCameraPosition: const CameraPosition(
        target: LatLng(37.7749, -122.4194), // San Francisco
        zoom: 12,
      ),
      markers: markers,
      mapType: MapType.satellite,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
    );
  }

  Widget _buildBottomSheet(EventsState state) {
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.35,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.obsidian96,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildBottomSheetHandle(),
              _buildFilterChips(state),
              Expanded(
                child: EventBottomSheet(
                  events: state.filteredEvents,
                  scrollController: scrollController,
                  onEventTap: _showEventDetails,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetHandle() {
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildFilterChips(EventsState state) {
    return EventFilterChips(
      currentFilter: state.currentFilter,
      onFilterChanged: (filter) {
        ref.read(eventsLogicProvider.notifier).filterEvents(filter);
      },
    );
  }

  void _showEventDetails(EventsDto event) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildEventDetailsSheet(event),
    );
  }

  Widget _buildEventDetailsSheet(EventsDto event) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: AppColors.obsidian76,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (event.imageUrl != null)
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(event.imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  if (event.location != null)
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            event.location!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.grey[600],
                                ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        _formatDateTime(event.time),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                    ],
                  ),
                  if (event.description != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      event.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} at ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
