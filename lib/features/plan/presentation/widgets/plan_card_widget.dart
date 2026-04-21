import 'package:fitness_app/features/plan/data/models/plan_model.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final PlanModel plan;
  const PlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const PlanDetailsScreen()),
      // ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(plan.image!),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF007FFF),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    plan.level!,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          plan.name ?? '',
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(
                            width: 100,
                            child: Text(
                              " ${plan.description}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${plan.durationWeeks} weeks",
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
