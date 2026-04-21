import 'package:fitness_app/features/plan/presentation/cubit/plan_cubit.dart';
import 'package:fitness_app/features/plan/presentation/widgets/plan_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PlanCubit>().getPlans();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Find Your Plan", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          Expanded(
            child: BlocConsumer<PlanCubit, PlanState>(
              listener: (context, state) {
                if (state is PlansFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }
              },
              builder: (context, state) {
                if (state is PlansSuccess) {
                  return ListView.builder(
                    itemCount: state.plans.length,
                    itemBuilder: (context, index) =>
                        PlanCard(plan: state.plans[index]),
                  );
                } else if (state is PlansLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return Center(child: Text('No Plans Yet!!'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
