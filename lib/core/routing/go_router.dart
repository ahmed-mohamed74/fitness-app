import 'package:fitness_app/features/plan/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
