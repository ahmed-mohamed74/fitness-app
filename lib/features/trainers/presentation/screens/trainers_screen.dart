import 'package:fitness_app/features/trainers/presentation/screens/trainers_item_list_view.dart';
import 'package:fitness_app/features/trainers/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class TrainersScreen extends StatelessWidget {
  const TrainersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [SearchTextField(), TrainersItemListView()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
