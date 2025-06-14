import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:urban_match/core/theme/colors.dart';
import 'package:urban_match/core/theme/styles.dart';
import 'package:urban_match/routes/routes.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to app screen after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        context.router.popAndPush(const AppRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.obsidian100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              LucideIcons.mapPin,
              size: 64,
              color: AppColors.tertiaryTangerine,
            ),
            const SizedBox(height: 16),
            Text(
              'Urban Match',
              style: Styles.h1Bold.copyWith(
                color: AppColors.tertiaryTangerine,
              ),
            ),
            const SizedBox(height: 32),
            // Optional: Add a loading indicator
            const CircularProgressIndicator(
              color: AppColors.tertiaryTangerine,
            ),
          ],
        ),
      ),
    );
  }
}
