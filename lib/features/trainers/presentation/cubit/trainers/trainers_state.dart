part of 'trainers_cubit.dart';

@immutable
sealed class TrainersState {}

class TrainersInitial extends TrainersState {}

class TrainersLoading extends TrainersState {}

class TrainersSuccess extends TrainersState {
  final List<TrainersModel> trainers;

  TrainersSuccess({required this.trainers});
}

class TrainersFailure extends TrainersState {
  final String errorMessage;

  TrainersFailure({required this.errorMessage});
}
