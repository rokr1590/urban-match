import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_match/core/components/glowing.gradient.semicircle.dart';
import 'package:urban_match/core/theme/colors.dart';
import 'package:urban_match/routes/routes.dart';

@RoutePage()
class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: AutoTabsScaffold(
          // Set the scaffold background to your dark color
          backgroundColor: AppColors.obsidian100,
          routes: const [
            HomeScreenRoute(),
            EventsScreenRoute(),
            ProfileScreenRoute(),
          ],
          // Add transition builder to prevent white flash
          transitionBuilder: (context, child, animation) {
            return Container(
              color: AppColors.obsidian100,
              child: child,
            );
          },
          bottomNavigationBuilder: (context, tabsRouter) {
            final double itemWidth = MediaQuery.of(context).size.width / 3;
            final double sliderWidth = itemWidth / 3;
            final double sliderOffset = tabsRouter.activeIndex * itemWidth +
                (itemWidth / 2) -
                (sliderWidth / 2);
            const double glowWidth = 60.0;
            final double glowOffset = tabsRouter.activeIndex * itemWidth +
                (itemWidth / 2) -
                (glowWidth / 2);

            return Stack(
              children: [
                // Custom Bottom Navigation Bar
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      _buildNavItem(
                        icon: Icons.home,
                        label: 'Home',
                        index: 0,
                        isActive: tabsRouter.activeIndex == 0,
                        onTap: () => _onItemTapped(0, tabsRouter),
                      ),
                      _buildNavItem(
                        icon: Icons.event,
                        label: 'Events',
                        index: 1,
                        isActive: tabsRouter.activeIndex == 1,
                        onTap: () => _onItemTapped(1, tabsRouter),
                      ),
                      _buildNavItem(
                        icon: Icons.person,
                        label: 'Profile',
                        index: 2,
                        isActive: tabsRouter.activeIndex == 2,
                        onTap: () => _onItemTapped(2, tabsRouter),
                      ),
                    ],
                  ),
                ),

                // Glowing effect for selected index
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: glowOffset,
                  child: AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      return GlowingGradientSemicircle(
                        width: glowWidth,
                        height: 28,
                        opacity: _glowAnimation.value,
                      );
                    },
                  ),
                ),

                // Animated slider for selected index
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: sliderOffset,
                  child: AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      return Container(
                        width: sliderWidth,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.tertiaryTangerine
                              .withOpacity(_glowAnimation.value),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.tertiaryTangerine
                                  .withOpacity(0.5 * _glowAnimation.value),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: isActive ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  icon,
                  size: 26,
                  color: isActive
                      ? AppColors.tertiaryTangerine
                      : Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  color: isActive
                      ? AppColors.tertiaryTangerine
                      : Colors.grey.shade400,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
