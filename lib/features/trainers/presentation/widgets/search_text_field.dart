import 'package:fitness_app/core/themes/app_images.dart';
import 'package:fitness_app/features/trainers/presentation/cubit/trainers/trainers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      onChanged: (value) {
        setState(() {
          if (value.isEmpty) {
            context.read<TrainersCubit>().getTrainers();
          } else {
            context.read<TrainersCubit>().searchTrainer(value);
          }
        });
      },
      decoration: InputDecoration(
        fillColor: Color(0xff1E293B),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
        prefixIcon: Image.asset(Assets.imagesSearch),

        prefixIconConstraints: const BoxConstraints(
          maxHeight: 24,
          minWidth: 50,
        ),

        hintText: "Search by name or specialty ",
        hintStyle: theme.textTheme.bodySmall!.copyWith(color: Colors.white70),
        border: buildBorder(),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(16));
  }
}
