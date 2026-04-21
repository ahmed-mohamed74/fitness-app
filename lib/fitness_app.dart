import 'package:fitness_app/core/routing/go_router.dart';
import 'package:fitness_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: goRouter,
    );
  }
}
