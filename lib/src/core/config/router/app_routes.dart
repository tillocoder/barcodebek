import 'package:barcodbek/splash.dart';
import 'package:barcodbek/src/core/config/router/name_routes.dart';
import 'package:barcodbek/src/features/onbording/view/pages/onbording_pages.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPages(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => const OnbordingPages(),
    ),
  ],
);
