import 'package:fitness_app/features/trainers/presentation/cubit/trainers/trainers_cubit.dart';
import 'package:fitness_app/features/trainers/presentation/screens/trainers_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainersItemListView extends StatelessWidget {
  const TrainersItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrainersCubit, TrainersState>(
      listener: (context, state) {
        if (state is TrainersFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is TrainersSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.trainers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TrainersItem(trainersModel: state.trainers[index]),
              );
            },
          );
        } else if (state is TrainersLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Center(child: Text('No Trainers Yet!!'));
      },
    );
  }
}
