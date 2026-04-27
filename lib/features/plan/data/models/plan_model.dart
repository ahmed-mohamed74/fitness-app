import 'package:fitness_app/features/plan/data/models/step_model.dart';

class PlanModel {
  final int? id;
  final String? name;
  final String? description;
  final int? durationWeeks;
  final String? level;
  final String? image;
  final List<StepModel>? steps;

  PlanModel({
    this.id,
    this.name,
    this.description,
    this.durationWeeks,
    this.level,
    this.image,
    this.steps,
  });

  factory PlanModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) return PlanModel();

    return PlanModel(
      id: map['id'] as int?,
      name: map['name'] as String?,
      description: map['description'] as String?,
      durationWeeks: map['durationWeeks'] as int?,
      level: map['level'] as String?,
      image: map['image'] as String?,
      // Safe parsing for the list
      steps: map['steps'] != null
          ? (map['steps'] as List)
                .map((x) => StepModel.fromMap(x as Map<String, dynamic>?))
                .toList()
          : null,
    );
  }
}


