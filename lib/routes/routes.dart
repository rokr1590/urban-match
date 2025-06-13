import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_match/pages/app.dart';
import 'package:urban_match/pages/event/event.screen.dart';
import 'package:urban_match/pages/home/home.screen.dart';
import 'package:urban_match/pages/profile/profile.screen.dart';
import 'package:urban_match/pages/splash.sceen.dart';

part 'routes.gr.dart';

// Provider to hold the router instance
final routerProvider = Provider<AppRouter>((ref) => AppRouter());

@AutoRouterConfig(replaceInRouteName: 'Screen')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        // Splash Screen
        AutoRoute(
          path: '/',
          page: SplashScreenRoute.page,
          initial: true,
        ),

        // Main App with Bottom Navigation
        AutoRoute(
          path: '/app',
          page: AppRoute.page,
          children: [
            // Home Tab - make this the initial/default tab
            AutoRoute(
              path: 'home',
              page: HomeScreenRoute.page,
              initial: true, // This makes it the default tab
            ),
            // Events Tab
            AutoRoute(
              path: 'events',
              page: EventsScreenRoute.page,
            ),
            // Profile Tab
            AutoRoute(
              path: 'profile',
              page: ProfileScreenRoute.page,
            ),
            // Redirect any unmatched paths under /app to home
            RedirectRoute(path: '*', redirectTo: 'home'),
          ],
        ),

        // Fallback route - redirect to splash
        RedirectRoute(path: '*', redirectTo: '/'),
      ];
}
