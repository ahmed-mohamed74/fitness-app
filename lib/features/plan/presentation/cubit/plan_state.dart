part of 'plan_cubit.dart';

@immutable
sealed class PlanState {}

final class PlanInitial extends PlanState {}

final class PlansLoading extends PlanState {}

final class PlansSuccess extends PlanState {
  final List<PlanModel> plans;

  PlansSuccess({required this.plans});
}

final class PlansFailure extends PlanState {
  final String errorMessage;

  PlansFailure({required this.errorMessage});
}
