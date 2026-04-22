import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/features/plan/data/models/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlanCard extends StatelessWidget {
  final PlanModel plan;
  const PlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutes.planDetailsScreen),
      child: Card(
        child: Column(
          children: [
            Container(
              height: height * 0.24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: NetworkImage(plan.image!),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      plan.level ?? 'Beginner',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.7,
                        child: Text(
                          plan.name ?? '',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_border_outlined,
                            color: Colors.amber,
                            size: 16,
                          ),
                          Text("4.9", style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${plan.durationWeeks} weeks",
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Icon(
                        Icons.timer_outlined,
                        size: 16,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "60 Min/Day",
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
