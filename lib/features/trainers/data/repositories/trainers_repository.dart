import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/api/api_consumer.dart';
import 'package:fitness_app/core/api/end_points.dart';
import 'package:fitness_app/features/trainers/data/models/trainers_model.dart';
import 'package:injectable/injectable.dart';

abstract class TrainersRepository {
  Future<Either<String, List<TrainersModel>>> getTrainers();
}

@LazySingleton(as: TrainersRepository)
class TrainersRepositoryImpl extends TrainersRepository {
  final ApiConsumer api;

  TrainersRepositoryImpl({required this.api});
  @override
  Future<Either<String, List<TrainersModel>>> getTrainers() async {
    try {
      final response = await api.get(EndPoints.getTrainers);
      final trainersList = response['trainers'] as List;
      final data = trainersList.map((e) => TrainersModel.fromJson(e)).toList();
      return right(data);
    } catch (e) {
      return left("Failed to load trainers: ${e.toString()}");
    }
  }
}
