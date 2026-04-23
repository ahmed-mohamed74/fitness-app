import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/features/plan/presentation/cubit/plan_cubit.dart';
import 'package:fitness_app/features/plan/presentation/screens/home_screen.dart';
import 'package:fitness_app/features/plan/presentation/screens/plan_details_screen.dart';
import 'package:fitness_app/features/plan/presentation/screens/plans_screen.dart';
import 'package:fitness_app/features/trainers/presentation/cubit/trainers/trainers_cubit.dart';
import 'package:fitness_app/features/trainers/presentation/screens/trainers_screen.dart';
import 'package:fitness_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<PlanCubit>()),
            BlocProvider(create: (context) => sl<TrainersCubit>()),
          ],
          child: HomeScreen(navigationShell: navigationShell),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'home',
              path: '/home',
              builder: (context, state) => Container(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.trainersScreen,
              path: '/home/trainers',
              builder: (context, state) => TrainersScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.plansScreen,
              path: '/home/plans',
              builder: (context, state) => PlansScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'favourites',
              path: '/home/favourites',
              builder: (context, state) => Container(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'profile',
              path: '/home/profile',
              builder: (context, state) => Container(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: AppRoutes.planDetailsScreen,
      path: '/home/plans/planScreen',
      builder: (context, state) => PlanDetailsScreen(),
    ),
  ],
);
