import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urban_match/core/theme/colors.dart';
import 'package:urban_match/core/theme/styles.dart';

@RoutePage()
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.obsidian100,
        statusBarIconBrightness:
            Brightness.light, // Light icons on dark background
        statusBarBrightness: Brightness.dark, // For iOS
      ),
      child: Scaffold(
        backgroundColor: AppColors.obsidian100,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.event,
                size: 100,
                color: Colors.orange,
              ),
              SizedBox(height: 20),
              Text(
                'Events Screen',
                style: Styles.b1Bold.copyWith(
                  color: AppColors.cloud100,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'This is the events screen placeholder',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
