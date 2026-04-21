import 'package:dio/dio.dart';
import 'package:fitness_app/core/api/dio_consumer.dart';
import 'package:fitness_app/features/plan/data/repositories/plan_repository.dart';
import 'package:fitness_app/features/plan/presentation/cubit/plan_cubit.dart';
import 'package:fitness_app/features/plan/presentation/screens/plans_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      Container(),
      Container(),
      BlocProvider(
        create: (context) => PlanCubit(
          planRepository: PlanRepository(api: DioConsumer(dio: Dio())),
        ),
        child: PlansScreen(),
      ),
      Container(),
      Container(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "⚡ IRONPULSE",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: screens[2],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Trainers",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Plans"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
