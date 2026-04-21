

import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/plan/data/models/plan_model.dart';
import 'package:fitness_app/features/plan/data/repositories/plan_repository.dart';
import 'package:flutter/material.dart';

part 'plan_state.dart';

class PlanCubit extends Cubit<PlanState> {
  final PlanRepository planRepository;
  PlanCubit({required this.planRepository}) : super(PlanInitial());

  Future<void> getPlans() async {
    emit(PlansLoading());
    final plans=await planRepository.getPlans();
    plans.fold(
      (error) => emit(PlansFailure(errorMessage: error)),
      (plans) => emit(PlansSuccess(plans: plans)),
    );
  }
}
