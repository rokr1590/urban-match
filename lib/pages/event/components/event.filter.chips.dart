import 'package:flutter/material.dart';
import 'package:urban_match/core/models/events/events.dtos.dart';
import 'package:urban_match/core/theme/colors.dart';

class EventFilterChips extends StatelessWidget {
  final EventFilter currentFilter;
  final Function(EventFilter) onFilterChanged;

  const EventFilterChips({
    super.key,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _buildFilterChip(
            context,
            'All',
            EventFilter.all,
            Icons.event,
          ),
          const SizedBox(width: 8),
          _buildFilterChip(
            context,
            'Upcoming',
            EventFilter.upcoming,
            Icons.upcoming,
          ),
          const SizedBox(width: 8),
          _buildFilterChip(
            context,
            'Past',
            EventFilter.past,
            Icons.history,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context,
    String label,
    EventFilter filter,
    IconData icon,
  ) {
    final isSelected = currentFilter == filter;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : Colors.grey[600],
            ),
            const SizedBox(width: 4),
            Text(label),
          ],
        ),
        selected: isSelected,
        onSelected: (_) => onFilterChanged(filter),
        backgroundColor: Colors.grey[200],
        selectedColor: AppColors.tertiaryTangerine,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[700],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        elevation: isSelected ? 4 : 0,
        pressElevation: 8,
      ),
    );
  }
}
