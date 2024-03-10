import 'package:barcodbek/src/core/config/router/name_routes.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.initial,
  routes: [
    // GoRoute(path: Routes.initial,
    // builder: (context, state) => const SplashScreen(),
    //     ),
  ],
);
