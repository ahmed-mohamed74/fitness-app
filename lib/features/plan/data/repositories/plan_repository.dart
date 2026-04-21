import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/api/api_consumer.dart';
import 'package:fitness_app/core/api/end_points.dart';
import 'package:fitness_app/features/plan/data/models/plan_model.dart';

class PlanRepository {
  final ApiConsumer api;

  PlanRepository({required this.api});
  Future<Either<String, List<PlanModel>>> getPlans() async {
    try {
      final response = await api.get(EndPoints.getPlans);
      final List<dynamic> data = (response is List)
          ? response
          : (response['list'] ?? []);

      final plans = data
          .map((e) => PlanModel.fromMap(e as Map<String, dynamic>))
          .toList();
      return Right(plans);
    } catch (e) {
      return Left("Failed to load plans: ${e.toString()}");
    }
  }
}
