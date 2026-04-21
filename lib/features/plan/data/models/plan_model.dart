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

class StepModel {
  final int? week;
  final int? day;
  final String? workoutName;
  final int? duration;
  final String? reps;

  StepModel({this.week, this.day, this.workoutName, this.duration, this.reps});

  factory StepModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) return StepModel();

    return StepModel(
      week: map['week'] as int?,
      day: map['day'] as int?,
      workoutName: map['workoutName'] as String?,
      duration: map['duration'] as int?,
      reps: map['reps'] as String?,
    );
  }
}
