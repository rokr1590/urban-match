import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:urban_match/core/theme/colors.dart';
import 'package:urban_match/core/theme/styles.dart';
import 'package:urban_match/routes/routes.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
              color: AppColors.primaryLavender,
            ),
            const SizedBox(height: 16),
            Text(
              'Urban Match',
              style: Styles.h1Bold.copyWith(
                color: AppColors.primaryLavender,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.router.push(AppRoute());
              },
              child: Text('Button'),
            )
          ],
        ),
      ),
    );
  }
}
