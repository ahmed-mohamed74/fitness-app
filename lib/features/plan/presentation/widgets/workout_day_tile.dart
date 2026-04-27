
import 'package:flutter/material.dart';

class WorkoutDayTile extends StatelessWidget {
  final String day;
  final String title;
  final bool isExpanded;
  final IconData? icon;
  final List<String>? exercises;

  const WorkoutDayTile({
    super.key,
    required this.day,
    required this.title,
    this.isExpanded = false,
    this.icon,
    this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      day,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                icon ??
                    (isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_right),
                color: colorScheme.secondary,
              ),
            ],
          ),
          if (isExpanded && exercises != null) ...[
            const Divider(height: 24),
            ...exercises!.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.unfold_more, size: 16),
                    ),
                    const SizedBox(width: 12),
                    Text(e, style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
