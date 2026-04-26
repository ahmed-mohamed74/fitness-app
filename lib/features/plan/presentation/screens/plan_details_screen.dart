import 'package:fitness_app/features/plan/data/models/plan_model.dart';
import 'package:fitness_app/features/plan/presentation/widgets/circle_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlanDetailsScreen extends StatelessWidget {
  final PlanModel? planModel;
  const PlanDetailsScreen({super.key, required this.planModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            leading: CircleButtonWidget(
              icon: Icons.arrow_back,
              onTap: () => context.pop(),
            ),
            actions: [
              CircleButtonWidget(icon: Icons.favorite_border, onTap: () {}),
              const SizedBox(width: 16),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                planModel?.image ??
                    'https://images.unsplash.com/photo-1534438327276-14e5300c3a48',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildBadge(
                        planModel?.level ?? 'ADVANCED',
                        colorScheme.primary,
                        Colors.white,
                      ),
                      const SizedBox(width: 8),
                      _buildBadge(
                        '${planModel?.durationWeeks ?? '8'} WEEKS',
                        colorScheme.surface,
                        colorScheme.secondary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // 3. Title and Description
                  Text(
                    planModel?.name??'IronPulse Strength Phase',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    planModel?.description ??
                        'A high-intensity program designed for maximum muscle hypertrophy and strength gains. Focuses on compound movements and progressive overload.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 4. Info Cards (Duration, Frequency, Intensity)
                   Row(
                    children: [
                      Expanded(
                        child: InfoCard(
                          icon: Icons.timer_outlined,
                          label: 'Duration',
                          value: '${planModel?.steps?.first.duration??0} Min',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: InfoCard(
                          icon: Icons.unfold_more,
                          label: 'Frequency',
                          value: '5 Days/Wk',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: InfoCard(
                          icon: Icons.fitness_center,
                          label: 'Intensity',
                          value: 'High',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // 5. Week Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Week 1: Foundations',
                        style: theme.textTheme.titleMedium,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('View All Weeks'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // 6. Expandable Workout List
                  const WorkoutDayTile(
                    day: 'DAY 1',
                    title: 'Push Day: Chest & Triceps',
                    isExpanded: true,
                    exercises: [
                      'Barbell Bench Press',
                      'Incline Dumbbell Flys',
                      'Tricep Rope Pushdowns',
                    ],
                  ),
                  const WorkoutDayTile(
                    day: 'DAY 2',
                    title: 'Pull Day: Back & Biceps',
                  ),
                  const WorkoutDayTile(
                    day: 'DAY 3',
                    title: 'Active Recovery',
                    icon: Icons.king_bed_outlined,
                  ),

                  const SizedBox(height: 100), // Space for the bottom button
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        color: colorScheme.surface.withOpacity(0.9),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'START WORKOUT',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String text, Color bg, Color textCol) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textCol,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Sub-widget: InfoCard
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: colorScheme.primary, size: 20),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: colorScheme.secondary, fontSize: 10),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// Sub-widget: WorkoutDayTile
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
